package cn.cuit.wlgc.exampleserver.tool;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BasicTools {

    private static final String DATE_PARTTEN = "yyyy-MM-dd";
    
    private static final String TIME_PARTTEN = "yyyy-MM-dd HH:mm:ss";
    
    public static String getDate(){
        return new SimpleDateFormat(DATE_PARTTEN).format(new Date());
    }
    
    public static String getTime(){
        return new SimpleDateFormat(TIME_PARTTEN).format(new Date());
    }
}
