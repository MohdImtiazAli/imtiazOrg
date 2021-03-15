public class Weather_Apex {
    public class WeatherWrapper{
        @AuraEnabled
        public String maxTemp;
        @AuraEnabled
        public String minTemp;
        @AuraEnabled
        public String humidity;
        @AuraEnabled
        public String pressure;
        @AuraEnabled
        public  List<WeatherWrapper> wrlist1;
    }
    
    
    @AuraEnabled
    public static List<WeatherWrapper> forWeather(String city ){
        String minTemp,maxTemp,humidity,pressure;
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('http://api.openweathermap.org/data/2.5/weather?q='+city+'&appid=2917e4a6e32c38b65837b44ca36d3bf3');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            Map<String, Object> mainresults  = (Map<String, Object>)(results.get('main'))  ;
            System.debug('Received the following animals:'+mainresults);
            minTemp = string.valueof(mainresults.get('temp_min'));
            maxTemp = string.valueof(mainresults.get('temp_max'));
            humidity = string.valueof(mainresults.get('humidity'));
            pressure = string.valueof(mainresults.get('pressure'));
        }
        List<WeatherWrapper> wrList=new List<WeatherWrapper>();
        WeatherWrapper wr=new WeatherWrapper();
        wr.minTemp=minTemp;
        wr.maxTemp=maxTemp;
        wr.humidity=humidity;
        wr.pressure=pressure;
        wrList.add(wr);
        system.debug(wrList);
        
        
        return wrList;
    }
}