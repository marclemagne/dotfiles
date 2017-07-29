#!/bin/sh

ifcounts=$(ipconfig ifcount)

for i in $(seq 0 "$ifcounts")
do
  ipconfig getifaddr "en$i"
done
