# this gets you 64 GB of RAM with 4 threads for 2 hours 
srun --x11 --partition=koeniglab --mem=64gb --cpus-per-task 4 --ntasks=1 --time 2:00:00 --pty bash -l