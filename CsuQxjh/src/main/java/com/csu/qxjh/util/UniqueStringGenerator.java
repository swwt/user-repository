package com.csu.qxjh.util;

import java.util.Random;

public class UniqueStringGenerator {
     private UniqueStringGenerator() {}
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
