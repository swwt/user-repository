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
    <link href="${pageContext.request.contextPath}/web_page/seller/css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/web_page/seller/css/lib/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/web_page/seller/css/lib/font-awesome.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web_page/seller/css/layout.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web_page/seller/css/elements.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web_page/seller/css/icons.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web_page/seller/css/compiled/index.css" type="text/css" media="screen" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>

    <%@include file="seller_navbar.jsp" %>
    <%@include file="seller_navigation.jsp" %>
	<!-- main container -->
    <div class="content">

        <div class="container-fluid">

            <!-- upper main stats -->
            <div id="main-stats">
                <div class="row-fluid stats-row">
                    <div class="span3 stat">
                        <div class="data">
                            <span class="number">2457</span>
                            总商品
                        </div>
                        <span class="date">商家发布总商品数</span>
                    </div>
                    <div class="span3 stat">
                        <div class="data">
                            <span class="number">￥3,240</span>
                            成交金额
                        </div>
                        <span class="date">商家总成交金额</span>
                    </div>
                    <div class="span3 stat">
                        <div class="data">
                            <span class="number">322</span>
                            成交订单
                        </div>
                        <span class="date">商家总成交订单数</span>
                    </div>
                    <div class="span3 stat last">
                        <div class="data">
                            <span class="number">0</span>
                            订单
                        </div>
                        <span class="date">商家未处理订单数</span>
                    </div>
                </div>
            </div>
            <!-- end upper main stats -->

            <div id="pad-wrapper">
                <div class="row-fluid section ui-elements">
                    <h4>商家信息</h4>
                    <div class="span5 knobs">
                        <img src="img/contact-profile.png" class="avatar img-circle" />
                        <h3 class="name" style="display: inline-block;">用户名/店铺名</h3>
                        <div class="picChange"><a class="btn-flat white">更换头像</a></div>
                    </div>
                    <div class="span6 showcase">
                        <ul>
                            <li>地址 : 湖南省长沙市江华县江华村76006号</li>
                            <li>邮编 :  76006.</li>
                            <li>电话 :1817 274 2933</li>
                            <li>邮箱 :<a href="#">221454135@qq.com</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="row-fluid section chart">
                    <h4>
                        销量图标
                        <div class="btn-group pull-right">
                            <button class="glow left">日销量</button>
                            <button class="glow middle active">月销量</button>
                            <button class="glow right">年销量</button>
                        </div>
                    </h4>
                    <div class="span12">
                        <div id="statsChart"></div>
                    </div>
                </div>

                <!-- the script for the toggle all checkboxes from header is located in js/theme.js -->
                <div class="table-products section">
                    <div class="row-fluid head">
                        <div class="span12">
                            <h4>最新商品 <small>我最新发布的商品</small></h4>
                        </div>
                    </div>
                    <div class="row-fluid filter-block">
                        <div class="pull-right">
                            <div class="ui-select">
                                <select title="排序">
                                  <option value="1" >最热</option >
                                  <option value="2" >收藏最多</option >
                                  <option value="3">最新</option >
                                </select>
                            </div>
                            <input type="text" class="search" />
                        </div>
                    </div>
                    <div class="row-fluid">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th class="span3">
                                        <input type="checkbox"  title="checkAll"/>
                                        商品名
                                    </th>
                                    <th class="span3">
                                        <span class="line"></span>商品描述
                                    </th>
                                    <th class="span3">
                                        <span class="line"></span>状态
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="first">
                                    <td>
                                        <input type="checkbox" />
                                        <div class="img">
                                            <img src="img/table-img.png" />
                                        </div>
                                        <a href="#">湖南江华特产荔枝湖南江华... </a>
                                    </td>
                                    <td class="description">
                                        湖南江华特产荔枝湖南江华湖南江华特产荔枝湖南江华...
                                    </td>
                                    <td>
                                        <span class="label label-success">上架中</span>
                                        <ul class="actions">
                                            <li><i class="table-edit"></i></li>
                                            <li><i class="table-settings"></i></li>
                                            <li class="last"><i class="table-delete"></i></li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" />
                                        <div class="img">
                                            <img src="img/table-img.png" />
                                        </div>
                                        <a href="#">江华特产板栗江华特产板栗...</a>
                                    </td>
                                    <td class="description">
                                        江华特产板栗江华特产板栗江华特产板栗江华特产板栗...
                                    </td>
                                    <td>
                                        <span class="label label-warning">下架中</span>
                                        <ul class="actions">
                                            <li><i class="table-edit"></i></li>
                                            <li><i class="table-settings"></i></li>
                                            <li class="last"><i class="table-delete"></i></li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" />
                                        <div class="img">
                                            <img src="img/table-img.png" />
                                        </div>
                                        <a href="#">湖南江华特产荔枝湖南江华...</a>
                                    </td>
                                    <td class="description">
                                        江华特产板栗江华特产板栗江华特产板栗江华特产板栗...
                                    </td>
                                    <td>
                                        <span class="label label-important">热卖中</span>
                                        <ul class="actions">
                                            <li><i class="table-edit"></i></li>
                                            <li><i class="table-settings"></i></li>
                                            <li class="last"><i class="table-delete"></i></li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" />
                                        <div class="img">
                                            <img src="img/table-img.png" />
                                        </div>
                                        <a href="#">湖南江华特产荔枝湖南江华...</a>
                                    </td>
                                    <td class="description">
                                        湖南江华特产荔枝湖南江华湖南江华特产荔枝湖南江华...
                                    </td>
                                    <td>
                                        <span class="label label-info">审核中</span>
                                        <ul class="actions">
                                            <li><i class="table-edit"></i></li>
                                            <li><i class="table-settings"></i></li>
                                            <li class="last"><i class="table-delete"></i></li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" />
                                        <div class="img">
                                            <img src="img/table-img.png" />
                                        </div>
                                        <a href="#">湖南江华特产荔枝湖南江华</a>
                                    </td>
                                    <td class="description">
                                        湖南江华特产荔枝湖南江华湖南江华特产荔枝湖南江华...
                                    </td>
                                    <td>
                                        <span class="label ">商品被禁</span>
                                        <ul class="actions">
                                            <li><i class="table-edit"></i></li>
                                            <li><i class="table-settings"></i></li>
                                            <li class="last"><i class="table-delete"></i></li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" />
                                        <div class="img">
                                            <img src="img/table-img.png" />
                                        </div>
                                        <a href="#">湖南江华特产荔枝湖南江华</a>
                                    </td>
                                    <td class="description">
                                        湖南江华特产荔枝湖南江华湖南江华特产荔枝湖南江华...
                                    </td>
                                    <td>
                                        <span class="label label-inverse">管理员下架</span>
                                        <ul class="actions">
                                            <li><i class="table-edit"></i></li>
                                            <li><i class="table-settings"></i></li>
                                            <li class="last"><i class="table-delete"></i></li>
                                        </ul>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="pagination">
                      <ul>
                        <li><a href="#">&#8249;</a></li>
                        <li><a class="active" href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">&#8250;</a></li>
                      </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>


	<!-- scripts -->
    <script src="${pageContext.request.contextPath}/web_page/seller/js/jquery-latest.js"></script>
    <script src="${pageContext.request.contextPath}/web_page/seller/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/web_page/seller/js/jquery-ui-1.10.2.custom.min.js"></script>
    <!-- flot charts -->
    <script src="${pageContext.request.contextPath}/web_page/seller/js/jquery.flot.js"></script>
    <script src="${pageContext.request.contextPath}/web_page/seller/js/jquery.flot.stack.js"></script>
    <script src="${pageContext.request.contextPath}/web_page/seller/js/jquery.flot.resize.js"></script>
    <script src="${pageContext.request.contextPath}/web_page/seller/js/theme.js"></script>

    <script type="text/javascript">
        $(function () {
            // jQuery Flot Chart
            var visits = [[1, 50], [2, 40], [3, 45], [4, 23],[5, 55],[6, 65],[7, 61],[8, 70],[9, 65],[10, 75],[11, 57],[12, 59]];
            var visitors = [[1, 25], [2, 50], [3, 23], [4, 48],[5, 38],[6, 40],[7, 47],[8, 55],[9, 43],[10,50],[11,47],[12, 39]];
            var plot = $.plot($("#statsChart"),
                    [ { data: visits, label: "成交订单数"},
                        { data: visitors, label: "成交金额" }], {
                        series: {
                            lines: { show: true,
                                lineWidth: 1,
                                fill: true,
                                fillColor: { colors: [ { opacity: 0.1 }, { opacity: 0.13 } ] }
                            },
                            points: { show: true,
                                lineWidth: 2,
                                radius: 3
                            },
                            shadowSize: 0,
                            stack: true
                        },
                        grid: { hoverable: true,
                            clickable: true,
                            tickColor: "#f9f9f9",
                            borderWidth: 0
                        },
                        legend: {
                            // show: false
                            labelBoxBorderColor: "#fff"
                        },
                        colors: ["#a7b5c5", "#30a0eb"],
                        xaxis: {
                            ticks: [[1, "1月"], [2, "2月"], [3, "3月"], [4,"4月"], [5,"5月"], [6,"6月"],
                                [7,"7月"], [8,"8月"], [9,"9月"], [10,"10月"], [11,"11月"], [12,"12月"]],
                            font: {
                                size: 12,
                                family: "Open Sans, Arial",
                                variant: "small-caps",
                                color: "#697695"
                            }
                        },
                        yaxis: {
                            ticks:3,
                            tickDecimals: 0,
                            font: {size:12, color: "#9da3a9"}
                        }
                    });
            function showTooltip(x, y, contents) {
                $('<div id="tooltip">' + contents + '</div>').css( {
                    position: 'absolute',
                    display: 'none',
                    top: y - 30,
                    left: x - 50,
                    color: "#fff",
                    padding: '2px 5px',
                    'border-radius': '6px',
                    'background-color': '#000',
                    opacity: 0.80
                }).appendTo("body").fadeIn(200);
            }
            $("#statsChart").bind("plothover", function (event, pos, item) {
                if (item) {
                    if (previousPoint != item.dataIndex) {
                        previousPoint = item.dataIndex;

                        $("#tooltip").remove();
                        var x = item.datapoint[0].toFixed(0),
                                y = item.datapoint[1].toFixed(0);

                        var month = item.series.xaxis.ticks[item.dataIndex].label;

                        showTooltip(item.pageX, item.pageY,
                                item.series.label + " of " + month + ": " + y);
                    }
                }
                else {
                    $("#tooltip").remove();
                    previousPoint = null;
                }
            });

            // jQuery UI Sliders
            $(".slider-sample1").slider({
                value: 100,
                min: 1,
                max: 500
            });
            $(".slider-sample2").slider({
                range: "min",
                value: 130,
                min: 1,
                max: 500
            });
            $(".slider-sample3").slider({
                range: true,
                min: 0,
                max: 500,
                values: [ 40, 170 ],
            });


        });
    </script>

</body>
</html>