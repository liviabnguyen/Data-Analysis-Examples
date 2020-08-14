#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=32G
#SBATCH --output=%j.stdout
#SBATCH --error=%j.stderr
#SBATCH --mail-user=lnguy091@ucr.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name="annot"
#SBATCH -p koeniglab
 
# RepeatMasker 4.1.0

GENOME=/rhome/lnguy091/bigdata/Project/RM/Zm-B73-REFERENCE-NAM-5.0.fa

# annotate genome with library
RepeatMasker -gff -dir /rhome/lnguy091/bigdata/Project/RM/results "$GENOME"
