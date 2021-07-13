#!/bin/bash

. ./settings.sh

#----------------------------------------------------------------------------
#
# DESCRIPTION: This script will be executed by a cronjob. On Execution, this
#    	       script will check all the files modification date in a certain
#	           directory and if any of the file's date is greater or equal to
#	           7 days, then it will get deleted.
#
#----------------------------------------------------------------------------


dir_path=$DIR_PATH						# Specifing the directory on which the script will run


for item in $dir_path/*
do
	echo
	echo
	echo "--------------------------------------------------------------"
	echo "Processing File: "$item""							# Displaying which file is being processed 
	echo "--------------------------------------------------------------"
	echo
		
	file_mod_date=$(stat -c %y "$item" | cut -d" " -f1) 	# Getting File Modification Date
	curr_date=$(date +"%Y-%m-%d")							# Getting Current Date
	
	echo "Current Date          : $curr_date"
	echo "File Modification Date: $file_mod_date"
	
	today=$(date -d $file_mod_date +%s)						# Converting to seconds
	file_mod=$(date -d $curr_date +%s)

	day_diff=$(expr $(expr $file_mod - $today ) / 86400)	# Calculating the days' difference in dates
	
	echo "Day Difference        : $day_diff"
	
	if [ $day_diff -ge $DAY_DIFF ]									# If days count is greater or equal to our specified time duration
	then
		echo "File "$item" removed"
	    rm "$item"											# then the file will be removed
	fi 
done
