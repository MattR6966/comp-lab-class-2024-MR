#!/bin/bash

#SBATCH --job-name=create_anneal

#SBATCH --output=create_anneal.out

#SBATCH --error=create_anneal.err

#SBATCH --ntasks=4

#SBATCH --cpus-per-task=1

#SBATCH --time=01:00:00



# Load necessary modules



# Create the system

mpirun lmp -var configfile ../Inputs/n360/kalj_n360_create.lmp -var id 1 -in ../Inputs/create_3d_binary.lmp -log create_system.log



# Equilibrate at different temperatures

temperatures=(1.5 1.0 0.9 0.8 0.7 0.65 0.6 0.55 0.5 0.475)



for temp in "${temperatures[@]}"; do

    mpirun lmp -var configfile ../Inputs/n360/kalj_n360_T${temp}.lmp -var id 1 -in ../Inputs/anneal_3d_binary.lmp -log anneal_T${temp}.log

done
