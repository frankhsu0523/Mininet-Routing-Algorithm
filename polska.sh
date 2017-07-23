#!/bin/bash

for i in {10..99}
do
  echo "sudo python main.py bv_numofM/polska/polska_graph bv_numofM/polska/polska_gkns${i}_path bv_numofM/polska/polska_gkns${i}_linkload_c"
  sudo python main.py bv_numofM/polska/polska_graph bv_numofM/polska/polska_gkns${i}_path bv_numofM/polska/polska_gkns${i}_linkload_c
  sleep 5
  echo "sudo python cal_data.py bv_numofM/polska/polska_gkns${i}_path"
  sudo python cal_data.py bv_numofM/polska/polska_gkns${i}_path
  sleep 5
  sudo mn -c
  sleep 5

done

for i in {10..99}
do
  echo "sudo python main.py bv_numofM/polska/polska_graph bv_numofM/polska/polska_pd${i}_10_path bv_numofM/polska/polska_pd${i}_10_linkload_c"
  sudo python main.py bv_numofM/polska/polska_graph bv_numofM/polska/polska_pd${i}_10_path bv_numofM/polska/polska_pd${i}_10_linkload_c
  sleep 5
  echo "sudo python cal_data.py bv_numofM/polska/polska_pd${i}_90_path"
  sudo python cal_data.py bv_numofM/polska/polska_pd${i}_90_path
  sleep 5
  sudo mn -c
  sleep 5

  echo "sudo python main.py bv_numofM/polska/polska_graph bv_numofM/polska/polska_pd${i}_90_path bv_numofM/polska/polska_pd${i}_90_linkload"
  sudo python main.py bv_numofM/polska/polska_graph bv_numofM/polska/polska_pd${i}_90_path bv_numofM/polska/polska_pd${i}_90_linkload
  sleep 5
  echo "sudo python cal_data.py bv_numofM/polska/polska_pd${i}_90_path"
  sudo python cal_data.py bv_numofM/polska/polska_pd${i}_90_path
  sleep 5
  sudo mn -c
  sleep 5
done
