# Defaults to test4 server
GSServer=gsadmin@htappd01020.qcorpaa.aa.com
env=TEST4

source /home/ashle/scripts/environmentVariables.sh $1 $2;

echo "Deploying to $env: $GSServer";
artifactRemoveCommand="rm -rfv /opt/LookAhead/Gigaspaces/Deployments/$env/ATC/snapshotjob*.jar;"
deploymentLocation=/opt/LookAhead/Gigaspaces/Deployments/$env/ATC/
deployScriptCommand="/opt/LookAhead/Gigaspaces/Scripts/$env/ATC/deploy_snapshotJob.sh"
undeployScriptCommand="/opt/LookAhead/Gigaspaces/Scripts/$env/ATC/undeploy_SnapshotJob.sh;"

cd /cygdrive/c/LookAhead/Git/IPS_LKA2.0-Release/GigaSpaces/SnapshotJob/; 
rm -rf /cygdrive/c/LookAhead/Git/IPS_LKA2.0-Release/GigaSpaces/SnapshotJob/build/libs/*;
gradle clean build -x test; 
cd build/libs/;
artifact=$(find -type f -name "*.jar" | tail -1);

printf "Deploying $artifact on servers: \n $GSServer \n Deploy script: $deployScriptCommand \n UndeployScript: \n $undeployScriptCommand \n"
ssh $GSServer $artifactRemoveCommand;
ssh $GSServer $undeployScriptCommand;
scp $artifact $GSServer:$deploymentLocation;
ssh $GSServer $deployScriptCommand;
