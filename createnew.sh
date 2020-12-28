#!/bin/bash
#
# MUST SET -- Pantheon Machine Token. See: https://pantheon.io/docs/machine-tokens:"

mtoken="5408f255243bd2666292f3fbc2fafc27a2ec083fcd852902728f2ba9a3ea616b8c5"

clear
echo ""
echo ""
echo ""
echo "" 
echo ""
echo ""
echo "Logging into Pantheon...."

myusername=$(whoami)
terminus auth:login  --email="$myusername"@email.arizona.edu --machine-token="$mtoken" -q

#prompt here to build
read -p "         
         Drupal 7 Websites:
           [1] Create QuickStart site
           [2] Non-QuickStart
          
         Drupal 8 Websites:
           [3] Create QuickStart site
           [4] Non-QuickStart

         Drupal 9 Websites:
           [5] Create QuickStart site
           [6] Non-QuickStart
         
Select an option: " answer
#prompt to name site?: sitename
read -p "Add Site Name: " sitename
#prompt for username? : username
read -p "Add username: " username
#prompt for useremail? : useremail
read -p "Add useremail: " useremail
echo ""
echo ""
if [ "$answer" = 1 ]; then
     terminus site:create "$sitename" 3497cb17-1d67-459f-8831-fae986ce8100 
     terminus drush "$sitename".dev -- site-install ua_quickstart --account-name=research-admin --account-mail=research-web@list.arizona.edu --site-mail=research-web@list.arizona.edu --site-name="$sitename"
elif [ "$answer" = 2 ]; then
     terminus upstream:list | grep "Drupal 7" | grep "core"
     terminus site:create "$sitename" 21e1fada-199c-492b-97bd-0b36b53a9da0 
     terminus site:list
     terminus drush "$sitename".dev -- site-install   
fi
