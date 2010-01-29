#!/bin/bash 
cmake -DWORD=8 -DOPSYS=NONE -DSEED=LIBC -DSHLIB=ON -DSTBIN=ON -DTIMER=NONE -DWITH="ALL" -DBENCH=20 -DTESTS=20 -DCHECK=off -DVERBS=off -DSTRIP=on -DQUIET=on -DARITH=easy -DFB_METHD="INTEG;INTEG;QUICK;QUICK;QUICK;QUICK;EXGCD" -DPC_METHD="BINAR" $1