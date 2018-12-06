#!/bin/bash

FILE=$1
CONFIG_FILE="$HOME/.prc"
DIR=
PROG=
command=
shift

get_dir()
{
    DIR="${PWD//[\/-]/_}"
}

get_config()
{
	if [ -f $CONFIG_FILE ]; then
	    source $CONFIG_FILE
	else
	    touch $CONFIG_FILE
	fi
}

get_prog()
{
    PROG=${DIR}_${FILE}
}

execute()
{
	if [ -n "${!PROG}" ]; then
        echo ${!PROG}
	    eval ${!PROG}
	else
		echo "'$FILE' not configured. To configure run 'p $FILE -c <Command goes here>'"
	fi
}

configure()
{
    line="$PROG="\""$command"\"""
    sed -i '' /^$PROG/d $CONFIG_FILE
	echo $line >> $CONFIG_FILE
}

get_dir
get_config
get_prog

if [ "$1" == "-c" ]; then
	while [ "$2" != "" ]; do
		command="$command$2 "
		shift
	done
	command=${command%?}
	configure
else
	execute
fi
