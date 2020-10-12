#!/bin/bash
#
# MUST SET -- Pantheon Machine Token. See: https://pantheon.io/docs/machine-tokens:"

mtoken="5408f255243bd2292f3fbc2fafc27a2ec083fcd852902728f2ba9a3ea616b8c5"

clear
echo ""
echo ""
echo ""
echo "" 
echo ""
echo ""
echo "Logging into Pantheon...."

myusername=$(whoami)
terminus auth:login  --email=$myusername@email.arizona.edu --machine-token=$mtoken -q

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
#prompt for username? : username
#prompt for useremail? : useremail
echo ""
echo ""
if [ $answer = 1 ]; then
  #   terminus commands here : terminus drush $sitename.dev -- site-install ua_quickstart ua_quickstart_install_options_form.uaqs_demo_enable=0 ua_quickstart_install_options_form.uaqs_verbosity=1 --account-name=$username --account-mail=$useremail --site-mail=<site-email> --site-name=$sitename -y --verbose     
elif [ $answer = 2 ]; then
  #   terminus upstream:list | grep "Drupal 7" | grep "core"
  #   terminus site:create "$sitename" 21e1fada-199c-492b-97bd-0b36b53a9da0 
  #   terminus site:list
  #   terminus drush $sitename.dev -- site-install   
elif [ $answer = 3 ]; then
   #   terminus commands here 
elif [ $answer = 4 ]; then
   #   terminus commands here 
elif [ $answer = 5 ]; then
   #   terminus commands here 
elif [ $answer = 6 ]; then
  #    terminus commands here 
fi

