#!/bin/bash
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -t 00:05:00
#SBATCH --error=persistentRequest.%J.err
#SBATCH --output=persistentRequest.%J.out
#BB create_persistent name=BBSuiteT1 capacity=1TB access=striped type=scratch

module load datawarp
module load dws

echo "BB Test Suite: Persistent Reservation, 1TB, requested."

fname="$DW_PERSISTENT_STRIPED_BBSuiteT1/testFile"

touch $fname

if [ "$?" -ne "0" ]
then
	echo "FAIL: Touch file in persistent res failed. Verify directory: $fname"
else
	echo "PASS: Persistent reservation successful."
	sessID=$(dwstat sessions | grep $SLURM_JOBID | awk '{print $1}')
	echo "session ID is: "${sessID}
	instID=$(dwstat instances | grep $sessID | awk '{print $1}')
	echo "instance ID is: "${instID}
	echo "fragments list:"
	echo "frag state instID capacity gran node"
	dwstat fragments | grep ${instID}	
fi

#sbatch -d afterok:$SLURM_JOB_ID ./usePers.sh

wait
