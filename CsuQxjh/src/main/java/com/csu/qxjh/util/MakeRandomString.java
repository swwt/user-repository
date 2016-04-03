package com.csu.qxjh.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class MakeRandomString {
	private static long orderNum = 0l;  
    private static String date ;  
	/** 
     * 生成订单编号 
     * @return 
     */  
    public static synchronized String getOrderNo() {  
        String str = new SimpleDateFormat("yyMMddHHmmss").format(new Date()); 
        String[] strRandom=UUID.randomUUID().toString().split("-");
        return strRandom[1]+str;  
    }  
    /*
     * 生成GUID（数据库主键）
     */
    public static final String getGUID(){
    	  UUID uuid = UUID.randomUUID();
    	  return uuid.toString();  
    }
    
    public static void main(String[] args){
    	System.out.println(getOrderNo());
    	System.out.println(getGUID());
    }
}
