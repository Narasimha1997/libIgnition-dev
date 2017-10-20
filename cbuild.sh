#!/bin/bash

mkdir CBUILD
cp Ignition.py ./CBUILD/Ignition.pyx
cp serialize.py ./CBUILD/serialize.pyx

cython -a ./CBUILD/serialize.pyx
cython -a ./CBUILD/Ignition.pyx

cp setup.py ./CBUILD/setup.py

python3 ./CBUILD/setup.py build_ext --inplace
