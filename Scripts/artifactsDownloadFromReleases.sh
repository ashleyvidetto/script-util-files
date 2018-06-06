#Asking user for credentials

cd /opt/LookAhead/tcServer/Deployments/STAGE/PDC
pwd

#read -p "Environment to copy artifacts: " env

#cd /opt/LookAhead/tcServer/Deployments/$env
rm -rf DiversionTracker*.war

echo "Downloading artifacts from http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead&a=DiversionTracker&v=R2.0.77&p=war"
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead&a=DiversionTracker&v=R2.0.77&p=war" -t 3 -c --content-disposition --no-verbose
mv DiversionTracker*.war DiversionTracker.war
echo "copied artifacts"

echo "Downloading CancellationAdvisor War"
rm -f CancellationAdvisor*.war
echo "Downloading artifacts from http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead&a=CancellationAdvisor&v=R2.0.77&p=war"
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead&a=CancellationAdvisor&v=R2.0.77&p=war" -t 3 -c --content-disposition --no-verbose
echo "Completed Downloading CancellationAdvisor War"

echo "Downloading ECAC War"
rm -f ECAC*.war
echo "Downloading artifacts from http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead&a=ECAC&v=R2.0.77&p=war"
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead&a=ECAC&v=R2.0.77&p=war" -t 3 -c --content-disposition --no-verbose
echo "Completed Downloading ECAC war"

echo "Downloading IOCAdvisor war"
rm -f IOCAdvisor*.war
echo "Downloading artifacts from http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead&a=IOCAdvisor&v=R2.0.77&p=war"
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead&a=
IOCAdvisor&v=R2.0.77&p=war" -t 3 -c --content-disposition --no-verbose
echo "Completed IOCAdvisor war"

echo "Downloading Services War"
rm -f LKAServices*.war
echo "Downloading artifacts from http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead&a=LKAServices&v=R2.0.77&p=war"
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead&a=LKAServices&v=R2.0.77&p=war" -t 3 -c --content-disposition --no-verbose
echo "Completed Downloading Services war"

echo "Downloading Crew Watch War"
rm -f LKAServices*.war
echo  " Downloading artifacts from http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.crew&a=CrewWatch&v=R2.0.77&p=war" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.crew&a=CrewWatch&v=R2.0.77&p=war" -t 3 -c --content-disposition --no-verbose
echo "Completed Downloading Crew Watch war"
ls -ltr .

echo "Downloading Stream artifacts"
cd /opt/LookAhead/STREAMS/Deployments/STAGE/ATC/PDC
rm -rf *.sab
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.streams&a=diversionconsumer&v=R2.0.77&p=sab" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.streams&a=diversionnotification&v=R2.0.77&p=sab" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.streams&a=flightlegconsumer&v=R2.0.77&p=sab" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.streams&a=flightreseeder&v=R2.0.77&p=sab" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.streams&a=cabinbookingconsumer&v=R2.0.77&p=sab" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.streams&a=capacityconsumer&v=R2.0.77&p=sab" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.streams&a=crewmemberconsumer&v=R2.0.77&p=sab" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.streams&a=crewmemberreseeder&v=R2.0.77&p=sab" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.streams&a=crewsequencereseeder&v=R2.0.77&p=sab" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.streams&a=passengerconsumer&v=R2.0.77&p=sab" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.streams&a=adlqueueconsumer&v=R2.0.77&p=sab" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.streams&a=adlconsumerhandler&v=R2.0.77&p=sab" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.streams&a=maintenanceconsumer&v=R2.0.77&p=sab" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.streams&a=sequenceconsumer&v=R2.0.77&p=sab" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.streams&a=crewrestfacilityconsumer&v=R2.0.77&p=sab" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.streams&a=oagparser&v=R2.0.77&p=sab" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.streams&a=OneEventConsumer&v=R2.0.77&p=sab" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.streams&a=cwuploadconsumer&v=R2.0.77&p=sab" -t 3 -c --content-disposition --no-verbose

echo "Completed downloading the artifacts completed for streams" 

ls -ltr .

cd /opt/LookAhead/Gigaspaces/Deployments/STAGE/ATC/PDC
rm -rf *.jar

echo "Downloading gigaspaces artifacts"
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.spaces&a=diversion-space&v=R2.0.77&p=jar" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.spaces&a=diversion-mirror&v=R2.0.77&p=jar" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.spaces&a=spacedataloader&v=R2.0.77&p=jar" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.spaces&a=computation-space&v=R2.0.77&p=jar" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.spaces&a=perspective-space&v=R2.0.77&p=jar" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.spaces&a=preprocessing-space&v=R2.0.77&p=jar" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.spaces&a=snapshotjob&v=R2.0.77&p=jar" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.spaces&a=crewlegalityjobprocessing&v=R2.0.77&p=jar" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.spaces&a=UtilitySpace&v=R2.0.77&p=jar" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.spaces&a=utility-mirror&v=R2.0.77&p=jar" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead&a=atcwhatif_service&v=R2.0.77&p=war" -t 3 -c --content-disposition --no-verbose
wget "http://artifacts.horizon.qcorpaa.aa.com/nexus/service/local/artifact/maven/redirect?r=test-releases&g=com.aa.lookahead.crew&a=crew_recovery_service&v=R2.0.77&p=war" -t 3 -c --content-disposition --no-verbose
echo "Completed downloading the gigaspaces artifacts"

ls -l .

echo "copying of artifacts completed"

