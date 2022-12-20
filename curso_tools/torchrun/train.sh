#!/bin/bash

TASKS_PER_NODE=$(( SLURM_NTASKS / SLURM_JOB_NUM_NODES ))
GPUS_PER_NODE=$(nvidia-smi --list-gpus | wc -l)
MASTER=$1
ARGS=${@:2}

echo "SLURM_JOB_NUM_NODES $SLURM_JOB_NUM_NODES SLURM_PROCID $SLURM_PROCID SLURM_NTASKS $SLURM_NTASKS TASKS_PER_NODE $TASKS_PER_NODE SLURM_NODEID $SLURM_NODEID MASTER $MASTER GPUS_PER_NODE $GPUS_PER_NODE ARGS $ARGS"

module load cuda
export NCCL_DEBUG=INFO
export NCCL_DEBUG_SUBSYS=ALL
source $LUSTRE/mytorch/bin/activate
which torchrun
#export NCCL_IB_DISABLE=1
#export NCCL_SOCKET_IFNAME=eth0
#export NCCL_SOCKET_IFNAME =lo
#torchrun --nproc_per_node=$GPUS_PER_NODE --nnodes $SLURM_JOB_NUM_NODES --node_rank $SLURM_NODEID --rdzv_id=$SLURM_JOB_ID --rdzv_endpoint=$MASTER:12373 --master_addr $MASTER mnist_classify_ddp.py $ARGS
torchrun --nproc_per_node=$TASKS_PER_NODE --nnodes $SLURM_JOB_NUM_NODES --node_rank $SLURM_NODEID --master_addr $MASTER mnist_classify_ddp.py $ARGS