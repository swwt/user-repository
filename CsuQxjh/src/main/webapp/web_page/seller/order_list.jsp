<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>情系江华卖家控制台</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="${pageContext.request.contextPath}/web_page/seller/css/bootstrap/bootstrap.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/web_page/seller/css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/web_page/seller/css/bootstrap/bootstrap-overrides.css" type="text/css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web_page/seller/css/layout.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web_page/seller/css/elements.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web_page/seller/css/icons.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web_page/seller/css/compiled/tables.css" />
<link href="${pageContext.request.contextPath}/web_page/seller/css/lib/font-awesome.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/web_page/seller/css/compiled/user-list.css" type="text/css"
	media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>

	<%@include file="seller_navbar.jsp"%>
	<%@include file="seller_navigation.jsp"%>

	<!-- main container -->
	<div class="content">
		<div class="container-fluid">
			<div id="pad-wrapper" class="users-list">
				<div class="row-fluid header">
					<h3>订单列表</h3>
				</div>

				<!-- Users table -->
				<div class="row-fluid table">
					<div class="table-wrapper orders-table section">
						<div class="row-fluid head filter-block">
							<div class="pull-right">
								<div class="btn-group pull-right">
									<button class="glow left large">全部</button>
									<button class="glow middle large">未处理</button>
									<button class="glow right large">已处理</button>
								</div>
								<input type="text" class="search order-search"
									placeholder="搜索订单" />
							</div>
						</div>
						<div class="row-fluid">
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="span2">订单编号</th>
										<th class="span3"><span class="line"></span>订单日期</th>
										<th class="span3"><span class="line"></span> 用户</th>
										<th class="span3"><span class="line"></span> 订单状态</th>
										<th class="span3"><span class="line"></span> 商品数量</th>
										<th class="span3"><span class="line"></span> 订单总金额</th>
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
									<tr class="first">
										<td><a href="#">#459</a></td>
										<td>2015-6-6</td>
										<td><a href="#">用户名</a></td>
										<td><span class="label label-success">已支付</span> <span
											class="label label-warning">未发货</span></td>
										<td>3</td>
										<td>￥ 3,500.00
											<ul class="actions">
												<li><i class="icon-check"></i></li>
												<li class="last"><i class="table-delete"></i></li>
											</ul>
										</td>
									</tr>
									<tr>
										<td><a href="#">#510</a></td>
										<td>2015-6-6</td>
										<td><a href="#">用户名</a></td>
										<td><span class="label label-success">已支付</span> <span
											class="label label-info">已发货</span></td>
										<td>5</td>
										<td>￥ 800.00
											<ul class="actions">
												<li><i class="icon-check"></i></li>
												<li class="last"><i class="table-delete"></i></li>
											</ul>
										</td>
									</tr>
									<tr>
										<td><a href="#">#590</a></td>
										<td>2015-6-6</td>
										<td><a href="#">用户名</a></td>
										<td><span class="label label-important">未支付</span></td>
										<td>2</td>
										<td>￥ 1,350.00
											<ul class="actions">
												<li><i class="icon-check"></i></li>
												<li class="last"><i class="table-delete"></i></li>
											</ul>
										</td>
									</tr>
									<tr>
										<td><a href="#">#618</a></td>
										<td>2015-6-6</td>
										<td><a href="#">用户名</a></td>
										<td><span class="label">已被取消</span></td>
										<td>8</td>
										<td>￥ 3,499.99
											<ul class="actions">
												<li><i class="icon-check"></i></li>
												<li class="last"><i class="table-delete"></i></li>
											</ul>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="pagination pull-right">
							<ul>
								<li><a href="#">&#8249;</a></li>
								<li><a class="active" href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">&#8250;</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- end users table -->
			</div>
		</div>
	</div>
	<!-- end main container -->


	<!-- scripts -->
	<script src="${pageContext.request.contextPath}/web_page/seller/js/jquery-latest.js"></script>
	<script src="${pageContext.request.contextPath}/web_page/seller/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/web_page/seller/js/theme.js"></script>

</body>
</html>