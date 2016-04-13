<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.csu.qxjh.admin.pojo.Admin"%>
<%
	Admin admin = (Admin)session.getAttribute("admin");
	if(admin==null) response.sendRedirect(request.getContextPath()+"/web_page/administrator/signin.jsp");
%>