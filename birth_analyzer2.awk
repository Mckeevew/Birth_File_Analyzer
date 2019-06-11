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
                    printf "Year:\t%d\n",year

            for(month=1;month<13;month++)
            {
                if(month==1)
                {   
                    percent=((monthly_byYear[year,month]/yearly_Total[year])*100)
                    printf "January births:\t%d\t%d%%\n",monthly_byYear[year,month],percent
                }

                   
            }
           
        }
    }
}
