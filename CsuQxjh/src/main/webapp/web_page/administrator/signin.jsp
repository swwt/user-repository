<%@page import="com.csu.qxjh.admin.pojo.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 如果已经登陆，跳转到主页面 */
	Admin admin = (Admin)session.getAttribute("admin");
	if(admin!=null) response.sendRedirect("${pageContext.request.contextPath}/web_page/administrator/index.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="login-bg">
<head>
<title>Detail Admin - Sign in</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- bootstrap -->
<link href="${pageContext.request.contextPath}/web_page/administrator/css/bootstrap/bootstrap.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/web_page/administrator/css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/web_page/administrator/css/bootstrap/bootstrap-overrides.css" type="text/css"
	rel="stylesheet" />
<!-- global styles -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web_page/administrator/css/layout.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web_page/administrator/css/elements.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web_page/administrator/css/icons.css" />

<!-- libraries -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web_page/administrator/css/lib/font-awesome.css" />

<!-- this page specific styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/web_page/administrator/css/compiled/signin.css" type="text/css"
	media="screen" />

<!-- open sans font -->
<link
	href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css' />

<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>


	<!-- background switcher -->
	<div class="bg-switch visible-desktop">
		<div class="bgs">
			<a href="#" data-img="landscape.jpg" class="bg active"> <img
				src="${pageContext.request.contextPath}/web_page/administrator/img/bgs/landscape.jpg" />
			</a> <a href="#" data-img="blueish.jpg" class="bg"> <img
				src="${pageContext.request.contextPath}/web_page/administrator/img/bgs/blueish.jpg" />
			</a> <a href="#" data-img="7.jpg" class="bg"> <img
				src="${pageContext.request.contextPath}/web_page/administrator/img/bgs/7.jpg" />
			</a> <a href="#" data-img="8.jpg" class="bg"> <img
				src="${pageContext.request.contextPath}/web_page/administrator/img/bgs/8.jpg" />
			</a> <a href="#" data-img="9.jpg" class="bg"> <img
				src="${pageContext.request.contextPath}/web_page/administrator/img/bgs/9.jpg" />
			</a> <a href="#" data-img="10.jpg" class="bg"> <img
				src="${pageContext.request.contextPath}/web_page/administrator/img/bgs/10.jpg" />
			</a> <a href="#" data-img="11.jpg" class="bg"> <img
				src="${pageContext.request.contextPath}/web_page/administrator/img/bgs/11.jpg" />
			</a>
		</div>
	</div>


	<div class="row-fluid login-wrapper">
		<a href="index.html"> <img class="logo" src="${pageContext.request.contextPath}/web_page/administrator/img/logo-white.png" />
		</a>

		<div class="span4 box">
			<div class="content-wrap">
				<h6>Log in</h6>
				<input id="loginName" class="span12" type="text"
					placeholder="Your login name" /> <input id="loginPassword"
					class="span12" type="password" placeholder="Your login password" />
				<a href="#" class="forgot">Forgot password?</a>
				<div class="remember">
					<input id="remember-me" type="checkbox" /> <label
						for="remember-me">Remember me</label>
				</div>
				<a id="login_btn" class="btn-glow primary login">Log in</a>
			</div>
		</div>

		<div class="span4 no-account">
			<p>Don't have an account?</p>
			<a href="signup.html">Sign up</a>
		</div>
	</div>

	<!-- dialog -->
	<!-- Modal -->
	<div id="dialog" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">消息提示</h4>
	      </div>
	      <div class="modal-body" id="dialog_content">
	      </div>
	      <!-- <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div> -->
	    </div>
	  </div>
	</div>
	
	<!-- scripts -->
	<script src="${pageContext.request.contextPath}/web_page/administrator/js/jquery-latest.js"></script>
	<script src="${pageContext.request.contextPath}/web_page/administrator/js/bootstrap.min.js"></script> 
	<script src="${pageContext.request.contextPath}/web_page/administrator/js/theme.js"></script>

	<!-- pre load bg imgs -->
	<script type="text/javascript">
        $(function () {
            // bg switcher
            var $btns = $(".bg-switch .bg");
            $btns.click(function (e) {
                e.preventDefault();
                $btns.removeClass("active");
                $(this).addClass("active");
                var bg = $(this).data("img");

                $("html").css("background-image", "url('img/bgs/" + bg + "')");
            });

        });
        
        $("#login_btn").click(function (){
        	var loginName = $("#loginName").val();
        	var loginPassword = $("#loginPassword").val();
        	console.log("loginName="+loginName);
        	console.log("loginPassword="+loginPassword);
        	
        	$.ajax({
                type: "POST",  //提交方式
                url: "/pc_admin/login",//路径
                dataType: "json",//返回的json格式的数据
                data: {
                    "admin_login_name": loginName,
                    "admin_password": loginPassword
                },//数据，这里使用的是Json格式进行传输
                success: function (result) {//返回数据根据结果进行相应的处理
                    if (result.code == 2) {
                        window.location.href = "/web_page/administrator/index.jsp";
                    }else{
                    	$("#dialog_content").html(result.message);
                    	$( "#dialog" ).modal();
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        	
        });
        
    </script>

</body>
</html>