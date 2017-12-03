#!/bin/bash

# This script will set up an apache site with the given name
# that has PHP enabled
# The data file for this site is located at /var/www/siteName
#
# It will only create a new site if one does not already exist in that directory.
# Any error messages that are created will be printed.
#
#
#

RED='\033[0;31m'
ORANGE='\033[1;33m'
NC='\033[0m'

# Read in the template file
template=$(cat "/path/to/httpTemp.conf")



# Check that a project name is given
if [ $# -eq 1 ]
then
  name=$1          #  If more than one command-line param,
                   #+ then just take the first.
else
  name="example"  #  Default, if no command-line parameter.
fi


# Replace the site name place holder with a the name of the website
site=$(echo "$template" | sed -e "s/\${name}/$name/g")



# Make sure that the website does not already exist
if [ ! -f "/etc/apache2/mine/$name.conf" ]; then

	# Generate the the sites config file and activate it
	echo "$site" >  "/etc/apache2/mine/$name.conf";
	echo -e "\n\n#Generated site for $name\nInclude /private/etc/apache2/mine/$name.conf" >>  "/etc/apache2/httpd.conf";

	# Create a project file direcotry for this project
	mkdir "/var/www/$name"
  echo "Hello world!" >> "/var/www/$name/index.html"


	# Make sure the configuration is all good
	echo -e "${ORANGE}";
	apachectl configtest;
	echo -e "${NC}";

	# Restart the web server
	apachectl restart;

else
	echo -e "${RED}Site Already exists! Aborting...${NC}";
fi

