<%@page import="com.csu.qxjh.sellor.pojo.Sellor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Sellor sellor = (Sellor) session.getAttribute("sellor");
	if (sellor == null){
		response.sendRedirect(request.getContextPath() + "/web_page/seller/signin.jsp");
		System.out.print("sellor is null");
	}
%>