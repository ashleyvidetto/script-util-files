#! /bin/bash
#This script just cleans and updates build paths for all projects

ge="gradle eclipse -Penv=dev" 
code="/cygdrive/c/LookAhead/LKA2.0-DEV"
 
echo "Cleaning and building classpath for all 2.0 projects"

cd $code/DataModels;
$ge;
cd $code/Service;
$ge;
cd $code/ComputationEventTemplates;
$ge;
cd $code/PreprocessingEventTemplates;
$ge;
cd $code/PerspectiveSpace;
$ge;
cd $code/ComputationSpace;
$ge;
cd $code/PreprocessingSpace;
$ge;
cd $code/PerspectivesGateway;
$ge;
cd $code/Monitoring;
$ge;
cd $code/DataLoaders/DataLoaders/;
$ge;


