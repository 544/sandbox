#!/bin/sh

# ShellScript Sandbox File

# use color
red=31
green=32
yellow=33
blue=34
function cecho {
	color=$1
	shift
	echo "\033[${color}m$@\033[m"
}

# version
function version {
	echo "$(basename ${0}) version 0.0.1"
}

# usage
function usage {
	cat <<___EOT___
$(basename ${0} is a tool for ...

Usage:
	$(basename ${0}) [command] [<optios>]

Option:
	--version,-v	print $(basename ${0}) version
	--help,-h		print this
___EOT___
}

version
usage

cecho $red "akadayo"

exit 0;
