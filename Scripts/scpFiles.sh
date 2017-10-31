#! /bin/bash
#This script scp's files to location in on the Jenkins servers

path=$(pwd)
remoteInfraRoot=/opt/LookAhead/
fileToCopy=$1
remoteBranch=${path:85}

command="scp -r $path/$fileToCopy tfsadm@jnks:$remoteInfraRoot$remoteBranch"
output=$($command)
echo $command
echo $output
