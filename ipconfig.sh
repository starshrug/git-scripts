date=$(date '+%Y-%m-%d %H:%M:%S')
date2=$(date '+%Y-%m-%d %H:%M:%S')
outfolder="output@${date2}.txt"
touch "$outfolder"
a=""
printf "[Detected local hosts via ipchecker.sh]\r\n" >> "${outfolder}"
printf "[Date: $date]\r\n" >> "${outfolder}"

for ip in $(seq 1 30); do ping -n 1 10.7.21.$ip > /dev/null
	[ $? -eq 0 ] && printf "10.7.21.$ip is operational!\r\n" >> "${outfolder}"
	echo Pinged!
done