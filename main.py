#!usr/bin/python

from mininet.cli import CLI
from mininet.topo import Topo
from mininet.net import Mininet
from mininet.link import TCLink
from mininet.node import OVSSwitch, RemoteController
from mininet.log import setLogLevel
from mininet.term import makeTerm
from mininet.examples.consoles import*

from collections import defaultdict

from utility.txt import read_txt, read_path, link_load
from utility.path import path_install

from sys import argv
import time
import csv
import os

class MyTopo( Topo ):

    def __init__( self, file_name, file_link ):
        Topo.__init__( self )
        if file_link is None:
            node_list, link_pair_list = read_txt(file_name)
        else:
            node_list, link_pair_list = link_load(file_name, file_link)
        """
        for l in link_pair_list:
            print l
        print node_list"""

        self.node2switch = dict()
        self.add_switch( node_list )
        self.add_host()
        self.add_link( link_pair_list )


    def add_switch( self, node_list ):
        for i, sw in enumerate(node_list):

            self.node2switch[sw] = self.addSwitch( 's'+str(int(sw)+1) , protocols='OpenFlow10')

    def add_link( self, link_pair_list ):
        for link in link_pair_list:
            src, dst, capacity = self.node2switch[link[0]], self.node2switch[link[1]], float(link[2])
            src_no , dst_no = int(src[1:]), int(dst[1:])
            """
            print "src: %s, dst: %s, capacity: %s"%(src, dst, capacity)
            print "src_no: %d, dst_no: %d "%(src_no, dst_no)"""
            self.addLink( src, dst, dst_no, src_no, bw = capacity )

        for i , sw in enumerate(self.switches()):
            src, dst = 's'+str(i+1), 'h'+str(i+1)
            src_no , dst_no = i+1, i+1001
            """
            print "src: %s, dst: %s"%(src, dst)
            print "src_no: %d, dst_no: %d "%(src_no, dst_no)"""
            self.addLink( src, dst, dst_no, src_no)

    def add_host( self ):
        for i, sw in enumerate(self.switches()):
            self.addHost('h'+str(i+1))

class Path:

    def __init__( self, file_name ):
        #node_list = read_txt(file_name)[0]
        self.node_port_used = defaultdict(int)
        self.path_dict = defaultdict(list)
        self.path_to_dict(read_path( file_name ))

    def path_to_dict( self, path ):
        for demand in path:
            for p in demand:
                #print p
                key = str(int(p[0])+1) + '_' + str(int(p[1])+1)
                bw = p[-1]['BW']
                path = [str(int(d)+1) for d in p[3:-1]]
                self.path_dict[key].append({'path':path, 'bw':bw})

    def set_path( self ):
        for key, value in self.path_dict.items():
            src, dst = key.split('_')
            for d in value:
                ip_src = '10.0.0.' + src
                ip_dst = '10.0.0.' + dst
                self.node_port_used[src] += 1
                self.node_port_used[dst] += 1
                src_port = self.node_port_used[src]
                dst_port = self.node_port_used[dst]
                d['ip_src'] = ip_src
                d['ip_dst'] = ip_dst
                d['src_port'] = src_port
                d['dst_port'] = dst_port
                path_install( d )

def start_run( net, path ):
    m_count = 0
    count = 0
    for key, d in path.path_dict.items():
        src, dst = key.split('_')
        count = 0
        for p in d:
            dst_port = p['dst_port']
            #net.terms += makeTerm(net.get('h'+ dst), cmd = "iperf3 -s -i 0 -f m -p %d"%(dst_port))

            net.get('h'+ dst).cmd("iperf3 -s -i 0 -f k -p %d >%s &"%(dst_port,'data/'+str(m_count)+'-'+str(count)))
            p['file'] = str(m_count)+'-'+str(count)
            count += 1
            time.sleep(0.05)
        m_count += 1
    time.sleep(1)
    for key, d in path.path_dict.items():
        src, dst = key.split('_')
        for p in d:
            print p
            ip_src = p['ip_src']
            ip_dst = p['ip_dst']
            src_port = p['src_port']
            dst_port = p['dst_port']
            bw = p['bw']
            #net.terms += makeTerm(net.get('h'+ src), cmd = "iperf3 -c %s -i 1 -b %sm -l 0.05K -t 5 -p %s -B %s --cport %s "%(ip_dst,str(bw),str(dst_port),ip_src,str(src_port)))
            net.get('h'+ src).cmd("iperf3 -c %s -i 1 -b %sm -l 0.05K -t 5 -p %s -B %s --cport %s &"%(ip_dst,str(bw),str(dst_port),ip_src,str(src_port)))
            time.sleep(0.005)
    time.sleep(15)


def write_file( data ):
    output =list()
    for key, d in data.items():
        for p in d:
            temp = [ str(int(d)-1) for d in p['path']]
            output.append( temp + [p['file']])
    with open('output_info','w') as f:
        writer = csv.writer(f)
        writer.writerows(output)





def main():
    os.system('sudo mn -c')
    if len(argv) == 3:
        file_graph = argv[1]
        file_path = argv[2]
        file_link = None
    if len(argv) == 4:
        file_graph = argv[1]
        file_path = argv[2]
        file_link = argv[3]
    Topo = MyTopo(file_graph, file_link)

    net = Mininet( topo = Topo, build = False, ipBase='10.0.0.0/8',
                    switch = OVSSwitch, link = TCLink,
                    autoStaticArp = True, cleanup = True, autoSetMacs = True)

    net.start()
    path = Path(file_path)
    path.set_path()
    start_run( net, path )
    #CLI(net)
    write_file( path.path_dict )
    net.stop()


if __name__ == '__main__':
    main()
