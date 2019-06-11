{
    if(FNR!=1)
    {    
            #1=year,2=month,3=date,4=day,5=births

        monthly_byYear[$1,$2]+=$5
        daily_byYear[$1,$4]+=$5
        yearly_Total[$1]+=$5
    }

    if(getline==0)
    {
		for(year in yearly_Total)
		{
			printf "year->%d\n",year
		}
	}
}
