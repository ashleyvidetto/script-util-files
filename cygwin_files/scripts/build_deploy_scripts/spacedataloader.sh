ARTIFACT_HOME="/cygdrive/c/LookAhead/Git/IPS_LKA2.0-Release/GigaSpaces/SpaceInitialLoader"

#first argument to script will be instance you want to deploy to, second argument will be space (env) to connect to

source /home/ashle/scripts/environmentVariables.sh $1 $2 spacedataloader;

cd $ARTIFACT_HOME;
project=spacedataloader
branchName=$(git symbolic-ref --short HEAD);
artifactNewName="$project-$branchName.jar"
deploymentLocation=/opt/LookAhead/Gigaspaces/Deployments/$env/ATC/
artifactRemoveCommand="find $deploymentLocation -type f -iname \"*spacedataloader*.jar\" -delete"
artifactRenameCommand="find -type f -name \"*.jar\" -exec mv -v {} $artifactNewName \;";
scriptLocation="/opt/LookAhead/Gigaspaces/Scripts/$env/ATC/"
deployScriptCommand="/opt/LookAhead/Gigaspaces/Scripts/$env/ATC/deploy_spacedataloader.sh"
undeployScriptCommand="cd $scriptLocation; /opt/LookAhead/Gigaspaces/Scripts/$env/ATC/undeploy_spacedataloader.sh;"


printf "Deploying $project on server: \n $GSServer \n with script: $deployScriptCommand \n "
rm -rf build/libs/*;
./gradlew.bat build -x test;
cd build/libs/;
$artifactRenameCommand;
artifact=$(find -type f -name "*.jar" | tail -1);
ssh $GSServer $artifactRemoveCommand;
ssh $GSServer "
	$undeployScriptCommand
";
scp $artifact $GSServer:$deploymentLocation;
ssh $GSServer $deployScriptCommand;


