#!/bin/bash

#############
# Autor: Maks
# Date: 19.02.2026
# This script will print column in the {$1} specific number
#############

set -x # debug mode

ps -ef | grep python | awk -F" " '{print $2}' # third part is for filtering columns


