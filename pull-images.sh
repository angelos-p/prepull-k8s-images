#!/bin/bash

IFS=$'\n\r' GLOBIGNORE='*' command eval  'IMAGES=($(cat images))'

for i in "${IMAGES[@]}"; do
	sudo ctr -n=k8s.io images pull $i
done
