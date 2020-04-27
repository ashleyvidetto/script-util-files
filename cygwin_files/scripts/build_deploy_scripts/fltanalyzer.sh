ARTIFACT_HOME="/cygdrive/c/LookAhead/Git/IPS_LKA2.0-Release/Streams/Foundation/FlightAnalyzer"

#first argument to script will be instance you want to deploy to, second argument will be space (env) to connect to

source /home/ashle/scripts/environmentVariables.sh $1 $2;


project=flightAnalyzer
folder=ATC
#Whether to actually write to space or just drain
writeCache=true
#Whether to post message to the MQ
sendRequest=true
#Number of threads to consume
width=10
#FOS environment
queue=decs

cd $ARTIFACT_HOME;
branchName=$(git symbolic-ref --short HEAD);
artifactNewName="flightAnalyzer-$branchName.sab"
deploymentLocation=/opt/LookAhead/STREAMS/Deployments/$env/ATC/
artifactRemoveCommand="find $deploymentLocation -type f -iname \"*flightanalyzer*.sab\" -delete"
artifactRenameCommand="find -type f -name *.sab -exec mv -v {} $artifactNewName \;";
deployScriptCommand="groovy /opt/LookAhead/STREAMS/Scripts/GLOBAL/DeployStreams_Parallel.groovy --env $env --environment_folder $env --project_folder $folder --streams_instance $instance --projects $project --writeToCache $writeCache  --parallel_width_param $width --queue $queue"


printf "Deploying $project on server: \n $Server1 \n with script: $deployScriptCommand \n "
rm -rf build/libs/*;
./gradlew.bat clean LIB removeOutput;
ssh $Server1 'rm -rf ~/tmp_builds/*' ;

#change this to rysnc once you install it
#find -type f -exec dos2unix {} \;

printf "\n Copying files......... \n .........";
rsync -Pave ssh --del  --exclude-from='/home/ashle/scripts/exclude-list.txt' --include-from='/home/ashle/scripts/include-list.txt' /cygdrive/c/LookAhead/Git/IPS_LKA2.0-Release/Streams/Foundation/FlightAnalyzer $Server1:~/tmp_builds/


#scp -r ../FlightLegConsumer $Server1:/opt/ibm/streamsadmin/tmp_builds;
printf "\nBuilding SAB...\n";
ssh $Server1 "
. /opt/ibm/streamsadmin/.bash_profile;
source /opt/ibm/InfoSphere_Streams/4.2.1.7/bin/streamsprofile.sh;
cd ~/tmp_builds/FlightAnalyzer/;
sc -M com.aa.lookahead.operators.flight::FlightAnalyzer --data-directory=/opt/LookAhead/STREAMS/Config/
 cd output/;
 $artifactRenameCommand;
 $artifactRemoveCommand;
 cp -v *.sab $deploymentLocation;
 $cleanScript;
 $deployScriptCommand;
 ";



#older commands saving here
#chmod 775 gradlew
#./gradlew clean build jar compileStreams -Penv=dev --no-daemon