#!/bin/bash
#Simple tool measuring CPU&Memory usage 
DATE=$(date +"%Y_%m_%d_%H_%M_%S")
M_FILE="mem_log_$DATE.output"
CPU_FILE="cpu_log_$DATE.output"
echo "Performance measurement started ($(date +"%Y-%m-%d-%H:%M:%S"))"
echo "time $(free -m | grep total | sed -E 's/^    (.*)/\1/g')" >> $M_FILE
mpstat | head -n 3 >> $CPU_FILE
	COUNTER="0"
	if [ $1 == -1 ];then #infinite
		echo "Infinite measurement (interrupt with CTRL+C)"
		COUNTER=-2
	else
		echo "Length of measurement: $1 sec"
	fi

	while [ $COUNTER -lt $1 ]; do
	  	echo "$(date '+%H:%M:%S') $(free -m | grep Mem: | sed 's/Mem://g')" >> $M_FILE
	  	mpstat | tail -n 1 >> $CPU_FILE
	  	sleep 1
	  	if [ $1 != -1 ] ;then
	  		COUNTER=$[$COUNTER +1]
		fi
	done	
echo "Performance measurement finished ($(date +"%Y-%m-%d-%H:%M:%S"))"
