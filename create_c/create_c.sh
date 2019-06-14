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

sed -e "s;%file_name%;$1;g" -e "s;%NAME%;$1;g" template.c > $1.c
sed -e "s;%file_name%;$1;g" -e "s;%NAME%;${1^^};g" template.h > $1.h

