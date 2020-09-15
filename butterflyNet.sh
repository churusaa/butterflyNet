#!/bin/bash
# Bash Butterfly net
# Written broken, and maintained by Nathanael Duke
# millicent.j.duke@gmail.com github.com/churusaa/butterflyNet
# Licensed under GPLv2. If you change it, just show me what you changed. :)


# Put your file name here
fileName="test.sh"

# Where are we looking? For best results, use an absolute path here
# with a trailing slash.
pathToWatch="/tmp/"

# How long should we wait for a file to appear? (minutes)
minutes=10











# ++++++++End Configurables+++++++

exitCode="1"
iterationsCounter=0
ourResult="Found it!"

if [ -f "${pathToWatch}GOTCHA_${fileName}" ] 
    then
        echo "We already found it"
        let exitCode="0"
        exit 0
fi 

while [ $exitCode -ne 0 ]
do
    cp "${pathToWatch}"*"${fileName}" "${pathToWatch}GOTCHA_${fileName}" 2> /dev/null
    exitCode=$?
    sleep 0.2s

    if (($iterationsCounter == 300 * $minutes )); then
    echo "Timeout reached: ${minutes} minutes."
    ourResult="Exiting. Timed out waiting."
    exitCode="0"
    else
        :
    fi
    let iterationsCounter+=1
    clear
    echo `expr $iterationsCounter / 5` "seconds"
done

echo $ourResult
