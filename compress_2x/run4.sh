for topology in nobel-germany nobel-us norway pdh pioro40 #polska sun ta1 ta2 zib54
do
  cd ${topology}
  #../mcf_alg 1 ${topology}_graph.txt ${topology}_demands.txt #opt
  #../mcf_alg 3 ${topology}_graph.txt ${topology}_demands.txt #opt
  # for i in $(seq 51 99)
  # do
  #   #../mcf_alg 2 ${topology}_gk_opt.csv ${topology}_graph.txt ${topology}_demands.txt 0.${i} 0 2.0
  #   ../mcf_alg 4 ${topology}_pd_opt.csv ${topology}_graph.txt ${topology}_demands.txt 0.${i} 0.1 2.0 #ours
  #   ../mcf_alg 4 ${topology}_pd_opt.csv ${topology}_graph.txt ${topology}_demands.txt 0.${i} 0.9 2.0 #ours
  # done
  for i in $(seq 1 9)
  do
    ../mcf_alg 2 ${topology}_gk_opt.csv ${topology}_graph.txt ${topology}_demands.txt 0.${i} 0 2.0
    ../mcf_alg 4 ${topology}_pd_opt.csv ${topology}_graph.txt ${topology}_demands.txt 0.${i} 0.1 2.0 #ours
    ../mcf_alg 4 ${topology}_pd_opt.csv ${topology}_graph.txt ${topology}_demands.txt 0.${i} 0.9 2.0 #ours
  done
  # for i in $(seq 0 99)
  # do
  #   ../mcf_alg 5 ${topology}_graph.txt ${topology}_demands.txt ${i} 1 #k-path
  #   ../mcf_alg 5 ${topology}_graph.txt ${topology}_demands.txt ${i} 3 #k-path
  #   ../mcf_alg 5 ${topology}_graph.txt ${topology}_demands.txt ${i} 5 #k-path
  # done
  cd ..
done
#
# for topology in newyork norway pdh pioro40 polska ta1
# do
#   cd ${topology}
#   echo ${topology} gk
#   ../gk_algo ${topology}_graph.txt ${topology}_demands.txt 0.5 > ${topology}_gk5_log.txt
#   echo ${topology} pd
#   ../pd_algo ${topology}_graph.txt ${topology}_demands.txt 0.5 0.5  > ${topology}_pd55_log.txt
# done

#./gk_algo abilene_graph.txt abilene_demands.txt 0.5 > abilene_gk5_log.txt
#./pd_algo abilene_graph.txt abilene_demands.txt 0.5 0.5  > abilene_pd55_log.txt


# for i in $(seq 1 1)
# do
#   echo ./algo vm200idetical.csv input/user_list_00${i}.csv 2 4 2
#   ./algo vm200idetical.csv input/user_list_00${i}.csv 2 4 2 > log/log_00${i}.txt
# done

# for i in $(seq 10 99)
# do
#   echo ./algo vm200idetical.csv input/user_list_0${i}.csv 2 4 2
#   ./algo vm200idetical.csv input/user_list_0${i}.csv 2 4 2 > log/log_0${i}.txt
# done
#
# for i in $(seq 100 499)
# do
#   echo ./algo vm200idetical.csv input/user_list_${i}.csv 2 4 2
#   ./algo vm200idetical.csv input/user_list_${i}.csv 2 4 2 > log/log_${i}.txt
# done
