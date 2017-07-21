#!/usr/bin/python
from Color import bcolors
import xml.etree.ElementTree as ET
import os

def Read_Switch_XML(File_Name):
    tree = ET.parse(File_Name)
    root = tree.getroot()
    """ ----------------------- Create Node List  -----------------------  """
    Node_List = list()
    for node in root.findall('networkStructure/nodes/node'):
        Node_List.append(node.get('id'))
    """ ----------------------- Create Link Pairs -----------------------  """
    Link_Pair_List = list()
    for link in root.findall('networkStructure/links/link'):
        source = link.find('source').text
        target = link.find('target').text
        addModules = link.find('additionalModules')
        if  File_Name != 'atlanta.xml':
            if len(addModules) < 1:
                print bcolors.WARNING + "Can't get Capacity !" + bcolors.ENDC
            else:
                capacity = addModules[0].find('capacity').text
                Link_Pair_List.append([source,target,capacity])
        else:
            if len(addModules) < 2:
                print bcolors.WARNING + "Can't get Capacity !" + bcolors.ENDC
            else:
                capacity = addModules[0].find('capacity').text
                Link_Pair_List.append([source,target,float(capacity)])
    """ ----------------------- Create Request_List -----------------------  """
    Request_List = list()
    for demand in root.iter('demand'):
        #print [demand[0].text,demand[1].text,demand[2].text]
        Request_List.append([demand[0].text,demand[1].text,demand[2].text])
    #for i in Node_List:print i
    return Node_List, Link_Pair_List, Request_List
"""
if __name__ == '__main__':
    Read_Switch_XML('1.xml')
"""
