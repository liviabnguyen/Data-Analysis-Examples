#!/bin/bash 

module load jellyfish/2.2.9

INPUT=A_thal_single_copy_buscos.fa
OUTPUT=kmers_in_buscos.txt.gz 

jellyfish count -C -m 12 -s 500M -o temp.jf "$INPUT"
jellyfish dump -tc temp.jf | gzip > "$OUTPUT"