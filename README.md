# INSTRUCTIONS

## About Script

The purpose of this script is perform the auto deletion of files in a certain directory that are older than **X** days. 

## Configuration

For configuration or settings of this script, there's a file ```settings.sh```, which contains two parameters:
* ```DIR_PATH``` - To configure the directory path
* ```DAY_DIFF``` - To provide max file duration after which it will be deleted

## Running the Script Manually

To run the script manually, simply go into the directory where ```file_remover.sh``` file is located and run the following command:
> $ ./file_remover.sh

## Automating The Script Execution using Cronjob

Method to run this script as a cronjob is explained below:
* First goto crontab:
  > $ crontab -e
* Structure of cronjob.
  > ```* * * * * command```
* There are five **asterisk**, following is brief explaination of how to use them:
  *  1st - Minutes [0-59]
  *  2nd - Hours [0-23]
  *  3rd - Day-of-Month [0-31]
  *  4th - Month [1-12]
  *  5th - Day-of-Week [0-6] (0=Sunday, 7=Sunday)
* Now add your script in this file opened in terminal
  > ```0 0 * * * /path/to/directory/./file_remover.sh```
  
* Save it, now new cronjob will be installed and run every day automatically
