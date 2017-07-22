#!/bin/bash
:'
for i in {70..0..10}
do
  #echo "sudo python main.py bv_numofM/di-yuan/di-yuan_graph bv_numofM/di-yuan/di-yuan_gkns${i}_path bv_numofM/di-yuan/di-yuan_gkns${i}_linkload_c"
  #sudo python main.py bv_numofM/di-yuan/di-yuan_graph bv_numofM/di-yuan/di-yuan_gkns${i}_path bv_numofM/di-yuan/di-yuan_gkns${i}_linkload_c

  #echo "sudo python cal_data.py bv_numofM/di-yuan/di-yuan_gkns${i}_path"
  #sudo python cal_data.py bv_numofM/di-yuan/di-yuan_gkns${i}_path

  echo "sudo python main.py bv_numofM/pdh/pdh_graph bv_numofM/pdh/pdh_gkns${i}_path bv_numofM/pdh/pdh_gkns${i}_linkload_c"
  sudo python main.py bv_numofM/pdh/pdh_graph bv_numofM/pdh/pdh_gkns${i}_path bv_numofM/pdh/pdh_gkns${i}_linkload_c
  sleep 5
  echo "sudo python cal_data.py bv_numofM/pdh/pdh_gkns${i}_path"
  sudo python cal_data.py bv_numofM/pdh/pdh_gkns${i}_path
  sleep 5
  sudo mn -c
  sleep 5
done'

for i in {10..90..10}
do
#  echo "sudo python main.py bv_numofM/di-yuan/di-yuan_graph bv_numofM/di-yuan/di-yuan_pd${i}_10_path bv_numofM/di-yuan/di-yuan_pd${i}_10_linkload_c"
#  sudo python main.py bv_numofM/di-yuan/di-yuan_graph bv_numofM/di-yuan/di-yuan_pd${i}_10_path bv_numofM/di-yuan/di-yuan_pd${i}_10_linkload_c
#  echo "sudo python cal_data.py bv_numofM/di-yuan/di-yuan_pd${i}_10_path"
#  sudo python cal_data.py bv_numofM/di-yuan/di-yuan_pd${i}_10_path
#  sudo mn -c

#  echo "sudo python main.py bv_numofM/di-yuan/di-yuan_graph bv_numofM/di-yuan/di-yuan_pd${i}_90_path bv_numofM/di-yuan/di-yuan_pd${i}_90_linkload"
#  sudo python main.py bv_numofM/di-yuan/di-yuan_graph bv_numofM/di-yuan/di-yuan_pd${i}_90_path bv_numofM/di-yuan/di-yuan_pd${i}_90_linkload
#  echo "sudo python cal_data.py bv_numofM/di-yuan/di-yuan_pd${i}_90_path"
#  sudo python cal_data.py bv_numofM/di-yuan/di-yuan_pd${i}_90_path
#  sudo mn -c

echo "sudo python main.py bv_numofM/pdh/pdh_graph bv_numofM/pdh/pdh_pd${i}_90_path bv_numofM/pdh/pdh_pd${i}_90_linkload"
sudo python main.py bv_numofM/pdh/pdh_graph bv_numofM/pdh/pdh_pd${i}_90_path bv_numofM/pdh/pdh_pd${i}_90_linkload
sleep 5
echo "sudo python cal_data.py bv_numofM/pdh/pdh_pd${i}_90_path"
sudo python cal_data.py bv_numofM/pdh/pdh_pd${i}_90_path
sleep 5
sudo mn -c
sleep 5
done
