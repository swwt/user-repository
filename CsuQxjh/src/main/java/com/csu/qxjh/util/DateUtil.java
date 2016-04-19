package com.csu.qxjh.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.swing.plaf.synth.SynthStyle;

import org.junit.Test;

public class DateUtil {
	public static void main(String[] args){
		System.out.println(getDate3());
	}
	
	public static String getDate() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = simpleDateFormat.format(new Date());
		return date;
	}
	public static String getDate2() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = simpleDateFormat.format(new Date());
		return date;
	}
	public static String getDate3() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd号 ");
		String date = simpleDateFormat.format(new Date());
		return date;
	}
}
