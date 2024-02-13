#!/bin/bash  -xue

script_dir=$(dirname $0)

gawk -F, -f ${script_dir}/awk/check-total-ds.awk
