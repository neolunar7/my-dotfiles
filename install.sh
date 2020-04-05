#!/bin/bash

function read_yn {
    quit="_"
    while [ "$quit" != "Y" -a "$quit" != "N" ]
    do
        >&2 echo "$1? (Y/N)"
        read quit
        quit=$(echo "$quit" | tr yn YN)
    done
    echo "$quit"
}

source osx.sh
