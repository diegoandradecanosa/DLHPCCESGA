#!/bin/bash

module load gcc/system openmpi/4.0.5_ft3 pytorch torchvision
module load vtune
mkdir torch_result
aps -r torch_result python OneNodeResnet50TrainingTorch.py
aps –report torch_result

