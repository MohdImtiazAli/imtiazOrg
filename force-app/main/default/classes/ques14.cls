public class ques14 {

    public static void question14(Integer n){
        integer rev=0;
        Integer rem;
        while(n>0){
        rem=Math.mod(n, 10);
            rev=rev*10+rem;
            n=n/10;
        }
         System.debug(rev);
    }
}