#!/bin/bash
if [ $# -ne 1 ];then
    echo 'Error: no args!'
else
    if [ "$1" = "." ];then
        tag=$(basename `pwd`)
    else
        tag=`basename $1`
    fi
    docker build -t 0layfolk0/$tag:1.0 --force-rm $1
fi
