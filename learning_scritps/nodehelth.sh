#!/bin/bash

############
# Autor: Maks
# Date: 18.02.2026
#
#
# This script outputs the node health
# Version: v1
# ##########

set -x # debug mod will show the command before executing


# echo "Print the disk space:"
df -h

# echo "Print the memory:"
free -h

# echo "Print the CPU:"
nproc

