BEGIN {
	print "Statistics for flight data"
		print "==========================" 
}

/origin/ {
	print $1"\t"$2"\t"$5"\t\t"$6"\t\t\tFilled%"
}

{
	fliers_total[$1,$2] += $5
	seats_total[$1,$2] += $6
}

END {
	for(i in fliers_total){
	split(i,j,SUBSEP)
	if(seats_total[i]!=0){
		total["fliers"] += fliers_total[i]
		total["seats"]  += seats_total[i]
		percentage=fliers_total[i] / seats_total[i]
		count++
	} else {
		percentage = "NA"
	}
	if(percentage != "NA"){
		total["percentage"] += percentage
	}
	printf "%s\t%s\t\t%'d\t\t\t%'d\t\t\t%f\n",j[1],j[2],fliers_total[i],seats_total[i],percentage
	}

	print "============================================================"
	printf "\t\t\t\t%'d\t\t%'d\t\t%f\n",total["fliers"],total["seats"],total["percentage"]/count
} 
