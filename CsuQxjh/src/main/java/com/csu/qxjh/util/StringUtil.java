package com.csu.qxjh.util;

import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;

public class StringUtil {

	public static void main(String[] args){
		//System.out.println(isDigital("a41249a"));
		//System.out.println(dealDateString("2016-04-04 12:12:12"));
		//System.out.println(Long.parseLong("20160404121212"));
		Set set = new HashSet();
		set.add(123);
		set.add(456);
		set.add(new String("AA"));
		set.add(new String("AA"));
		set.add("BB");
		set.add(null);

		Iterator iterator = set.iterator();
		while (iterator.hasNext()) {
			System.out.println(iterator.next());
		}

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
	
	public static String dealDateString(String dateString){//处理时间字符串：形如yyyy-MM-dd HH:mm:ss
		String[] strs=dateString.split(" ");
		String[] strs1=strs[0].split("-");
		String[] strs2=strs[1].split(":");
		String result=strs1[0]+strs1[1]+strs1[2];
		result=result+strs2[0]+strs2[1]+strs2[2];
		return result;
	}
}
