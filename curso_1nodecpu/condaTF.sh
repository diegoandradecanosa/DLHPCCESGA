#!/bin/bash
module load miniconda3
conda env remove -n mytf
conda create -y -n mytf
conda activate mytf
conda install -y tensorflow
