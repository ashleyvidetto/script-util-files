cd /cygdrive/c/LookAhead/Git/IPS_LKA2.0-Release/WebApps/Cancellation_Advisor/CancellationAdvisor; 
rm -rf /cygdrive/c/LookAhead/Git/IPS_LKA2.0-Release/WebApps/Cancellation_Advisor/CancellationAdvisor/build/libs/*;
gradle clean build -x test; 
cd build/libs/;
ssh lkaadm@htappd00805.qcorpaa.aa.com '
/opt/tcserver/pivotal-tc-server-standard-3.0.2.RELEASE/lka_ca_instance/bin/tcruntime-ctl.sh stop; 
rm -rf /opt/tcserver/pivotal-tc-server-standard-3.0.2.RELEASE/lka_ca_instance/webapps/* ;
';
scp *.war lkaadm@htappd00805.qcorpaa.aa.com:/opt/tcserver/pivotal-tc-server-standard-3.0.2.RELEASE/lka_ca_instance/webapps/CancellationAdvisor.war;
ssh lkaadm@htappd00805.qcorpaa.aa.com '
/opt/tcserver/pivotal-tc-server-standard-3.0.2.RELEASE/lka_ca_instance/bin/tcruntime-ctl.sh stop; 
rm -rf /opt/tcserver/pivotal-tc-server-standard-3.0.2.RELEASE/lka_ca_instance/logs/*;
/opt/tcserver/pivotal-tc-server-standard-3.0.2.RELEASE/lka_ca_instance/bin/tcruntime-ctl.sh start;
' 
