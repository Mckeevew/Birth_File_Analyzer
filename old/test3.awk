{
    if(FNR!=1)
    {  
        year_total[$1]+=$5
        
        if(min_year>$1)
        {
                min_year=$1
        }
        
        if(max_year<$1)
        {
                max_year=$1
        }
        printf "%d\n",$5
    }
    
    if(getline==0)
    {
        for(year in year_total)
        {
            #print year_total[year]
        }
    }
    
    
}
