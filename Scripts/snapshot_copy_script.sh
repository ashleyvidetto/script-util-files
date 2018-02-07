snapshotSrc=/lookahead_nas_prod/Snapshots/CA/PROD-CDC/snapshots
tempSnapDir=/cygdrive/c/snapshottmp
snapshotDest=/opt/LookAhead/Snapshots/CA/DEV3/snapshots

fileName=$(ssh avidetto@cdcjmp 'ls -tr /lookahead_nas_prod/Snapshots/CA/PROD-CDC/snapshots | tail -1')
echo "Correctly found file: "$fileName
scp avidetto@cdcjmp:$snapshotSrc/$fileName /cygdrive/c/snapshottmp/
scp $tempSnapDir/$fileName tfsadm@jnks:/opt/LookAhead/Snapshots/CA/DEV3/snapshots/

rm -rf $tempSnapDir/*
