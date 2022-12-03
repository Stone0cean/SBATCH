#!/bin/sh

#SBATCH --job-name=CircadianAnalysisJoey
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=5gb
#SBATCH --time=01:00:00
#SBATCH -o x0.0_FASTQC.out
#SBATCH -e x0.0_FASTQC.err

module purge
module load SRA-Toolkit/2.10.7-centos_linux64 FastQC/0.11.7-Java-1.8.0_162

cd /mnt/scratch/jenchiay
mkdir -p /mnt/scratch/jenchiay/FASTQCfile
mkdir -p /mnt/scratch/jenchiay/Reference
INPUT=/mnt/scratch/jenchiay/Reference
OUTPUT=/mnt/scratch/jenchiay/FASTQCfile
cd /mnt/scratch/jenchiay/Reference

for i in {285..308}; do fastq-dump --split-files ERR3310$i | fastqc -o /mnt/scratch/jenchiay/FASTQCfile --extract ERR3310$i_1.fastq ERR3310$i_2.fastq; done

echo "Job details_queque"
echo ----------
scontrol show job $SLURM_JOB_ID
