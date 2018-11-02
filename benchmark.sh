#! /usr/bin/env bash

DIR=benchmarks
TIME=120

mkdir -p $DIR

./cpuminer --cputest >> $DIR/cputest.log

for algo in scrypt scrypt-jane sha256d axiom bastion blake blake2s bmw cryptonight cryptonight-light decred dmd-gr fresh goestl lbry lyra2RE lyra2REv2 myr-gr neoscrypt nist5 pentablake  pluck quark qubit skein skein2 s3 sia sib timetravel vanilla veltor x11evo x11 x13 x14 x15 x17 yescrypt zr5 m7m keccak luffa shavite3 xevan

do
timeout $TIME ./cpuminer --benchmark -a $algo >> $DIR/$algo.log
done

