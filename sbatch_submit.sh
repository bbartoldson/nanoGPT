#!/bin/bash
#SBATCH --job-name=auto
#SBATCH --nodes=1
#SBATCH -A m4536
#SBATCH --constraint gpu_hbm80g
#SBATCH --gpus-per-node 4
#SBATCH --time 48:00:00
#SBATCH -q regular

# option to add dependency: -d 29775949

torchrun --standalone --nproc_per_node=4 train.py config/train_gpt2.py

# calling again in case the first call fails
torchrun --standalone --nproc_per_node=4 train.py config/train_gpt2.py