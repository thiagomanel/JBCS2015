#!/bin/bash

nsamples=$1
trace_tool=$2

for workload in rr rw seqr seqw
do
  for nthreads in `seq 1 4`
  do
    for delay in 0
    do
      for nops in 5000
      do
        for blksize in 4096
	do
          for background in 0
	  do
     	    echo $workload $ntreads $delay $nops $blksize $nsamples $background
	    ./coordinator_local $workload $nthreads $delay $nops $blksize $nsamples $background $trace_tool
          done
        done
      done
    done
  done
done
