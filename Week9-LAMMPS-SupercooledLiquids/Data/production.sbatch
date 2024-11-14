#!/bin/bash

#SBATCH --job-name=production_runs

#SBATCH --output=production_runs.out

#SBATCH --error=production_runs.err

#SBATCH --ntasks=4

#SBATCH --cpus-per-task=1

#SBATCH --time=00:20:00



# Load necessary modules

module load lammps



# Run production simulations at different temperatures

temperatures=(1.5 1.0 0.9 0.8 0.7 0.65 0.6 0.55 0.5 0.475)



for temp in "${temperatures[@]}"; do

    mpirun lmp -var configfile ../Inputs/n360/kalj_n360_T${temp}.lmp -var id 1 -in ../Inputs/production_3d_binary.lmp -log production_T${temp}.log

done
