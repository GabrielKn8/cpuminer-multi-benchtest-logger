
#! /usr/bin/env bash

DIR=benchmarks
TIME=120

mkdir -p $DIR
touch $DIR/comp.txt

for algo in scrypt scrypt:N scrypt-jane:N sha256d allium axiom bitcore blake blakecoin blake2s bmw cryptonight cryptolight decred dmd-gr drop fresh groestl heavy jha keccak keccakc luffa lyra2re lyra2rev2 myr-gr neoscrypt nist5 pentablake pluck phi phi2 quark qubit rainforest shavite3 sonoa skein skein2 s3 sia sib timetravel vanilla x11evo x11 x13 x14 x15 x16r x16s x17 yescrypt zr5 xevan
do

timeout $TIME ./cpuminer --benchmark -a $algo >> $DIR/$algo.log
grep -oP 'Total:\s*\K ?[0-9]([.][0-9])' $DIR/$algo.log | awk '{ SUM += $1} END { print "$algo: " SUM/NR}' >> $DIR/comp.txt
grep -oP '[a-z]+H/s' $DIR/$algo.log | head -1 >> $DIR/comp.txt
done
