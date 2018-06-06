#!/bin/bash
#Get all flight events for a particular flight

if [ "$1" = "" ]
	then
		read -p 'Filepath to search: ' filepath;
	else
		filePath=$1;
fi

read -p 'Flight Number: ' fltnum;
read -p 'FLight Date (mmddyyyy):  ' fltdate;

monthString=${fltdate:0:2};
dayString=${fltdate:2:2};
yearString=${fltdate:4:4};
correctDateFormat=$yearString-$monthString-$dayString

grep "<FltNum>$fltnum</FltNum>" $filepath | grep "<FltOrgDate>$correctDateFormat";
