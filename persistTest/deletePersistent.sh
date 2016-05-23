#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -t 00:05:00
#BB destroy_persistent name=BBSuiteT1

echo "Script will now destroy persistent reservation BBSuite1 at PATH: $DW_PERSISTENT_STRIPED_BBSuiteT1"

wait
