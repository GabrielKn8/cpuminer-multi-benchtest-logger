#! /usr/bin/env bash

DIR=benchmarks
TIME=120

mkdir -p $DIR

./cpuminer --cputest >> $DIR/cputest.log

for algo in scrypt scrypt:N scrypt-jane:N sha256d allium axiom bitcore blake blakecoin blake2s bmw cryptonight cryptolight decred dmd-gr drop fresh groestl heavy jha keccak keccakc luffa lyra2re lyra2rev2 myr-gr neoscrypt nist5 pentablake pluck phi phi2 quark qubit rainforest shavite3 sonoa skein skein2 s3 sia sib timetravel vanilla x11evo x11 x13 x14 x15 x16r x16s x17 yescrypt zr5 xevan

do
timeout $TIME ./cpuminer --benchmark -a $algo >> $DIR/$algo.log
done

