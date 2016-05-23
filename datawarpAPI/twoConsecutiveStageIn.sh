#!/bin/bash
##############
## DataWarp API 
## Two consecutive stage-ins
## 1 CN, 2 BBN
## BB: Job length, striped
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -t 00:10:00
#DW jobdw type=scratch capacity=400GB access_mode=striped

formatMilliTime()
{
        temp=$1
        hours=$((($temp/(1000*60*60))%24))
        minutes=$((($temp/(1000*60))%60))
        seconds=$((($temp/1000)%60))
        milli=$(($temp%60))

        printf "Time Taken (HR:MIN:SEC:MS): %02d:%02d:%02d:%02d\n" "$hours" "$minutes" "$seconds" "$milli"

}

echo "I am alive!"
Tstart=`date +%s%3N`
srun /global/cscratch1/sd/melrom/testSuite/CrayAPI/datawarp_stager in $DW_JOB_STRIPED/100MB /global/cscratch1/sd/melrom/testSuite/CrayAPI/100MB
srun /global/cscratch1/sd/melrom/testSuite/CrayAPI/datawarp_stager wfile /global/cscratch1/sd/melrom/testSuite/CrayAPI/100MB 
srun /global/cscratch1/sd/melrom/testSuite/CrayAPI/datawarp_stager qfile /global/cscratch1/sd/melrom/testSuite/CrayAPI/100MB
T1=`date +%s%3N`
srun /global/cscratch1/sd/melrom/testSuite/CrayAPI/datawarp_stager in $DW_JOB_STRIPED/25K  /global/cscratch1/sd/melrom/DWapi/25K
srun /global/cscratch1/sd/melrom/testSuite/CrayAPI/datawarp_stager wfile /global/cscratch1/sd/melrom/DWapi/25K
srun /global/cscratch1/sd/melrom/testSuite/CrayAPI/datawarp_stager qfile /global/cscratch1/sd/melrom/DWapi/25K
Tend=`date +%s%3N`

rt1=$(($Tstart-$T1))
rt2=$(($Tend-$T1))

echo "Time to stage in File 1"
formatMilliTime $rt1
echo "Time to stage in File 2"
formatMilliTime $rt2

exit 0
