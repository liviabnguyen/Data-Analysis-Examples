#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=32G
#SBATCH --output=%j.stdout
#SBATCH --error=%j.stderr
#SBATCH --mail-user=lnguy091@ucr.edu
#SBATCH --mail-type=ALL
#SBATCH --time=01:00:00
#SBATCH --job-name="short"
#SBATCH -p short

module unload miniconda2
module load miniconda3
source activate PyEnv3

KMER_TABLE="/rhome/lnguy091/bigdata/Project/Kmer-it/results/kmer_counts/kmer_counts_12mers_anno_GC_TMM.txt"
HEADER="/rhome/lnguy091/bigdata/Project/Kmer-it/results/abund/header.txt"
TAILER="/rhome/lnguy091/bigdata/Project/Kmer-it/results/abund/tailer.txt"
OUT="/rhome/lnguy091/bigdata/Project/Kmer-it/results/abund/kmer_abund.txt"

# make header
head -n 1 "$KMER_TABLE" | cut -f3- | sed '1s/^/Feature\t/' > "$HEADER"

# combine files in column-wise manner (in naming order)
python 3b_merge.py > "$TAILER"

# add feature names
paste <(cut -f1 /rhome/lnguy091/bigdata/Project/Kmer-it/results/abund/part_3.txt) "$TAILER" > "$TAILER".tmp

# join header and tailer
cat "$HEADER" "$TAILER".tmp  > "$OUT"
rm "$TAILER".tmp
