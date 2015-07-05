#!/bin/bash

COORDINATOR=../bin/coordinator_local
WORKLOAD="rr rw seqr seqw"
N_THREAD="1 2 4 8"
DELAYS="0 50"
N_OPS="5000"
BLKSIZE="4096"
N_BACKGROUND="0"
N_SAMPLES="10"
TRACE_TOOL="baseline"

for workload in $WORKLOAD; do
	for nthreads in $N_THREAD; do
		for delay in $DELAYS; do
			for nops in $N_OPS; do
				for blksize in $BLKSIZE; do
					for background in $N_BACKGROUND; do
						echo "--> executing:  $COORDINATOR --workload $workload --nthreads $nthreads --delay $delay --nops $nops --blksize $blksize --nsamples $N_SAMPLES --nbackground $background --trace_tool $TRACE_TOOL"
						$COORDINATOR --workload $workload --nthreads $nthreads --delay $delay --nops $nops --blksize $blksize --nsamples $N_SAMPLES --nbackground $background --trace_tool $trace_tool $TRACE_TOOL
					done
				done
			done
		done
	done
done
