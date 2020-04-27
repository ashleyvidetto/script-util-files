Server1=lkaadm@htappd01016.qcorpaa.aa.com
Server2=lkaadm@htappd01017.qcorpaa.aa.com
env=TEST1


if [ $# -eq 0 ];
	then 
		echo "No commandline - using defaults";
	else 
		#command line args exist
		if [ $1 == "dev" ];
		then
			Server1=lkaadm@htappd01014.qcorpaa.aa.com
			Server2=lkaadm@htappd01015.qcorpaa.aa.com
		fi
fi

if [ $2 == "test4" ]
	then
		env=TEST4
	else	
		if [ $2 == "dev3" ]
		then
			env=DEV3
		fi
fi

artifactRemoveCommand="rm -rfv /opt/LookAhead/tcServer/Deployments/$env/OpsAdvisor*.war;"
deploymentLocation=/opt/LookAhead/tcServer/Deployments/$env/
deployScriptCommand="/opt/LookAhead/tcServer/Scripts/$env/OpsAdvisorDeploy.sh"
OPS_HOME="/cygdrive/c/LookAhead/Git/IPS_LKA2.0-Release/WebApps/OPSAdvisor_WebApp"

printf "Deploying OpsAdvisor on servers: \n $Server1 \n $Server2 \n Pointing to environment: $deployScriptCommand \n "
cd $OPS_HOME;
rm -rf build/libs/*;
cd UI/;
npm --logevel=error install; 
ng build --no-progress --prod;
cp -rf dist/* ../WebContent/;
cd ../;
gradle build -x test;
webapp=$(find -type f -name "*.war" | tail -1);
ssh $Server1 $artifactRemoveCommand;
scp $webapp $Server1:$deploymentLocation
ssh $Server1 $deployScriptCommand 
ssh $Server2 $deployScriptCommand 