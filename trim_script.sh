#!/bin/bash
#SBATCH -N 1 -n 8 --time=1:30:00 --mem=20gb
#SBATCH -J Trimmomatic
echo "$HOSTNAME is trimming adapter on 'date'"

module purge 
module load Trimmomatic/0.39-Java-11

P1=/mnt/scratch/jenchiay/Reference/Romanowski2020/ERR3310$x"_1.fastq"
P2=/mnt/scratch/jenchiay/Reference/Romanowski2020/ERR3310$x"_2.fastq"
Adapters=/mnt/home/jenchiay/TruSeq2-PE.fa
java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar PE -threads 8 $P1 $P2 ERR3310$x"_1_trimmed.fastq" ERR3310$x"_1_orphan.fastq" ERR3310$x"_2_trimmed.fastq" ERR3310$x"_2_orphan.fastq" ILLUMINACLIP:$Adapters:2:40:15 SLIDINGWINDOW:4:20 MINLEN:50

echo "details of the job and queue"
scontrol show job ${SLURM_JOBID}