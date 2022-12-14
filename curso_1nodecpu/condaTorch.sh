#!/bin/bash
module load miniconda3
conda env remove -n mytorch python=3.9
conda create -y -n mytorch 
conda activate mytorch
conda install -y pytorch torchvision torchaudio -c pytorch
