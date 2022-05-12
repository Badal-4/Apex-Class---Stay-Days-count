public class dateController2 
{
   public static void method2(Id recId)
   {
       List<Reservation__c> reList = [Select Id,Arrival_Date__c,Departure_Date__c,nn__c from Reservation__c where Id =: recId];
       for(Reservation__c re : reList)
       {
             /*Current date integer logic*/
      Date dToday = Date.today();
String dateStr = dToday.year() + '/' + dToday.month() + '/' + dToday.day();
System.debug('>>>>' + dateStr);
//System.assertEquals(dateStr, '2015/4/24');
String strText = dateStr.replaceAll('[^a-zA-Z0-9\\s+]', '');
strText = strText.substring(5,strText.length()); 
integer n = Integer.valueof(strText);
System.debug('todays date-->'+n);
/*Current date integer logic ENDS*/
      
/*arrival date integer logic starts*/
Date dd = re.Arrival_Date__c;
System.debug('Arrival Date--->'+dd);
String dateStr1= dd.year() + '/' + dd.month() + '/' + dd.day();
System.debug('dd>>>>' + dateStr1);
//System.assertEquals(dateStr, '2015/4/24');
String strText1 = dateStr1.replaceAll('[^a-zA-Z0-9\\s+]', '');
strText1 = strText1.substring(5,strText1.length()); 
integer n1 = Integer.valueof(strText1);
System.debug(n1);
/*arrival date integer logic ends*/
           
           
         Integer currentMonth = dToday.month();
           Integer arrivalMonth = dd.month();
           System.debug('Current Month-->'+currentMonth);
           System.debug('arrival Month-->'+arrivalMonth);
           if(dToday != re.Departure_Date__c && dToday <= re.Departure_Date__c && dToday >= re.Arrival_Date__c)
           {
           if(currentMonth == arrivalMonth)
           {
               INteger result = n - n1+1;
               //re.nn__c = result;
               //update re;
               System.debug('result------>'+result);
           }
           }
         
       }
   }
}
