# Defaults to test4 server
Server1=gsadmin@htappd01020.qcorpaa.aa.com
env=TEST4

if [ $# -eq 0 ];
	then echo "";
  else 
		if [ $1 == "test1" ];
		then
			Server1=gsadmin@otapnt42.qcorpaa.aa.com
			env=TEST1
		fi
fi

echo "Deploying to $env: $Server1";
artifactRemoveCommand="rm -rfv /opt/LookAhead/Gigaspaces/Deployments/$env/ATC/opsadvisor-space*.jar;"
deploymentLocation=/opt/LookAhead/Gigaspaces/Deployments/$env/ATC/
deployScriptCommand="/opt/LookAhead/Gigaspaces/Scripts/$env/ATC/deploy_OpsAdvisorSpace.sh"
undeployScriptCommand="/opt/LookAhead/Gigaspaces/Scripts/$env/ATC/undeploy_OpsAdvisor.sh;"

cd /cygdrive/c/LookAhead/Git/IPS_LKA2.0-Release/GigaSpaces/OpsAdvisorSpace/; 
rm -rf /cygdrive/c/LookAhead/Git/IPS_LKA2.0-Release/GigaSpaces/OpsAdvisorSpace/build/libs/*;
gradle clean build -x test; 
cd build/libs/;
artifact=$(find -type f -name "*.jar" | tail -1);

printf "Deploying $artifact on servers: \n $Server1 \n Deploy script: $deployScriptCommand \n UndeployScript: \n $undeployScriptCommand \n"
ssh $Server1 $artifactRemoveCommand;
ssh $Server1 $undeployScriptCommand;
scp $artifact $Server1:$deploymentLocation;
ssh $Server1 $deployScriptCommand;
