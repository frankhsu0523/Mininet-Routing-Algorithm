from os import system

def path_install( path_dict ):
    ip_src = path_dict['ip_src']
    ip_dst = path_dict['ip_dst']
    src_port = path_dict['src_port']
    dst_port = path_dict['dst_port']
    path = path_dict['path']
    #print path_dict
    for i, d in enumerate(path):
        if i == 0:
            sw = path[i]
            in_port = 1000 + int(path[i])
            out_port = int(path[i+1])
        elif i == len(path)-1:
            sw = path[i]
            in_port = int(path[i-1])
            out_port = 1000 + int(path[i])
        else:
            sw = path[i]
            in_port = int(path[i-1])
            out_port = int(path[i+1])

        #print 'ovs-ofctl add-flow s%s dl_type=0x0800,nw_proto=6,priority=10,in_port=%d,ip_src=%s,ip_dst=%s,tp_src=%d,tp_dst=%d,actions=output:%d'%(sw,in_port,ip_src,ip_dst,src_port,dst_port,out_port)
        system('ovs-ofctl add-flow s%s dl_type=0x0800,nw_proto=6,priority=10,in_port=%d,ip_src=%s,ip_dst=%s,tp_src=%d,tp_dst=%d,actions=output:%d'%(sw,in_port,ip_src,ip_dst,src_port,dst_port,out_port))
        system('ovs-ofctl add-flow s%s dl_type=0x0800,nw_proto=6,priority=10,in_port=%d,ip_src=%s,ip_dst=%s,tp_src=%d,tp_dst=%d,actions=output:%d'%(sw,out_port,ip_dst,ip_src,dst_port,src_port,in_port))
        
        system('ovs-ofctl add-flow s%s dl_type=0x0800,nw_proto=6,priority=9,in_port=%d,ip_src=%s,ip_dst=%s,actions=output:%d'%(sw,in_port,ip_src,ip_dst,out_port))
        system('ovs-ofctl add-flow s%s dl_type=0x0800,nw_proto=6,priority=9,in_port=%d,ip_src=%s,ip_dst=%s,actions=output:%d'%(sw,out_port,ip_dst,ip_src,in_port))
