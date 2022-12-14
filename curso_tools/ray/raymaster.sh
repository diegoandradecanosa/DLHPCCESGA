#!/bin/bash

head_node=${1}
head_node_ip=${2}
port=${3}

module load miniconda3
conda activate myray
srun --nodes=1 --ntasks=1 -w "$head_node" \
    ray start --head --node-ip-address="$head_node_ip" --port=$port \
    --num-cpus "${SLURM_CPUS_PER_TASK}" --num-gpus "${SLURM_GPUS_ON_NODE}" --block &
