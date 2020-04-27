Server=gsadmin@otapnt45.qcorpaa.aa.com

if [ $# -eq 0 ];
	then 
		echo "Deploying to TEST1: $Server";
  else 
		echo "command line exists";
		if [ $1 == "dev" ];
		then
			Server=gsadmin@otapnd93.qcorpaa.aa.com
			echo "Deploying to DEV: $Server"
		fi
		if [ $1 == "dev3" ];
		then
			Server=gsadmin@htappd00817.qcorpaa.aa.com
			echo "Deploying to DEV3: $Server"
		fi
fi

BUILD_DIR="/cygdrive/c/LookAhead/Git/IPS_LKA2.0-Release/GigaSpaces/WhatIfSpace"
cd $BUILD_DIR;
pwd;
rm -rf build/libs/*;
gradle build -x test;
artifact=$(find -type f -name "what*.jar" | tail -1);
scp $artifact $Server:/opt/LookAhead/Gigaspaces/Deployments/TEST1/ATC/
ssh $Server '/opt/LookAhead/Gigaspaces/Scripts/TEST1/ATC/scripts_whatIf/deploy_WhatIfSpace.sh' 
