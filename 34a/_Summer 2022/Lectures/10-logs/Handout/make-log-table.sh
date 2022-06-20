#!/bin/bash
#
##
## Defaults:
##
Version=0.1
#verbose=1 # verbose is false
#Detailed=1 # Detailed is false
#NumberOfPoints=100 # Default number of points to plot (really 1+this number)
#InteractiveMode=0 # by default, Interactive
#Scale=4 # Default scale
#HighScale=$(Scale + 2)

declare -a logs
declare -a biglogs

for i in $(seq 10 54); do
    j=$(echo "scale=1; $i/10" | bc -l)
    k=$(echo "scale=1; ($i+45)/10" | bc -l)

    for n in $(seq 0 9); do
	tmp=$(echo "scale=6; l($i/10 + $n/100)/l(10)" | bc -l)
	logs[n]=$(echo "scale=4; ($tmp+0.00005)/1" | bc -l)
	# echo "log(n) is ${logs[n]} but tmp is $tmp"
	
	tmp=$(echo "scale=6; l(($i+45)/10 + $n/100)/l(10)" | bc -l)
	biglogs[n]=$(echo "scale=4; ($tmp+0.00005)/1" | bc -l)
	# echo "biglog(n) is ${biglogs[n]} but tmp is $tmp"
    done

    echo "$j \& ${logs[0]} \& ${logs[1]} \& ${logs[2]} \& ${logs[3]} \& ${logs[4]} \& ${logs[5]} \& ${logs[6]} \& ${logs[7]} \& ${logs[8]} \& ${logs[9]} \& $k \& ${biglogs[0]} \& ${biglogs[1]} \& ${biglogs[2]} \& ${biglogs[3]} \& ${biglogs[4]} \& ${biglogs[5]} \& ${biglogs[6]} \& ${biglogs[7]} \& ${biglogs[8]} \& ${biglogs[9]} \\\\"

done

   
echo Finished!
