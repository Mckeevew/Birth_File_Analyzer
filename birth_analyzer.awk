#!/usr/bin/awk -f

#   WIlliam Mckeever & John Taube

BEGIN {
   FS=","
}

{   
    if(FNR==1)
    {
        file_maxYear[FILENAME]=0
        file_minYear[FILENAME]=50000
    }
    
	if(FNR!=1)
	{    
   	 	#1=year,2=month,3=date,4=day,5=births
		monthly_byYear[FILENAME,$1,$2]+=$5
		daily_byYear[FILENAME,$1,$4]+=$5
		yearly_Total[FILENAME,$1]+=$5
		file_Total[FILENAME]=FILENAME
		
		if(file_maxYear[FILENAME] < $1)
        {
            file_maxYear[FILENAME]=$1
        }
        if(file_minYear[FILENAME] > $1)
        {
            file_minYear[FILENAME]=$1
        }
	}
}

END{
    for(file in file_Total)
    {
   	 	#Use for loop to print out information
        for(year=file_minYear[file];year<=file_maxYear[file];year++)
   	 	{
            print "File: "file
            
            split(year,yearsplit,SUBSEP)
			print "Year: "year
            printf "Total:\t\t\t%d\t 100%%\n",yearly_Total[file,year]
			#percentages are less than 100%
			for(month=1; month<13; month++)
			{
				if(month==1)
				{
					printf "January births:\t\t%d\t%0.2f%%\n",monthly_byYear[file,year,month],((monthly_byYear[file,year,month]/yearly_Total[file,year])*100)
				}
				if(month==2)
				{
					printf "Febuary births:\t\t%d\t%0.2f%%\n",monthly_byYear[file,year,month],((monthly_byYear[file,year,month]/yearly_Total[file,year])*100)
				}
				if(month==3)
				{
					printf "March births:\t\t%d\t%0.2f%%\n",monthly_byYear[file,year,month],((monthly_byYear[file,year,month]/yearly_Total[file,year])*100)
				}
				if(month==4)
				{
					printf "April births:\t\t%d\t%0.2f%%\n",monthly_byYear[file,year,month],((monthly_byYear[file,year,month]/yearly_Total[file,year])*100)
				}
				if(month==5)
				{
					printf "May births:\t\t%d\t%0.2f%%\n",monthly_byYear[file,year,month],((monthly_byYear[file,year,month]/yearly_Total[file,year])*100)
				}
				if(month==6)
				{
					printf "June births:\t\t%d\t%0.2f%%\n",monthly_byYear[file,year,month],((monthly_byYear[file,year,month]/yearly_Total[file,year])*100)
				}
				if(month==7)
				{
					printf "July births:\t\t%d\t%0.2f%%\n",monthly_byYear[file,year,month],((monthly_byYear[file,year,month]/yearly_Total[file,year])*100)
				}
				if(month==8)
				{
					printf "August births:\t\t%d\t%0.2f%%\n",monthly_byYear[file,year,month],((monthly_byYear[file,year,month]/yearly_Total[file,year])*100)
				}
				if(month==9)
				{
					printf "September births:\t%d\t%0.2f%%\n",monthly_byYear[file,year,month],((monthly_byYear[file,year,month]/yearly_Total[file,year])*100)
				}
				if(month==10)
				{
					printf "October births:\t\t%d\t%0.2f%%\n",monthly_byYear[file,year,month],((monthly_byYear[file,year,month]/yearly_Total[file,year])*100)
				}
				if(month==11)
				{
					printf "November births:\t%d\t%0.2f%%\n",monthly_byYear[file,year,month],((monthly_byYear[file,year,month]/yearly_Total[file,year])*100)
				}
				if(month==12)
				{
					printf "December births:\t%d\t%0.2f%%\n",monthly_byYear[file,year,month],((monthly_byYear[file,year,month]/yearly_Total[file,year])*100)
				}
			}
			print "*************************************"
			for(day=1;day<8;day++)
			{
				if(day==1)
				{
					printf "Monday births:\t\t%d\t%0.2f%%\n",daily_byYear[file,year,day],((daily_byYear[file,year,day]/yearly_Total[file,year])*100)
				}
				if(day==2)
				{
					printf "Tuesday births:\t\t%d\t%0.2f%%\n",daily_byYear[file,year,day],((daily_byYear[file,year,day]/yearly_Total[file,year])*100)
				}
				if(day==3)
				{
					printf "Wednesday births:\t%d\t%0.2f%%\n",daily_byYear[file,year,day],((daily_byYear[file,year,day]/yearly_Total[file,year])*100)
				}
				if(day==4)
				{
					printf "Thursday births:\t%d\t%0.2f%%\n",daily_byYear[file,year,day],((daily_byYear[file,year,day]/yearly_Total[file,year])*100)
				}
				if(day==5)
				{
					printf "Friday births:\t\t%d\t%0.2f%%\n",daily_byYear[file,year,day],((daily_byYear[file,year,day]/yearly_Total[file,year])*100)
				}
				if(day==6)
				{
					printf "Saturday births:\t%d\t%0.2f%%\n",daily_byYear[file,year,day],((daily_byYear[file,year,day]/yearly_Total[file,year])*100)
				}
				if(day==7)
				{
					printf "Sunday births:\t\t%d\t%0.2f%%\n",daily_byYear[file,year,day],((daily_byYear[file,year,day]/yearly_Total[file,year])*100)
				}
			}
			print "======================================================================"
		}	
    }
}
