#!/bin/bash

module purge

module load vmd/1.9.3

source /scratch/work/courses/CHEM-GA-2671-2024fa/software/lammps-gcc-30Oct2022/setup_lammps.bash



# Assume you have a static input file ready (e.g., "template.in") 

# that LAMMPS can read and that you modify only if necessary.

template_file="./Inputs/2dWCA.in"



for density in $(seq 0.5 0.1 1.1); do

    # Use the template file with a fixed density value in the simulation command.

    # Here, we could assume that the LAMMPS input script uses variable density

    mpirun lmp -in "$template_file" -var density "$density"



    # Run VMD without using redirection

    trajectory_file="2dWCA_T0.1_d${density}_N100000.lammpstrj"

    output_file="2dWCA_T0.1_d${density}_N100000.dcd"

    vmd "$trajectory_file" "$output_file"



    # No temporary input or output files are created in the script.

done



