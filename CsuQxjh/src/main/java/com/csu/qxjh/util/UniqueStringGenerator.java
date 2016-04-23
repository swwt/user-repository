package com.csu.qxjh.util;

import java.util.Random;

public class UniqueStringGenerator {
     private UniqueStringGenerator() {}
     /*
      * 获取唯一的字符串名，应用：生成独立的文件名，放置文件被覆盖
      */
     public static synchronized String getUniqueString(){
    	 try {
			Thread.currentThread().sleep(1);
    	 } catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
    	 }
    	 String chars = "abcdefghijklmnopqrstuvwxyz";
         String uniqueNumber = chars.charAt((int)(Math.random() * 26))+Long.toString(System.currentTimeMillis());      
         return uniqueNumber;
     }
       
     public static void main(String[] args){
    	 for(int i=0;i<1000;i++){
    		 System.out.println(getUniqueString());
    	 }
     }
}
