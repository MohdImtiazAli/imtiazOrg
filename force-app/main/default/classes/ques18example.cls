public class ques18example {

    public static void examp(){
        String n='0101101';
        Integer n1=Integer.valueOf(n);
         System.debug(n1);
        String nn='100101';
        Integer n2=Integer.valueOf(nn);
         System.debug(n2);
        Integer rem1=0,dec1=0,base1=1;
        Integer rem2=0,dec2=0,base2=1;
        
       
        //binary to decimal
        while(n1!=0){
             rem1=math.mod(n1, 10);
            dec1=dec1+rem1*base1;
             n1=n1/10;
            base1=base1*2;
        }
        System.debug(dec1);
        // binary to decimaldecimal
         while(n2!=0){
             rem2=math.mod(n2, 10);
             dec2=dec2+rem2*base2;
             n2=n2/10;
            base2=base2*2;
        }
         System.debug(dec2);
        
        Integer sum=dec1+dec2;
         
        
        Integer rem=0,b=1;
        Integer ans=0;
        while(sum!=0){
            rem=math.mod(sum, 2);
            ans=ans+rem*b;
            sum=sum/2;
            b=b*10;
        }
        System.debug(ans);
      
    }
}