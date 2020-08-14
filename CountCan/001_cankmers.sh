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
#SBATCH --array=5-20
​
# load modules Jelly Fish
module load jellyfish/2.3.0

INPUT="/rhome/lnguy091/bigdata/Project/RM/Brachypodium_distachyon.Brachypodium_distachyon_v3.0.dna_rm.toplevel.fa"
OUTPUT="/rhome/lnguy091/bigdata/Project/CAN/results/Brachy"
​
# annotate genome with library

jellyfish count -C -m ${SLURM_ARRAY_TASK_ID} -s 500M -o temp.jf "$INPUT"
jellyfish dump -tc temp.jf | gzip > "$OUTPUT"_${SLURM_ARRAY_TASK_ID}.txt.gz
