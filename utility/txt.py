from Color import bcolors
import os
import csv
import copy
import pandas as pd

def read_txt(File_Name):
    with open(File_Name+'.txt','r') as f:
        contents = f.readlines()
    contents = [x.strip() for x in contents]
    switch =False
    table = list()
    Link_Pair_List = list()
    Node_List = list()
    for element in contents :
        if switch == True:
            if tuple(element.split()[:2]) not in table:
                Link_Pair_List.append(element.split())
                a = element.split()[0]
                b = element.split()[1]
                table.append((a,b))
                table.append((b,a))
        else :
            if element[0].isdigit():
                Node_List.append(element.split()[0])
        if element == 'bandwidth':
            switch = True
    return Node_List, Link_Pair_List

def link_load(File_Name, Link_Name):
    with open(File_Name+'.txt','r') as f:
        contents = f.readlines()
    with open(Link_Name+'.csv','r') as f:
        reader = csv.reader(f)
        link_contents = list(reader)
    contents = [x.strip() for x in contents]
    switch =False
    table = list()
    Link_Pair_List = list()
    Node_List = list()
    for element in contents :
        if switch == True:
            pass
        else :
            if element[0].isdigit():
                Node_List.append(element.split()[0])
        if element == 'bandwidth':
            switch = True

    for row in link_contents[1:]:
        key = (row[0],row[1])
        if key not in table:
            Link_Pair_List.append([row[0],row[1],row[5]])
            a = row[0]
            b = row[1]
            table.append((a,b))
            table.append((b,a))
    print len(Link_Pair_List)
    return Node_List, Link_Pair_List


def read_path(File_Name):
    with open(File_Name+'.csv','r') as f:
        Total_Path = list()
        first_list = list()
        set_list = list()
        temp = list()
        for row in csv.reader(f):
            second_list = row
            info = dict()
            if not first_list or (second_list[0] == first_list[0] and second_list[-2] == first_list[-2]) :
                temp = copy.deepcopy(second_list)
                bw = temp.pop()
                info['BW'] = bw
                temp.append(info)
                set_list.append(temp)
                first_list = second_list
            else :
                Total_Path.append(set_list)
                set_list = []
                temp = copy.deepcopy(second_list)
                bw = temp.pop()
                info['BW'] = copy.deepcopy(bw)
                temp.append(info)
                set_list.append(temp)
                first_list = second_list
        Total_Path.append(set_list)
        del Total_Path[0]
        return Total_Path

#if __name__ == '__main__':
    #Read_txt('abilene')
    #Read_path('abilene','gk10_greedy_0')
