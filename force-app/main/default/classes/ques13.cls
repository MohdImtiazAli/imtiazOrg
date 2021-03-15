public class ques13 {

    public static void question13(integer n){
        integer a=0,b=1,c;
       list<integer> im=new   list<integer>();
        while(n!=0){
            im.add(b);
            c=a+b;
            a=b;
            b=c;
            n--;
        }
        system.debug(im);
    }
}