#!/bin/bash -l

# SLURM SUBMIT SCRIPT
#SBATCH -N 2             # This needs to match Trainer(num_nodes=...)
#SBATCH --gres=gpu:a100:2
#SBATCH --ntasks-per-node=2   # This needs to match Trainer(devices=...)
#SBATCH --mem=8G
#SBATCH -c 32
#SBATCH --time=0-00:59:00

# activate conda env
module load miniconda3
source activate mytorch

# debugging flags (optional)
export NCCL_DEBUG=INFO
export PYTHONFAULTHANDLER=1

# on your cluster you might need these:
# set the network interface
# export NCCL_SOCKET_IFNAME=^docker0,lo
# might need the latest CUDA
# module load NCCL/2.4.7-1-cuda.10.0

# run script from above
srun /mnt/netapp2/Store_uni/home/ulc/es/dac/conda/envs/mytorch/bin/python sampleLIDeepSpeed.py

# Based on: https://pytorch-lightning.readthedocs.io/en/stable/clouds/cluster_advanced.html