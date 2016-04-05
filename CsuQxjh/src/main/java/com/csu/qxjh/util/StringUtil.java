package com.csu.qxjh.util;

public class StringUtil {

	public static void main(String[] args){
		System.out.println(isDigital("a41249a"));
	}
	/*
	 * 判断字符串是否是纯数字
	 */
	public static boolean isDigital(String value) {
		  try {
		   Long.parseLong(value);
		   return true;
		  } catch (NumberFormatException e) {
		   return false;
		  }
	}
}
