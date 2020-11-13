#!/bin/sh
EXPECTED_COUNT=14
SEARCH_TEXT="OUT_OF_STOCK"

while true; do
	wget -O amazon.html https://www.amazon.com/stores/GeForce/RTX3080_GEFORCERTX30SERIES/page/6B204EA4-AAAC-4776-82B1-D7C3BD9DDC82
	CURRENT_COUNT=`grep -o -i "$SEARCH_TEXT" amazon.html | wc -l`
	echo "$CURRENT_COUNT"
	if [ "$CURRENT_COUNT" -ne "$EXPECTED_COUNT" ]; then
		if [ "$CURRENT_COUNT" -ne 0 ]; then
			echo "\a"
			sleep .2
			echo "\a"
			sleep .2
			echo "\a"
			echo "*****Amazon CHANGE DETECTED*****"
		fi
	fi
	sleep 30
done
