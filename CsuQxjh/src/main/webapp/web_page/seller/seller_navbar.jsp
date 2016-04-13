<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- navbar -->
    <div class="navbar navbar-inverse">
        <div class="navbar-inner">
            <button type="button" class="btn btn-navbar visible-phone" id="menu-toggler">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="${pageContext.request.contextPath}/web_page/seller/index.jsp"><img src="${pageContext.request.contextPath}/web_page/seller/img/logo.png" /> </a>
            <ul class="nav pull-right">                
                <li class="settings hidden-phone">
                    <a href="/pc_sellor/logout" role="button">
                        <i class="icon-share-alt"></i>
                    </a>
                </li>
            </ul> 
        </div>
    </div>
    <!-- end navbar -->