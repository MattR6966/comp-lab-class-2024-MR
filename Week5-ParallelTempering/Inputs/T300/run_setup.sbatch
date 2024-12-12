#!/bin/bash

#SBATCH --job-name=ala2_md

#SBATCH --output=ala2_md.out

#SBATCH --error=ala2_md.err

#SBATCH --time=00:05:00           # Set time limit (5 minutes, adjust if needed)

#SBATCH --cpus-per-task=1         # Use 1 CPU

#SBATCH --mem=2G                  # Request 2 GB of memory


# Load GROMACS module
module purge
module load gromacs/openmpi/intel/2018.3



# Change to the working directo/ 



# Preprocess the input files with grompp

gmx_mpi mdrun -s adp_T300.tpr -o adp_T300.trr -c adp_T300.gro -g adp_T300.log



# Run the MD simulation

gmx mdrun -deffnm output -nt 1 -nsteps 15000 # 15 ns at 1 ns/step



# Optional: Clean up temporary files if necessary

# rm -f *.tpr *.log *.edr *.cpt



