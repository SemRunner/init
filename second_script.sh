#!/bin/bash

IFS=':'
while read username password uid gid comment home_directory shell
do
	echo "$username:$uid:$home_directory"
done < /etc/passwd
