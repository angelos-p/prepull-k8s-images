#!/bin/bash

IFS=$'\n\r' GLOBIGNORE='*' command eval  'IPs=($(cat ips))'

for i in "${IPs[@]}"; do
	echo "sshing into $i"
	scp -o "StrictHostKeyChecking no" ./images ubuntu@$i:~/
	scp -o "StrictHostKeyChecking no" ./pull-images.sh ubuntu@$i:~/
	ssh -o "StrictHostKeyChecking no" ubuntu@$i ./pull-images.sh
done

