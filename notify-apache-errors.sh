# use ubuntu's notification system to let us know when there's something new in the apache error log
# requires package libnotify-bin
tail -n0 -f /var/log/apache2/error.log | egrep 'Notice|Warning|Error|Fatal' | while read line
do
	body=`echo $line | cut -f 9- -d ' '`
	notify-send -c im.received -i error "Apache / PHP error" "$body"
done

