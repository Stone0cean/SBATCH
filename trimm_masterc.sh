#!/bin/bash

#SBATCH --job-name=Analysis_Joey

for i in {285..308}; do echo "trimming: ERR3310$i"; sbatch --export=x=$i --output=trimm_ERR3310$i.out --error=trimm_ERR3310$i.err /mnt/home/jenchiay/trim_script.sh; done