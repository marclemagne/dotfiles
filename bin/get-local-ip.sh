#!/usr/bin/env bash

set -e

ifcounts=$(ipconfig ifcount)

for i in $(seq 0 "$ifcounts")
do
  ipconfig getifaddr "en$i"
done
