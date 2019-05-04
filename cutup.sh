#!/bin/bash

readonly FILE=$1
readonly OUTPUT_DIR=$2
readonly FILE_DURATION=$(soxi -D $FILE | awk -F. '{print $1}')
readonly CUTUP_DURATION=1

for i in $(seq 1 $CUTUP_DURATION $FILE_DURATION); do
  sox $FILE $OUTPUT_DIR/${FILE%.*}-$i.wav trim $i $CUTUP_DURATION 
done
