public class ques17 {
    /*WAP to enter a startDate='06:07:55 2-jan-2016' &
     *  endDate='07:08:55 5-feb-2016' and display the difference between two dates in
     *  Years, months, days, hours, minutes,seconds.
    //startDate='06:07:55 2-jan-2016'
    //DateTime mydate=DateTime.newInstance(2016, 01, 02, 06, 07, 55);*/
    
    public static void question17(){
        DateTime mydate=DateTime.newInstance(2016, 01, 02, 06, 07, 55);
        DateTime yourDate=DateTime.newInstance(2016, 02, 05, 07, 08, 55);
        
        Integer yYear=yourDate.year();
        Integer yMonth=yourDate.month();
        Integer yDay=yourDate.day();
        Integer yhour=yourDate.hour();
        Integer yMinute=yourDate.minute();
        Integer ysecond=yourDate.second();
        
        Integer year=yYear-mydate.year();
        Integer month=yMonth-mydate.month();
        integer day=yDay-mydate.day();
        Integer hour=yhour-mydate.hour();
        Integer minute=yMinute-mydate.minute();
        Integer second=ysecond-mydate.second();
        
        if(second<0){
            --yMinute;
            ysecond+=60;
            second=ysecond-mydate.second();
        }
        if(minute<0){
            --yhour;
            yMinute+=60;
            minute=yMinute-mydate.minute();
        }
        if(hour<0){
            --yDay;
            yHour+=12;
            hour=yHour-mydate.hour();
        }
        
        if(day<0){
            --yMonth;
            
            if(month==1||month==3||month==5||month==8||month==10||month==12){
                yDay+=31;
            }
            else if(month==4||month==6||month==9||month==11){
                yDay+=30;
            }
            else if(month==2){
                
                if(math.mod(yYear,400)==0|| ( math.mod(yYear,4)==0 && math.mod(yYear,100)!=0 ) ){
                    yDay+=29;
                }
                else{
                    yDay+=28;
                }
            }
        
        else{
            System.debug('enter valid date');
        }
        
        day=yDay-myDate.day();
        
    }
        if(month<0){
            --yYear;
            yMonth+=12;
            month=yMonth-myDate.month();
        }

        System.debug(year+' '+month+' '+day+' '+hour+' '+minute+' '+second);
    }
}