<%@page import="com.csu.qxjh.sellor.pojo.Sellor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Sellor sellor = (Sellor) session.getAttribute("sellor");
	if (sellor != null) {
		response.sendRedirect(request.getContextPath() + "/web_page/seller/index.jsp");
	}
%>
<!DOCTYPE html>
<html class="login-bg">
<head>
<title>情系江华卖家控制台</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="${pageContext.request.contextPath}/web_page/seller/css/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/web_page/seller/css/bootstrap/bootstrap-responsive.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/web_page/seller/css/bootstrap/bootstrap-overrides.css"
	type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/web_page/seller/css/layout.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/web_page/seller/css/elements.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/web_page/seller/css/icons.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/web_page/seller/css/lib/font-awesome.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/web_page/seller/css/compiled/signup.css"
	type="text/css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
	<div class="header">
		<a href="index.html"> <img
			src="${pageContext.request.contextPath}/web_page/seller/img/logo.png"
			class="logo" />
		</a>
	</div>
	<div class="row-fluid login-wrapper">
		<div class="box">
			<div class="content-wrap">
				<h6>登录</h6>
				<input id="loginName" class="span12" type="text" placeholder="用户名" />
				<input id="loginPassword" class="span12" type="password"
					placeholder="密码" />
				<div class="action">
					<a id="login_btn" class="btn-glow primary signup">登陆</a>
				</div>
			</div>
		</div>

		<!-- dialog -->
		<!-- Modal -->
		<div id="dialog" class="modal fade" id="myModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">消息提示</h4>
					</div>
					<div class="modal-body" id="dialog_content"></div>
					<!-- <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div> -->
				</div>
			</div>
		</div>

		<!-- scripts -->
		<script
			src="${pageContext.request.contextPath}/web_page/seller/js/jquery-latest.js"></script>
		<script
			src="${pageContext.request.contextPath}/web_page/seller/js/bootstrap.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/web_page/seller/js/theme.js"></script>

		<script type="text/javascript">
			$("#login_btn")
					.click(
							function() {
								var loginName = $("#loginName").val();
								var loginPassword = $("#loginPassword").val();
								console.log("loginName=" + loginName);
								console.log("loginPassword=" + loginPassword);

								$
										.ajax({
											type : "POST", //提交方式
											url : "/pc_sellor/login",//路径
											dataType : "json",//返回的json格式的数据
											data : {
												"sellor_login_name" : loginName,
												"sellor_password" : loginPassword
											},//数据，这里使用的是Json格式进行传输
											success : function(result) {//返回数据根据结果进行相应的处理
												if (result.code == 2) {
													window.location.href = "${pageContext.request.contextPath}/web_page/seller/index.jsp";
												} else {
													$("#dialog_content").html(
															result.message);
													$("#dialog").modal();
												}
											},
											error : function(XMLHttpRequest,
													textStatus, errorThrown) {
												alert(errorThrown);
											}
										});

							});
		</script>
</body>
</html>