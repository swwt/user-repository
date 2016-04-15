<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
	href="${pageContext.request.contextPath}/web_page/seller/css/compiled/tables.css" />
<link
	href="${pageContext.request.contextPath}/web_page/seller/css/lib/font-awesome.css"
	type="text/css" rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/web_page/seller/css/compiled/user-list.css"
	type="text/css" media="screen" />
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
									<select id="select_status" onchange="queryBuStatus()"
										style="margin-right: 1vw">
										<option>&nbsp;</option>
										<option>全部</option>
										<option>未支付</option>
										<option>已支付</option>
										<option>未发货</option>
										<option>已发货</option>
										<option>未收货</option>
										<option>已收货</option>
									</select>
								</div>
								<input id="searchKey" type="text" class="search order-search"
									onkeydown='if(event.keyCode==13){searchByLoginName()}'
									placeholder="根据编号查询订单，支持模糊查询"
									<c:if test="${!empty requestScope.data.key}">
									value = "${requestScope.data.key}"
								</c:if> />
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
										<th class="span3"><span class="line"></span> &nbsp;</th>
									</tr>
								</thead>
								<tbody>
									<!-- row -->
									<c:if test="${requestScope.data != null}">
										<c:forEach var="goodsOrder"
											items="${requestScope.data.goodsOrders}" varStatus="status">
											<tr>
												<td>${goodsOrder.id }</td>
												<td>${fn:substring(goodsOrder.goods_order_create_time, 0, 4)}
												-
												${fn:substring(goodsOrder.goods_order_create_time, 4, 6)}
												-
												${fn:substring(goodsOrder.goods_order_create_time, 6, 8)}
												${fn:substring(goodsOrder.goods_order_create_time, 8, 10)}
												:
												${fn:substring(goodsOrder.goods_order_create_time, 10, 12)}
												:
												${fn:substring(goodsOrder.goods_order_create_time, 12, 14)}
												</td>
												<td>${goodsOrder.user.user_nickname }</td>
												<td><c:choose>
														<c:when
															test="${goodsOrder.goods_order_payment_status == 0}">
															<span class="label label-important">未支付</span>
														</c:when>
														<c:when
															test="${goodsOrder.goods_order_payment_status == 1}">
															<span class="label label-success">已支付</span>
														</c:when>
													</c:choose> <c:if test="${goodsOrder.goods_order_payment_status == 1}">
														<c:choose>
															<c:when
																test="${goodsOrder.goods_order_deliver_status == 0}">
																<span class="label label-warning">未发货</span>
															</c:when>
															<c:when
																test="${goodsOrder.goods_order_deliver_status == 1}">
																<span class="label label-info">已发货</span>
															</c:when>
														</c:choose>
													</c:if> <c:if test="${goodsOrder.goods_order_deliver_status == 1}">
														<c:choose>
															<c:when test="${goodsOrder.goods_order_gain_status == 0}">
																<span class="label label-warning">未收货</span>
															</c:when>
															<c:when test="${goodsOrder.goods_order_gain_status == 1}">
																<span class="label label-info">已收货</span>
															</c:when>
														</c:choose>
													</c:if></td>
												<td>${goodsOrder.goods_order_amount }</td>
												<td><select
													onchange="operateOrder(this.value,'${goodsOrder.id }')">
														<option selected="selected">操作选项</option>
														<option value="1">标记为已发货</option>
														<option value="2">查看详细信息</option>
												</select>
												<td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
						<div class="pagination pull-right">
							<ul>
								<li><a href="javascript:previousPage()">&#8249;</a></li>

								<c:forEach begin="${requestScope.data.startAndEnd.start }"
									end="${requestScope.data.startAndEnd.end }" varStatus="status">
									<li
										<c:if test="${status.index == requestScope.data.pageIndex}"> class="active" </c:if>>
										<a
										href="${requestScope.basePath}?targetPageIndex=${status.index }&key=${requestScope.data.key}">
											${status.index} </a>
									</li>
								</c:forEach>

								<li><a href="javascript:nextPage()">&#8250;</a></li>
							</ul>
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
									<div class="modal-footer">
										<button id="confirmBtn" type="button" class="btn btn-primary">确定</button>
									</div>
								</div>
							</div>
						</div>

						<script
							src="${pageContext.request.contextPath}/web_page/administrator/js/jquery-latest.js"></script>
						<script type="text/javascript">

		var baseUrl = "${requestScope.basePath}";

		function previousPage() {
			
			var url = baseUrl+"?targetPageIndex=";
			
	        if ( (${requestScope.data.pageIndex}) <= 1) {
	            url = url+1;
	        }
	        else {
	            url = url+${requestScope.data.pageIndex-1};
	        }
	        if (${!empty requestScope.data.key}) {
	            url +=("&key=${requestScope.data.key}");
	        }
	        
	        if (${!empty requestScope.data.payment_status}) {
	            url +=("&payment_status=${requestScope.data.payment_status}");
	        }
	        if (${!empty requestScope.data.deliver_status}) {
	            url +=("&deliver_status=${requestScope.data.deliver_status}");
	        }
	        if (${!empty requestScope.data.payment_status}) {
	            url +=("&gain_status=${requestScope.data.gain_status}");
	        }
	        window.location.href = url;
	    }
		
		function nextPage(){
			
			var url = baseUrl+"?targetPageIndex=";
			
			if ( (${requestScope.data.pageIndex >= requestScope.data.pageCounts})) {
	            url = url+${requestScope.data.pageCounts};
	        }
	        else {
	            url = url+${requestScope.data.pageIndex+1};
	        }
	        if (${!empty requestScope.data.key}) {
	            url +=("&key=${requestScope.data.key}");
	        }
	        
	        if (${!empty requestScope.data.payment_status}) {
	            url +=("&payment_status=${requestScope.data.payment_status}");
	        }
	        if (${!empty requestScope.data.deliver_status}) {
	            url +=("&deliver_status=${requestScope.data.deliver_status}");
	        }
	        if (${!empty requestScope.data.payment_status}) {
	            url +=("&gain_status=${requestScope.data.gain_status}");
	        }
	        
	        window.location.href = url;
		}
		function searchByLoginName(){
		        var url = baseUrl+"?targetPageIndex=1";
		        if ($("#searchKey").val().trim() != "") {
		            url += "&key=" + $("#searchKey").val();
		            window.location.href = url;
		        }
		        else{
		        	return;
		        }
		}
		</script>
					</div>
				</div>
				<!-- end users table -->
			</div>
		</div>
	</div>
	<!-- end main container -->


	<!-- scripts -->
	<script
		src="${pageContext.request.contextPath}/web_page/seller/js/jquery-latest.js"></script>
	<script
		src="${pageContext.request.contextPath}/web_page/seller/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/web_page/seller/js/theme.js"></script>
	<script type="text/javascript">
		function queryBuStatus() {
			var select = document.getElementById("select_status");
			/* alert(objS.selectedIndex); */
			var payment_status = -1;
			var deliver_status = -1;
			var gain_status = -1;

			var index = select.selectedIndex;
			
			if (index == 2) {
				payment_status = 0;
			}
			else if (index == 3) {
				payment_status = 1;
			}
			else if (index == 4) {
				payment_status = 1;
				deliver_status = 0;
			}
			else if (index == 5) {
				payment_status = 1;
				deliver_status = 1;
			}
			else if (index == 6) {
				payment_status = 1;
				deliver_status = 1;
				gain_status = 0;
			}
			else if (index == 7) {
				payment_status = 1;
				deliver_status = 1;
				gain_status = 1;
			}
			
			var url = "/pc_sellor/order_list?";
			url += "targetPageIndex=1";
			url += "&payment_status="+payment_status;
			url += "&deliver_status="+deliver_status;
			url += "&gain_status="+gain_status;
			window.location.href = url;

		}
		
		function operateOrder(value,goodsOrderId){
			if(value == 1){
				markAsSendOut(goodsOrderId);
			}
		}
		
		var options = {
		        backdrop: false,
		        keyboard: false
		    };
		
		function markAsSendOut(orderId){
			
			$.ajax({
				type : "POST", //提交方式
				url : "/pc_sellor/markAsSendOut",//路径
				dataType : "json",//返回的json格式的数据
				data : {
					"orderId" : orderId,
				},//数据，这里使用的是Json格式进行传输
				success : function(result) {//返回数据根据结果进行相应的处理
					if (result.code == 4) {
						 $("#dialog_content").html("添加成功");
		                    $("#dialog").modal(options);
		                    $("#confirmBtn").unbind('click');
		                    $("#confirmBtn").click(function(){
		                        window.location.reload();
		                    });
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
			
		}
		
	</script>
</body>
</html>