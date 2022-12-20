#!/bin/bash

#module reset
#module load miniconda3
#conda activate mytorch
#srun python mnist_classify_ddp.py --epochs=2
source $LUSTRE/mytorch/bin/activate
python mnist_classify_ddp.py --epochs=2

