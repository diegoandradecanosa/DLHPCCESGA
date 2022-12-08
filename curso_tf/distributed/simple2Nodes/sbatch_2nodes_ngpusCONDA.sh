#!/bin/sh
#SBATCH -J jsimple       # Job name
#SBATCH -o jsimple.o%j   # Name of stdout output file(%j expands to jobId)
#SBATCH -e jsimple_job.o%j   # Name of stderr output file(%j expands to jobId)
#SBATCH -N 2
#SBATCH --ntasks-per-node=1
#SBATCH --gpus=2
#SBATCH -c 16
#SBATCH --mem=8G
#SBATCH -t 00:59:00
#SBATCH -p short --qos=short

module reset
module load miniconda3
conda activate $LUSTRE/conda/mytf2


echo SLURM_NTASKS: $SLURM_NTASKS
echo SLURM_CPUS_PER_TASK: $SLURM_CPUS_PER_TASK
echo SLURM_NNODES: $SLURM_NNODES
echo SLURM_NTASKS_PER_NODE: $SLURM_NTASKS_PER_NODE

PS=1
WORKERS=$((SLURM_NTASKS-PS))



srun -n $SLURM_NTASKS -c $SLURM_CPUS_PER_TASK  --resv-ports=$SLURM_NTASKS_PER_NODE -l /mnt/lustre/scratch/nlsas/home/ulc/es/dac/conda/mytf2/bin/python $1 -workers $WORKERS
#srun -n $SLURM_NTASKS -c $SLURM_CPUS_PER_TASK  --resv-ports=$SLURM_NTASKS_PER_NODE -l $1
