BEGIN{
    min_year=5000
    max_year=0
}

{
    if(FNR!=1)
    {    
         #1=year,2=month,3=date,4=day,5=births

        monthly_byYear[$1,$2]+=$5
        daily_byYear[$1,$4]+=$5
        yearly_Total[$1]+=$5

        if(min_year>$1)
        {
                min_year=$1
        }
        
        if(max_year<$1)
        {
                max_year=$1
        }
    }

    if(getline==0)
    {
        print "File: " FILENAME
            #Use for loop to print out information
        
        for(year=min_year;year<max_year+1;year++)
        {
            
            #percentages are less than 100%
            printf "%d\n",year
            for(month=1;month<13;month++)
            {
                if(month==1)
                {   
                    printf "January births:\t%d\t%d%%\n",monthly_byYear[year,month],((monthly_byYear[year,month]/yearly_Total[year])*100)
                }
                if(month==2)
                {
                    printf "Febuary births:\t%d\t%d%%\n",monthly_byYear[year,month],((monthly_byYear[year,month]/yearly_Total[year])*100)
                }
                if(month==3)
                {
                    printf "March births:\t%d\t%d%%\n",monthly_byYear[year,month],((monthly_byYear[year,month]/yearly_Total[year])*100)
                }
                if(month==4)
                {
                    printf "April births:\t%d\t%d%%\n",monthly_byYear[year,month],((monthly_byYear[year,month]/yearly_Total[year])*100)
                }
                if(month==5)
                {
                    printf "May births:\t%d\t%d%%\n",monthly_byYear[year,month],((monthly_byYear[year,month]/yearly_Total[year])*100)
                }

                if(month==6)
                {
                    printf "June births:\t%d\t%d%%\n",monthly_byYear[year,month],((monthly_byYear[year,month]/yearly_Total[year])*100)
                }

                if(month==7)
                {
                    printf "July births:\t%d\t%d%%\n",monthly_byYear[year,month],((monthly_byYear[year,month]/yearly_Total[year])*100)
                }
                if(month==8)
                {
                    printf "August births:\t%d\t%d%%\n",monthly_byYear[year,month],((monthly_byYear[year,month]/yearly_Total[year])*100)
                }

                if(month==9)
                {
                    printf "September births:\t%d\t%d%%\n",monthly_byYear[year,month],((monthly_byYear[year,month]/yearly_Total[year])*100)
                }

                if(month==10)
                {
                    printf "October births:\t%d\t%d%%\n",monthly_byYear[year,month],((monthly_byYear[year,month]/yearly_Total[year])*100)
                }

                if(month==11)
                {
                    printf "November births:\t%d\t%d%%\n",monthly_byYear[year,month],((monthly_byYear[year,month]/yearly_Total[year])*100)
                }

                if(month==12)
                {
                    printf "December births:\t%d\t%d%%\n",monthly_byYear[year,month],((monthly_byYear[year,month]/yearly_Total[year])*100)
                }
            }
            print "**********************************************************"
            printf "Total:\t%d\tTotalPerc%%\n",yearly_Total[year]
            #percentages are less than 100%
            for(day=1;day<8;day++)
            {
                if(day==1)
                {
                    printf "Monday births:\t%d\t%d%%\n",daily_byYear[year,day],((daily_byYear[year,day]/yearly_Total[year])*100)
                }
                if(day==2)
                {
                    printf "Tuesday births:\t%d\t%d%%\n",daily_byYear[year,day],((daily_byYear[year,day]/yearly_Total[year])*100)
                }

                if(day==3)
                {
                    printf "Wednesday births:\t%d\t%d%%\n",daily_byYear[year,day],((daily_byYear[year,day]/yearly_Total[year])*100)
                }
                if(day==4)
                {
                    printf "Thursday births:\t%d\t%d%%\n",daily_byYear[year,day],((daily_byYear[year,day]/yearly_Total[year])*100)
                }

                if(day==5)
                {
                    printf "Friday births:\t%d\t%d%%\n",daily_byYear[year,day],((daily_byYear[year,day]/yearly_Total[year])*100)
                }
                if(day==6)
                {
                    printf "Saturday births:\t%d\t%d%%\n",daily_byYear[year,day],((daily_byYear[year,day]/yearly_Total[year])*100)
                }

                if(day==7)
                {
                    printf "Sunday births:\t%d\t%d%%\n",daily_byYear[year,day],((daily_byYear[year,day]/yearly_Total[year])*100)
                }
            }
            print "=========================================================="
        }    
    }
}