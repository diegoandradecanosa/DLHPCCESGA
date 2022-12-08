#!/bin/bash

module reset
module load miniconda3
conda activate mytorch
#srun python mnist_classify_ddp.py --epochs=2
python mnist_classify_ddp.py --epochs=2

