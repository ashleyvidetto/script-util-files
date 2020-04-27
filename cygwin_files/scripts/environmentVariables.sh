Server1=streamsadmin@otapnd45.qcorpaa.aa.com
GSServer=gsadmin@htappd01020.qcorpaa.aa.com
env=DEV3
instance=DEV3Instance
cleanScriptPath=/opt/ibm/streamsadmin/scripts/


#first argument to script will be instance/server you want to deploy to, second argument will be space (env) to connect to

if [ $# -eq 0 ];
	then 
		echo "No commandline - using defaults";
	else 
		#command line args exist
		if [ $1 == "dev1" ];
		then
			Server1=streamsadmin@otapnd45.qcorpaa.aa.com
			instance=DEV1Instance
			env=DEV1
		else
			if [ $1 == "dev2" ]
			then
				Server1=streamsadmin@otapnd45.qcorpaa.aa.com
				instance=DEV2Instance
				env=DEV
			else
				if [ $1 == "dev3" ]
				then
					Server1=streamsadmin@otapnd45.qcorpaa.aa.com
					GSServer=gsadmin@htappd00813.qcorpaa.aa.com
					instance=DEV3Instance
					env=DEV3
				else
					if [ $1 == "dev4" ]
					then
						Server1=streamsadmin@otapnd45.qcorpaa.aa.com
						instance=DEV4Instance
						env=DEV4
				else
					if [ $1 == "dev5" ]
					then
						Server1=streamsadmin@otapnd45.qcorpaa.aa.com
						GSServer=gsadmin@htappd01083.qcorpaa.aa.com
						instance=DEV5Instance
						env=DEV5
					else
						if [ $1 == "test1" ]
						then
							Server1=streamsadmin@otapnd62.qcorpaa.aa.com
							instance=TEST1Instance
							env=TEST1
							cleanScript=/opt/ibm/streamsadmin/scripts/cleanTest1Logs_fltAnalyzer.sh
						else
							if [ $1 == "test3" ]
							then
								Server1=streamsadmin@otapnd62.qcorpaa.aa.com
								instance=TEST3Instance
								env=TEST3
							else
								if [ $1 == "test4" ]
								then
									Server1=streamsadmin@otapnd62.qcorpaa.aa.com
									instance=TEST4Instance
									GSServer=gsadmin@htappd01020.qcorpaa.aa.com
									env=TEST4
									cleanScript=/opt/ibm/streamsadmin/scripts/cleanTest4Logs_fltAnalyzer.sh
								else
									if [ $1 == "dev5" ]
									then
										Server1=streamsadmin@otapnd45.qcorpaa.aa.com
										instance=DEV5Instance
										env=DEV5
									fi
								fi
							fi
						fi
					fi
				fi
			fi
		fi
		fi
fi

if [ $# -gt 1 ];
then 
	if [ $2 == "test4" ]
	then
		env=TEST4
	else	
		if [ $2 == "dev3" ]
		then
			env=DEV3
		else	
			if [ $2 == "test1" ]
			then
				env=TEST1
			fi
		fi
	fi
fi
cleanScript="$cleanScriptPath"clean"$env"Logs_$3.sh
export Server1;
export env;
export instance;
export cleanScript;
export GSServer;