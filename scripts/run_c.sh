#!/usr/bin/env bash

g++ -std=c++11 -I./ *.cpp -o main && \
    ./main && \
    rm main

