<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>情系江华后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="${pageContext.request.contextPath}/web_page/administrator/css/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/web_page/administrator/css/bootstrap/bootstrap-responsive.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/web_page/administrator/css/bootstrap/bootstrap-overrides.css"
	type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/web_page/administrator/css/layout.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/web_page/administrator/css/elements.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/web_page/administrator/css/icons.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/web_page/administrator/css/compiled/tables.css" />
<link
	href="${pageContext.request.contextPath}/web_page/administrator/css/lib/font-awesome.css"
	type="text/css" rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/web_page/administrator/css/compiled/user-list.css"
	type="text/css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>

	<%@ include file="admin-navbar.jsp"%>
	<%@ include file="admin-navigation.jsp"%>


	<!-- main container -->
	<div class="content">
		<div class="container-fluid">
			<div id="pad-wrapper" class="users-list">
				<div class="row-fluid header">
					<h3>会员列表</h3>
				</div>

				<!-- Users table -->
				<div class="row-fluid table">
					<div class="table-wrapper orders-table section">
						<div class="row-fluid head filter-block">
							<div class="pull-right">
								<input id="searchKey" type="text" class="search order-search"
								onkeydown='if(event.keyCode==13){searchByLoginName()}' placeholder="根据登陆名查询用户" 
								<c:if test="${!empty requestScope.data.key}">
									value = "${requestScope.data.key}"
								</c:if>
								/>
							</div>
						</div>
						<div class="row-fluid">
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="span2">用户昵称</th>
										<th class="span3"><span class="line"></span> 用户姓名</th>
										<th class="span3"><span class="line"></span> 用户登录名</th>
										<th class="span3"><span class="line"></span> 操作</th>
									</tr>
								</thead>
								<tbody>
									<!-- row -->
									<c:if test="${requestScope.data != null}">
										<c:forEach var="user" items="${requestScope.data.users}"
											varStatus="status">
											<tr>
												<td>${user.user_nickname }</td>
												<td>${user.user_real_name }</td>
												<td>${user.user_login_name }</td>
												<td>
													<button class="btn btn-success">下拉</button>
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
						
						<%@ include file="admin-pagination.jsp"%>
						
					</div>
				</div>
				<!-- end users table -->
			</div>
		</div>
	</div>
	<!-- end main container -->


	<!-- scripts -->
	<script src="${pageContext.request.contextPath}/web_page/administrator/js/jquery-latest.js"></script>
	<script src="${pageContext.request.contextPath}/web_page/administrator/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/web_page/administrator/js/theme.js"></script>
	
</body>
</html>