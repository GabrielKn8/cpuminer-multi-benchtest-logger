
#! /usr/bin/env bash

DIR=benchmarks
TIME=60

mkdir -p $DIR
touch $DIR/comp.txt

for algo in scrypt scrypt-jane sha256d axiom bastion blake blake2s bmw cryptonight cryptonight-light decred dmd-gr fresh goestl lbry lyra2RE lyra2REv2 myr-gr neoscrypt nist5 pentablake  pluck quark qubit skein skein2 s3 sia sib timetravel vanilla veltor x11evo x11 x13 x14 x15 x17 yescrypt zr5 m7m keccak luffa shavite3 xevan

do

timeout $TIME ./cpuminer --benchmark -a $algo >> $DIR/$algo.log
grep -oP 'Total:\s*\K ?[0-9]([.][0-9])' $DIR/$algo.log | awk '{ SUM += $1} END { print "$algo: " SUM/NR}' >> $DIR/comp.txt
grep -oP '[a-z]+H/s' $DIR/$algo.log | head -1 >> $DIR/comp.txt
done
