public class StringArrayTest{
    
    public static String[] generateStringArray(Integer num){
           
           String[] testStr = new List<String>();
           
           for(Integer i=0;i<num;i++){
               testStr.add('Test '+i);
           }
           
           return testStr;
    }
}