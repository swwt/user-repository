package com.csu.qxjh.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static String getDate(){
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date=simpleDateFormat.format(new Date());
		return date;
	}
	
	
}
