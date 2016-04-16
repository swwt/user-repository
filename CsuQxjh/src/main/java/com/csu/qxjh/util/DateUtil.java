package com.csu.qxjh.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static String getDate(){
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyyMMddHHmmss");
		String date=simpleDateFormat.format(new Date());
		return date;
	}
}
