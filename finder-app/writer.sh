#!/bin/sh

writefile=$1
writestr=$2

validate_args () 
{
	if [ -z "$writefile" ] || [ -z "$writestr" ]; then
		echo "No arguments have been passed"
		exit 1
	fi
}

write_file()
{
       #Check and create the dir if it does not exist
       dir=$(dirname $writefile)
       echo "dirname is $dir"
       if [ ! -d $dir ]; then
	       #echo "$dir does not exist. Creating"
	       mkdir -p $dir
       fi
       #Create file
       touch $writefile
       if [ $? -ne 0 ];then
	       echo "Failed to create file"
	       exit 1
       fi
       #Write content
       echo "$writestr" >> "$writefile"

}
validate_args
write_file
