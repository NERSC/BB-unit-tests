#! /bin/bash

NFILES=1000

cd $DW_JOB_STRIPED
mkdir tmpFiles
cd tmpFiles

for n in $(seq 1 $NFILES); do
    dd if=/dev/urandom of=file$( printf %03d "$n" ).bin bs=1 count=$(( RANDOM + 1024 ))
done
