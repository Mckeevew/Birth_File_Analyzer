{
	if(FNR!=1)
	{	
		#1=year,2=month,3=date,4=day,5=births

		#Total
		total+=$5

		#yearly
		yearly[$1]+=$5

		#month and month by year
		monthly[$2]+=$5
		#monthly_by_year[$1,$2]+=$5

		#day of week
		day_of_week[$4]+=$5
	}

	if(getline==0)
	{
		#Use for loop to print out information
		print "=========================================================="
		for(i in monthly)
		{
			#if(i==1)
			#{
			#	printf "January births:\t%d\t",monthly[i]
			#}
			#else if(i==2)
			#{	
			#	printf "February births:\t%d\t%d",monthly[i],((monthly[i]/total)*100)
			#}
			#else if(i==3)
			#{	
			#	printf "March  births:\t%d\t%d",monthly[i],((monthly[i]/total)*100)
			#}

			printf "%d",monthly[$i]

		}
	}
}
