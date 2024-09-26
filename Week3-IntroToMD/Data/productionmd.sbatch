#!/bin/bash



## The #SBATCH lines are read by SLURM for options.

## In the lines below we ask for a single node, one task for that node, and one cpu for each task.

#SBATCH --nodes=1

#SBATCH --ntasks-per-node=1

#SBATCH --cpus-per-task=4



## Time is the estimated time to complete, in this case 5 hours.

#SBATCH --time=2:00:00



## We expect no more than 2GB of memory to be needed

#SBATCH --mem=8GB



## To make them easier to track, it's best to name jobs something recognizable.

## You can then use the name to look up reports with tools like squeue.

#SBATCH --job-name=productionmd_MR



## These lines manage mail alerts for when the job ends and who the email should be sent to.

#SBATCH --mail-type=END

#SBATCH --mail-user=mr6966@nyu.edu



## This places the standard output and standard error into the same file, in this case slurm_<job_id>.out

#SBATCH --output=/home/mr6966/comp-lab-class/comp-lab-class-2024-MR/Week3-IntroToMD/Input/slurm_%j.out



## First we ensure a clean environment by purging the current one

module purge



## Load the desired software, in this case stata 14.2

module load gromacs/openmpi/intel/2020.4



## Create a unique directory to run the job in.

RUNDIR=/home/mr6966/comp-lab-class/comp-lab-class-2024-MR/Week3-IntroToMD/Input

mkdir -p $RUNDIR



## Set an environment variable for where the data is stored.

DATADIR=/home/mr6966/comp-lab-class/comp-lab-class-2024-MR/Week3-IntroToMD/Data



## Change directories to the unique run directory

cd $RUNDIR



## Execute the desired Stata do file script
gmx_mpi grompp -f md.mdp -c trp_cage_npt.gro -p trp_cage.top -o $DATADIR/ trp_cage_md.tpr
gmx_mpi mdrun -deffnm trp_cage_md




