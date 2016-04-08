package com.csu.qxjh.util;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.Properties;

// 关于Properties类常用的操作
public class PropertiesUtils {
	private final static String PROPERTIES_FILE_NAME = "message.properties";

	// 根据Key读取Value
	public static String get(String key) {
		Properties pps = new Properties();
		try {
			InputStream in = PropertiesUtils.class.getClassLoader().getResourceAsStream(PROPERTIES_FILE_NAME);
			pps.load(in);
			String value = pps.getProperty(key);
			// System.out.println(key + " = " + value);
			return value;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
}
