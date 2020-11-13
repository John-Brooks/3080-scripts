#!/bin/sh
EXPECTED_COUNT=38
SEARCH_TEXT="OUT OF STOCK"

while true; do
	`wget -O newegg.html "https://www.newegg.com/p/pl?N=100007709%20601357247&PageSize=96"`
	CURRENT_COUNT=`grep -o -i "$SEARCH_TEXT" newegg.html | wc -l`
	echo "$CURRENT_COUNT"
	if [ "$CURRENT_COUNT" -ne "$EXPECTED_COUNT" ]; then
		echo "\a"
		sleep .2
		echo "\a"
		sleep .2
		echo "\a"
		echo "*****Newegg standalone CHANGE DETECTED*****"
	fi
	sleep 30
done
