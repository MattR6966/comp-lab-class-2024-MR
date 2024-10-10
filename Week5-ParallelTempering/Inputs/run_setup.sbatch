#!/bin/bash

#SBATCH --job-name=ala2_md

#SBATCH --output=ala2_md.out

#SBATCH --error=ala2_md.err

#SBATCH --time=00:05:00           # Set time limit (5 minutes, adjust if needed)

#SBATCH --cpus-per-task=1         # Use 1 CPU

#SBATCH --mem=2G                  # Request 2 GB of memory

#SBATCH --partition= 3# Change this to your partition if necessary



# Load GROMACS module

module load gromacs/openmpi/intel/2018.3



# Change to the working directory

cd ~/comp-lab-class/comp-lab-class-2024-MR/Week5-ParallelTempering/Inputs/ 



# Preprocess the input files with grompp

gmx grompp -f adp_T300.mdp -c adp.gro -p adp.top -o output.tpr



# Run the MD simulation

gmx mdrun -deffnm output -nt 1 -nsteps 15000 # 15 ns at 1 ns/step



# Optional: Clean up temporary files if necessary

# rm -f *.tpr *.log *.edr *.cpt



