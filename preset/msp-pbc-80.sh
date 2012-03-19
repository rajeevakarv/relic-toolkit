#!/bin/bash 
CC="msp430-gcc -mmcu=msp430f1611" cmake -G "MSYS Makefiles" -DCMAKE_SYSTEM_NAME=Generic -DARITH=msp-asm -DALIGN=2 -DARCH=MSP -DBENCH=1 "-DBN_METHD=BASIC;MULTP;MONTY;BASIC;BASIC;BASIC" -DCHECK=OFF -DCOLOR=OFF "-DCOMP:STRING=-O2 -g -mmcu=msp430f1611 -ffunction-sections -fdata-sections -fno-inline -mdisable-watchdog" -DDOCUM=OFF -EB_KBTLZ=OFF -DEB_ORDIN=OFF -DEB_PRECO=OFF -DEP_PRECO=OFF "-DFB_METHD=LODAH;TABLE;QUICK;QUICK;QUICK;BASIC;EXGCD;BASIC;BASIC" -DFB_PRECO=OFF "-DFP_METHD=FP_METHD:STRING=BASIC;COMBA;MULTP;MONTY;MONTY;SLIDE" "-DLINK=-Wl,--gc-sections" "-DPP_METHD=INTEG;BASIC;O_ATE" -DSEED=ZERO -DSHLIB=OFF -DSTRIP=ON -DTESTS=1 -DTIMER=CYCLE -DVERBS=OFF -DWORD=16 -DFP_PRIME=158 -DFP_QNRES=OFF -DFB_POLYN=353 -DBN_PRECI=354 -DMD_METHD=SHONE "-DWITH=FP;FB;EP;EB;PP;PB;PC;DV;CP;MD;BN" -DEC_METHD=PRIME -DPC_METHD=PRIME $1
