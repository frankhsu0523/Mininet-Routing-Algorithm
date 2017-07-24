#!/bin/bash
for i in {6..9}
do
  echo "sudo python main.py compress_2x/di-yuan/di-yuan_graph compress_2x/di-yuan/di-yuan_pd10lp_10_path compress_2x/di-yuan/di-yuan_pdlp10_10_linkload_c_2x"
  sudo python main.py compress_2x/di-yuan/di-yuan_graph compress_2x/di-yuan/di-yuan_pdlp10_10_path compress_2x/di-yuan/di-yuan_pdlp10_10_linkload_c_2x
  sleep 5
  echo "sudo python cal_data.py compress_2x/di-yuan/di-yuan_pdlp10_10_path compress_2x/di-yuan/di-yuan_pdlp10_10_path_$i"
  sudo python cal_data.py compress_2x/di-yuan/di-yuan_pdlp10_10_path compress_2x/di-yuan/di-yuan_pdlp10_10_path_$i
  sudo mn -c
  sleep 5
done
:'
for i in {6..9}
do
  echo "sudo python main.py compress_2x/di-yuan/di-yuan_graph compress_2x/di-yuan/di-yuan_gkns10_path compress_2x/di-yuan/di-yuan_gkns10_linkload_c_2x"
  sudo python main.py compress_2x/di-yuan/di-yuan_graph compress_2x/di-yuan/di-yuan_gkns10_path compress_2x/di-yuan/di-yuan_gkns10_linkload_c_2x
  sleep 5
  echo "sudo python cal_data.py compress_2x/di-yuan/di-yuan_gkns10_path compress_2x/di-yuan/di-yuan_gkns10_path_$i"
  sudo python cal_data.py compress_2x/di-yuan/di-yuan_gkns10_path compress_2x/di-yuan/di-yuan_gkns10_path_$i
  sudo mn -c
  sleep 5
done
'
:'
for i in {10..50..10}
do
  echo "sudo python main.py bv_numofM0.4/$1/$1_graph bv_numofM0.4/$1/$1_gkns${i}_path bv_numofM0.4/$1/$1_gkns${i}_linkload_c"
  sudo python main.py bv_numofM0.4/$1/$1_graph bv_numofM0.4/$1/$1_gkns${i}_path bv_numofM0.4/$1/$1_gkns${i}_linkload_c
  sleep 5
  echo "sudo python cal_data.py bv_numofM0.4/$1/$1_gkns${i}_path"
  sudo python cal_data.py bv_numofM0.4/$1/$1_gkns${i}_path
  sleep 5
  sudo mn -c
  sleep 5

done


for i in {60..90..10}
do
  echo "sudo python main.py bv_numofM0.4/$1/$1_graph bv_numofM0.4/$1/$1_gkns${i}_path bv_numofM0.4/$1/$1_gkns${i}_linkload_c"
  sudo python main.py bv_numofM0.4/$1/$1_graph bv_numofM0.4/$1/$1_gkns${i}_path bv_numofM0.4/$1/$1_gkns${i}_linkload_c
  sleep 5
  echo "sudo python cal_data.py bv_numofM0.4/$1/$1_gkns${i}_path"
  sudo python cal_data.py bv_numofM0.4/$1/$1_gkns${i}_path
  sleep 5
  sudo mn -c
  sleep 5

done
'
:'
for i in {10..50..10}
do
  echo "sudo python main.py bv_numofM0.4/$1/$1_graph bv_numofM0.4/$1/$1_pd${i}_10_path bv_numofM0.4/$1/$1_pd${i}_10_linkload_c"
  sudo python main.py bv_numofM0.4/$1/$1_graph bv_numofM0.4/$1/$1_pd${i}_10_path bv_numofM0.4/$1/$1_pd${i}_10_linkload_c
  sleep 5
  echo "sudo python cal_data.py bv_numofM0.4/$1/$1_pd${i}_10_path"
  sudo python cal_data.py bv_numofM0.4/$1/$1_pd${i}_10_path
  sleep 5
  sudo mn -c
  sleep 5

  echo "sudo python main.py bv_numofM0.4/$1/$1_graph bv_numofM0.4/$1/$1_pd${i}_90_path bv_numofM0.4/$1/$1_pd${i}_90_linkload_c"
  sudo python main.py bv_numofM0.4/$1/$1_graph bv_numofM0.4/$1/$1_pd${i}_90_path bv_numofM0.4/$1/$1_pd${i}_90_linkload_c
  sleep 5
  echo "sudo python cal_data.py bv_numofM0.4/$1/$1_pd${i}_90_path"
  sudo python cal_data.py bv_numofM0.4/$1/$1_pd${i}_90_path
  sleep 5
  sudo mn -c
  sleep 5
done
'
:'
for i in {60..90..10}
do
  echo "sudo python main.py bv_numofM0.4/$1/$1_graph bv_numofM0.4/$1/$1_pd${i}_10_path bv_numofM0.4/$1/$1_pd${i}_10_linkload_c"
  sudo python main.py bv_numofM0.4/$1/$1_graph bv_numofM0.4/$1/$1_pd${i}_10_path bv_numofM0.4/$1/$1_pd${i}_10_linkload_c
  sleep 5
  echo "sudo python cal_data.py bv_numofM0.4/$1/$1_pd${i}_10_path"
  sudo python cal_data.py bv_numofM0.4/$1/$1_pd${i}_10_path
  sleep 5
  sudo mn -c
  sleep 5

  echo "sudo python main.py bv_numofM0.4/$1/$1_graph bv_numofM0.4/$1/$1_pd${i}_90_path bv_numofM0.4/$1/$1_pd${i}_90_linkload_c"
  sudo python main.py bv_numofM0.4/$1/$1_graph bv_numofM0.4/$1/$1_pd${i}_90_path bv_numofM0.4/$1/$1_pd${i}_90_linkload_c
  sleep 5
  echo "sudo python cal_data.py bv_numofM0.4/$1/$1_pd${i}_90_path"
  sudo python cal_data.py bv_numofM0.4/$1/$1_pd${i}_90_path
  sleep 5
  sudo mn -c
  sleep 5
done
'
