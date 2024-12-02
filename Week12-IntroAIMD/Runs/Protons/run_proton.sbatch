#!/bin/bash

#SBATCH --job-name=water_simulation

#SBATCH --ntasks-per-node=12

#SBATCH --nodes=1

#SBATCH --mem=20GB

#SBATCH --cpus-per-task=1

#SBATCH --time=6:00:00

#SBATCH --output=proton_simulation.out


module purge
module load cp2k/openmpi/intel/20201212



mpirun -np 12 cp2k.popt -i proton.inp -o proton_aimd_1ns_0.5fs.log

