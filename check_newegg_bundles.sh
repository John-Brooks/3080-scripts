#!/bin/sh
EXPECTED_COUNT=13
SEARCH_TEXT="OUT OF STOCK"

while true; do
	`wget -O newegg_bundle.html "https://www.newegg.com/p/pl?d=3080&PageSize=96&LeftPriceRange=0+1200&N=31001489&isdeptsrh=1"`
	CURRENT_COUNT=`grep -o -i "$SEARCH_TEXT" newegg_bundle.html | wc -l`
	echo "$CURRENT_COUNT"
	if [ "$CURRENT_COUNT" -ne "$EXPECTED_COUNT" ]; then
		echo "\a"
		sleep .2
		echo "\a"
		sleep .2
		echo "\a"
		echo "*****Newegg Bundle CHANGE DETECTED*****"
	fi
	sleep 30
done
