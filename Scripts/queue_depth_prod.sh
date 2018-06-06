#This script views the latest queue status from plano utility hosts in production cdc queues
snapshotSrc=/export/Horizon/LookAhead/QueueStatus/prod

ssh avidetto@pdcjmp 'cat /export/Horizon/LookAhead/QueueStatus/prod/QueueStatus.out | grep -i la.update | grep -i .02';
exit;
