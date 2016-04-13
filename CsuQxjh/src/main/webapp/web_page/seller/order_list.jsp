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
										<th class="span3"><span class="line"></span>下单日期</th>
										<th class="span3"><span class="line"></span> 用户</th>
										<th class="span3"><span class="line"></span> 订单状态</th>
										<th class="span3"><span class="line"></span> 商品数量</th>
										<th class="span3"><span class="line"></span> 操作</th>
									</tr>
								</thead>
								<tbody>
									<!-- row -->
									<c:if test="${requestScope.data != null}">
										<c:forEach var="goodsOrder" items="${requestScope.data.goodsOrders}"
											varStatus="status">
											<tr>
												<td>${goodsOrder.id }</td>
												<td>${goodsOrder.goods_order_create_time }</td>
												<td>${goodsOrder.user.user_nickname }</td>
												<td>
													<c:choose>
														<c:when test="${goodsOrder.goods_order_payment_status == 0}"><span class="label label-important">未支付</span></c:when>
														<c:when test="${goodsOrder.goods_order_payment_status == 1}"><span class="label label-success">已支付</span></c:when>
													</c:choose>
													
													<c:if test="${goodsOrder.goods_order_payment_status == 1}">
														<c:choose>
															<c:when test="${goodsOrder.goods_order_deliver_status == 0}"><span class="label label-warning">未发货</span></c:when>
															<c:when test="${goodsOrder.goods_order_deliver_status == 1}"><span class="label label-info">已发货</span></c:when>
														</c:choose>
													</c:if>
													
													<c:if test="${goodsOrder.goods_order_deliver_status == 1}">
														<c:choose>
															<c:when test="${goodsOrder.goods_order_gain_status == 0}"><span class="label label-warning">未收货</span></c:when>
															<c:when test="${goodsOrder.goods_order_gain_status == 1}"><span class="label label-info">已收货</span></c:when>
														</c:choose>
													</c:if>
												</td>
												<td>${goodsOrders.goods_order_amount }</td>
												<td>
													<button class="btn btn-success">下拉</button>
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
						<%@ include file="seller_pagination.jsp"%>
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