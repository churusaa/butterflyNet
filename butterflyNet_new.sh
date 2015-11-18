#!/bin/bash
# Put your script name here
ScriptName="test.sh"




exitCode="1"
iterationsCounter=0
ourResult="Found it!"

if [ -f /tmp/GOTCHA_script.sh ] 
    then
        echo "We already found it"
        let exitCode="0"
        exit 0
fi 

while [ $exitCode -ne 0 ]
do
    cp /tmp/*$ScriptName /tmp/GOTCHA_script.sh 2> /dev/null
    exitCode=$?
    sleep 0.2s

    if (($iterationsCounter == 3000)); then
    echo "Timeout reached: 10 minutes."
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
