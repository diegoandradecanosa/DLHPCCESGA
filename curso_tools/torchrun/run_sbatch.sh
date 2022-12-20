#!/bin/bash
#SBATCH --job-name=ddp-torch     # create a short name for your job
#SBATCH -N 2              # node count
#SBATCH -n 2      # total number of tasks
#SBATCH --cpus-per-task=64        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem=32G                # total memory per node (4 GB per cpu-core is default)
#SBATCH --gres=gpu:a100:2        # number of gpus per node
#SBATCH --time=00:25:00          # total run time limit (HH:MM:SS)

#module load cuda miniconda3
#conda init zsh
#conda activate mytorch
source $LUSTRE/mytorch/bin/activate

echo "SLURM_JOB_NUM_NODES $SLURM_JOB_NUM_NODES"
echo "HOSTNAME $HOSTNAME"

echo "Args train.sh: $@"

srun train.sh $HOSTNAME $@