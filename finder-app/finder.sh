#!/bin/sh

filesdir=$1
searchstr=$2

validate_args () 
{
	if [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
		echo "No arguments have been passed"
		exit 1
	fi

	if [ ! -d "$filesdir" ]; then
		echo "Specified directory $filesdir does not exist"
		exit 1
        fi
}

find_str ()
{
  X=0
  Y=0

  #Number of files
  X=$(find "$filesdir" -type f | wc -l)
  #Number of matches
  Y=$(grep -rin "$searchstr" "$filesdir" | wc -l)
  echo "The number of files are $X and the number of matching lines are $Y"	
}

validate_args
find_str
