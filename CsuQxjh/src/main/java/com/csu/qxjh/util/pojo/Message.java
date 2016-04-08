package com.csu.qxjh.util.pojo;

/*
 * 
 * 服务器返回json数据格式定义
 * int code : 结果码，用来标记服务端和客户端 错误，成功信息(0代表失败，1代表成功,-1代表未登录)
 * String message: 错误信息
 * Object result: 请求成功返回的数据
 * 
 * 
 */
public class Message {
	
	public static int ACCOUNT_NOT_EXIT = 0;
	public static int PASSWORD_ERROR = 1;
	public static int LOGIN_SUCCESS = 2;
	
	private int code; //
	private String message ;
	private Object result;
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getResult() {
		return result;
	}
	public void setResult(Object result) {
		this.result = result;
	}
	@Override
	public String toString() {
		return "Message [code=" + code + ", message=" + message + ", result=" + result + "]";
	}
	
	
	/**
	 * 服务端使用
	 * 
	 * 1.创建Message 对象 msg
	 * 2.设置 code ,message值
	 * 3.设置数据 setResult(Object result) result对应服务端实体封装类
	 * 
	 * 注意：实体类 用eclipse自动生成toString()方法便于测试
	 */
	
	
}
