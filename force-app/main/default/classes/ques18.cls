public class ques18 {
    public static void add(String firstNumber,String secondNumber)
    {
     Integer r1,r2,r3,b1=1,b2=1,b3=1,d1=0,d2=0,sumOfBinary=0,sum;
     Integer Number1=Integer.valueOf(firstNumber);
     Integer Number2=Integer.valueOf(secondNumber);  
     while(Number1!=0)
     {
      r1=math.mod(Number1,10);
      d1=d1+r1*b1;
      Number1=Number1/10;
      b1=b1*2;
     }
        System.debug(d1);
     while(Number2!=0)
     {
      r2=math.mod(Number2,10);
      d2=d2+r2*b2;
      Number2=Number2/10;
      b2=b2*2;
     }
         System.debug(d2);
     sum=d1+d2;
      System.debug(sum);
       
     while(sum!=0)
     {
      r3=math.mod(sum,2);
      sumOfBinary=sumOfBinary+r3*b3;
      sum=sum/2;
      b3=b3*10;
     }
     system.debug(sumOfBinary);
    
    }

}