#!/bin/sh
EXPECTED_COUNT=26
SEARCH_TEXT="Sold Out"

while true; do
	`wget -O bestbuy.html "https://www.bestbuy.com/site/searchpage.jsp?st=RTX+3080&_dyncharset=UTF-8&_dynSessConf=&id=pcat17071&type=page&sc=Global&cp=1&nrp=&sp=&qp=&list=n&af=true&iht=y&usc=All+Categories&ks=960&keys=keys"`
	CURRENT_COUNT=`grep -o -i "$SEARCH_TEXT" bestbuy.html | wc -l`
	echo "$CURRENT_COUNT"
	if [ "$CURRENT_COUNT" -ne "$EXPECTED_COUNT" ]; then
		echo "\a"
		sleep .2
		echo "\a"
		sleep .2
		echo "\a"
		echo "*****BESTBUY CHANGE DETECTED*****"
	fi
	sleep 30
done
