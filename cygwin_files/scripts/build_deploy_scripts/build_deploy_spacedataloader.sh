

source /home/ashle/scripts/environmentVariables.sh $1 $2;

echo "Deploying to $env: $GSServer";
artifactRemoveCommand="rm -rfv /opt/LookAhead/Gigaspaces/Deployments/$env/ATC/spacedataloader*.jar;"
deploymentLocation=/opt/LookAhead/Gigaspaces/Deployments/$env/ATC/
scriptLocation="/opt/LookAhead/Gigaspaces/Scripts/$env/ATC/"
deployScriptCommand="/opt/LookAhead/Gigaspaces/Scripts/$env/ATC/deploy_spacedataloader.sh"
undeployScriptCommand="cd $scriptLocation; /opt/LookAhead/Gigaspaces/Scripts/$env/ATC/undeploy_spacedataloader.sh;"

cd /cygdrive/c/LookAhead/Git/IPS_LKA2.0-Release/GigaSpaces/SpaceInitialLoader/; 
rm -rf /cygdrive/c/LookAhead/Git/IPS_LKA2.0-Release/GigaSpaces/SpaceInitialLoader/build/libs/*;
gradle clean build -x test; 
cd build/libs/;
artifact=$(find -type f -name "*.jar" | tail -1);

printf "Deploying $artifact on servers: \n $GSServer \n Deploy script: $deployScriptCommand \n UndeployScript: \n $undeployScriptCommand \n"
ssh $GSServer $artifactRemoveCommand;
ssh $GSServer "
	$undeployScriptCommand;
";
scp $artifact $GSServer:$deploymentLocation;
ssh $GSServer $deployScriptCommand;
