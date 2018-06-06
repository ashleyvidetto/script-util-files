#! /bin/bash
#This determines which changes in TFS are in the DEV branch but not Merged to TEST

tf=/cygdrive/c/Program" "Files" (x86)"/Microsoft" "Visual" "Studio" "14.0/Common7/IDE/TF.exe
 
cd /cygdrive/c/LookAhead/LKA2.0-DEV/

numOfChanges=$("$tf" merge . ../LKA2.0-TEST/ -r -candidate | wc -l)
echo "There are $numOfChanges changes not merged to TEST"

