#!/bin/bash
#
#
# create_c.sh - Creates a .c file with header.
#
# Author: 	Rodrigo Alvares de Souza
#			rsouza01@gmail.com
#
#
# History:
# Version 0.1: 2019/06/14 (rsouza) - Creating the file.
#



_USE_MESSAGE="
Usage: $(basename "$0") filename [OPTIONS] 
OPTIONS:
  -g, --globalinclude      	The c file include directive pointing to a global header.
  -s, --selfreference      	The c file include directive pointing to filename.h.
  -f, --folder      		The folder where the files will be generated.
  
  -a, --help            	Show this help screen and exits.
  -V, --version         	Show program version and exits.
"

_VERSION=$(grep '^# Version ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#)
_FOLDER="./"

_FILENAME=$1
shift

#Command line arguments
case $1 in
		-g | --globalinclude) 
			shift
			_INCLUDE=$1 
			;;

		-s | --selfreference) 
			shift
			_INCLUDE=$_FILENAME
			;;

		-f | --folder) 
			shift
			_FOLDER+=$1 
			;;

		-h | --help | *)
			echo "$_USE_MESSAGE"
			exit 0
		;;

		-V | -v | --version)
			echo -n $(basename "$0")
                        echo " ${_VERSION}"
			exit 0
		;;
esac

sed -e "s;%file_name%;$_INCLUDE;g" -e "s;%NAME%;$1;g" template.c > $_FOLDER/$_FILENAME.c
sed -e "s;%file_name%;$_INCLUDE;g" -e "s;%NAME%;${_FILENAME^^};g" template.h > $_FOLDER/$_FILENAME.h

