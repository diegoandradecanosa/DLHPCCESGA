#!/bin/bash

module load miniconda3
conda activate myray
python -u $1 "$SLURM_CPUS_PER_TASK"

