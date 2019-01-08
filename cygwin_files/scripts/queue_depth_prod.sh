#This script views the latest queue status from utility hosts
echo "Command line argument to grep $1";
grepstring="$1";
ssh avidetto@hzdalluhs301.horizon.plano.aa.com ' cat /export/Horizon/LookAhead/QueueStatus/prod/QueueStatus.out'| grep -i "GMT\|$grepstring";

ssh avidetto@hztulluhs301.horizon.cherokee.aa.com '
cat /export/Horizon/LookAhead/QueueStatus/prod/QueueStatus.out' | grep -i "GMT\|$grepstring";