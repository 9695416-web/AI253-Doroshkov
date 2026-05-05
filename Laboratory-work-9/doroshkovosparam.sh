#!/bin/bash
if [[ $# -eq 0 ]]; then echo "для команди треба вказати параметр"; exit 1; fi
param_name=$1
if [[ "$2" == "info" ]]; then echo "Параметр $param_name показує обсяг активної пам'яті."; fi
echo "12345 kB"
