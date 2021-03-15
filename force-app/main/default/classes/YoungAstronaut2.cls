public class YoungAstronaut2 {
    
    public static void NumberOfDaysExcludeWeekends(){
        Date day=Date.today();
        Integer Month = Date.Today().Month();
        Integer Year = Date.Today().Year();
        Integer numberDays = date.daysInMonth(Year, Month);
        
        System.debug('Number of Days In Month--' +numberDays);
        
        
        List<String> daysList=new List<String>();
        for(Integer i=1;i<=numberDays;i++)
        {
            Date d = date.newInstance(Year, Month, i);
            Datetime dt = (DateTime)d;
            String dayOfWeek = dt.format('EEEE');
            daysList.add(dayOfWeek);
        }
        
        system.debug('daysList---'+daysList.size());
        integer excludeWeekend=0;
        for(Integer i=0;i<numberDays;i++){
            
            if(daysList.get(i)=='Saturday' || daysList.get(i)=='Sunday')
            {
                system.debug('WeekEnd==> '+daysList.get(i));
                excludeWeekend++;
            }
        }
        integer ans=numberDays-excludeWeekend;
        system.debug(ans);
    }
}