cd /cygdrive/c/LookAhead/Git/IPS_LKA2.0-Release/WebApps/Cancellation_Advisor/CancellationAdvisorMulti; 
rm -rf /cygdrive/c/LookAhead/Git/IPS_LKA2.0-Release/WebApps/Cancellation_Advisor/CancellationAdvisorMulti/build/libs/*;
gradle clean build -x test --offline; 
cd build/libs/;
ssh lkaadm@htappd00825.qcorpaa.aa.com '
rm -rf /opt/tcserver/pivotal-tc-server-standard-3.0.2.RELEASE/lka_ca_instance/webapps/*.war ;
';
scp *.war lkaadm@htappd00825.qcorpaa.aa.com:/opt/tcserver/pivotal-tc-server-standard-3.0.2.RELEASE/lka_ca_instance/webapps/CancellationAdvisorMultiStation.war;
ssh lkaadm@htappd00825.qcorpaa.aa.com '
/opt/tcserver/pivotal-tc-server-standard-3.0.2.RELEASE/lka_ca_instance/bin/tcruntime-ctl.sh stop; 
rm -rf /opt/tcserver/pivotal-tc-server-standard-3.0.2.RELEASE/lka_ca_instance/logs/*;
/opt/tcserver/pivotal-tc-server-standard-3.0.2.RELEASE/lka_ca_instance/bin/tcruntime-ctl.sh start;
' 
sleep 40;
echo "Artifact deployed and service should be up"; 
