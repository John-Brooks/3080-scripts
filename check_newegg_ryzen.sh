#!/bin/sh
EXPECTED_COUNT=8
SEARCH_TEXT="OUT OF STOCK"

while true; do
	`wget -O newegg_ryzen.html "https://www.newegg.com/p/pl?d=ryzen+5900x&N=100007671%208000%20601359163&isdeptsrh=1"`
	CURRENT_COUNT=`grep -o -i "$SEARCH_TEXT" newegg_ryzen.html | wc -l`
	echo "$CURRENT_COUNT"
	if [ "$CURRENT_COUNT" -ne "$EXPECTED_COUNT" ]; then
		echo "\a"
		sleep .2
		echo "\a"
		sleep .2
		echo "\a"
		echo "*****Newegg RYZEN CHANGE DETECTED*****"
	fi
	sleep 30
done
