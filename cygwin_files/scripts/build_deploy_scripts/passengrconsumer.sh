ARTIFACT_HOME="/cygdrive/c/LookAhead/Git/IPS_LKA2.0-Release/Streams/Foundation/PassengerManifestConsumer"

#first argument to script will be instance you want to deploy to, second argument will be space (env) to connect to

source /home/ashle/scripts/environmentVariables.sh $1 $2;


project=passengerconsumer
folder=ATC

#This is for if you want full path for the config directory (i.e. Config/PassengerConsumer/ATC)
fullPath=true

#Specific for passenger
psgrWidth=60
itinWidth=50


cd $ARTIFACT_HOME;
branchName=$(git symbolic-ref --short HEAD);
artifactNewName="flightAnalyzer-$branchName.sab"
deploymentLocation=/opt/LookAhead/STREAMS/Deployments/$env/ATC/
artifactRemoveCommand="find $deploymentLocation -type f -iname \"*passengerconsumer*.sab\" -delete"
artifactRenameCommand="find -type f -name *.sab -exec mv -v {} $artifactNewName \;";
deployScriptCommand="groovy /opt/LookAhead/STREAMS/Scripts/GLOBAL/DeployStreams_Parallel.groovy --env $env --environment_folder $env --streams_instance $instance --projects $project --project_folder $folder --buildFullDataDirectoryPath $fullPath --parallel_width_passenger $psgrWidth --parallel_width_itin $itinWidth"

printf "Deploying $project on server: \n $Server1 \n with script:\n\t $deployScriptCommand \n "
rm -rf build/libs/*;
./gradlew.bat LIB removeOutput;
cd ../StreamsUtilities/
./gradlew.bat LIB removeOutput compileJava
cd ../PassengerUtilities/
./gradlew.bat LIB removeOutput compileJava

#shouldn't have to do this since rsync has delete command
#ssh $Server1 'rm -rf ~/tmp_builds/*' ;

printf "\n Copying files......... \n .........";
rsync -Pave ssh --del  --exclude-from='/home/ashle/scripts/exclude-list.txt' --include-from='/home/ashle/scripts/include-list.txt' /cygdrive/c/LookAhead/Git/IPS_LKA2.0-Release/ $Server1:~/tmp_builds/

printf "\n-----\nBuilding SAB...\n----\n";
ssh $Server1 "
. /opt/ibm/streamsadmin/.bash_profile;
source /opt/ibm/InfoSphere_Streams/4.2.1.7/bin/streamsprofile.sh;
cd ~/tmp_builds/Streams/Foundation/StreamsUtilities/;
spl-make-toolkit -i .;
cd ~/tmp_builds/Streams/Foundation/PassengerUtilities/;
spl-make-toolkit -i .;
cd ~/tmp_builds/Streams/Foundation/PassengerManifestConsumer/;
sc -M com.aa.lookahead.passenger::PassengerManifestStarter --data-directory=/opt/lookahead/streams/atc/passengerconsumer -t ../../Foundation/PassengerUtilities:../../Foundation/StreamsUtilities: --no-mixed-mode-preprocessing;
 cd output/;
 $artifactRenameCommand;
 $artifactRemoveCommand;
 cp -v *.sab $deploymentLocation;
 $deployScriptCommand;
 ";

