<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>情系江华后台管理系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="${pageContext.request.contextPath}/web_page/administrator/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/web_page/administrator/css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/web_page/administrator/css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/web_page/administrator/css/lib/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/web_page/administrator/css/lib/font-awesome.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web_page/administrator/css/layout.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web_page/administrator/css/elements.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web_page/administrator/css/icons.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web_page/administrator/css/compiled/index.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web_page/administrator/css/compiled/tables.css" type="text/css" media="screen" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>

	<%@ include file="admin-navbar.jsp"%>
	<%@ include file="admin-navigation.jsp"%>
	
	<!-- main container -->
    <div class="content">
        <div class="container-fluid">
            <div id="main-stats">
                <div class="row-fluid stats-row">
                    <div class="span3 stat">
                        <div class="data">
                            <span class="number">2457</span>
                            商品总数
                        </div>
                        <span class="date">商家发布总商品数</span>
                    </div>
                    <div class="span3 stat">
                        <div class="data">
                            <span class="number">3240</span>
                            用户总数
                        </div>
                        <span class="date">自2016年4月起</span>
                    </div>
                    <div class="span3 stat">
                        <div class="data">
                            <span class="number">328</span>
                            订单
                        </div>
                        <span class="date">今日成交订单总数</span>
                    </div>
                    <div class="span3 stat last">
                        <div class="data">
                            <span class="number">￥2,340</span>
                            成交金额
                        </div>
                        <span class="date">今日成交金额总数</span>
                    </div>
                </div>
            </div>
           <div id="pad-wrapper">
                    <div class="row-fluid section sutucheck">
                        <h3 class="title">
                            江华商城浏览量汇总
                            <div class="btn-group pull-right">
                                <button class="glow left">日访客</button>
                                <button class="glow middle active">月访客</button>
                                <button class="glow right">年访客</button>
                            </div>
                        </h3>
                        <div class="span12">
                            <div id="statsChart"></div>
                        </div>
                    </div>
                </div>
            <div id="pad-wrapper2" class="users-list">
                <div class="row-fluid header">
                    <h3>留言待审核列表</h3>
                </div>

                <!-- Users table -->
                <div class="row-fluid table">
                    <div class="table-wrapper orders-table section sutucheck">
                        <div class="row-fluid">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th class="span3">
                                        发布日期
                                    </th>
                                    <th class="span3">
                                        <span class="line"></span>
                                        留言内容
                                    </th>
                                    <th class="span3">
                                        <span class="line"></span>
                                        发布人
                                    </th>
                                    <th class="span3">
                                        <span class="line"></span>
                                        审核状态
                                    </th>
                                    <th class="span3">
                                        <span class="line"></span>
                                        操作
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="first">
                                    <td>
                                        2015-6-6
                                    </td>
                                    <td>
                                        <a href="#">留言内容</a>
                                    </td>
                                    <td>
                                       用户名
                                    </td>
                                    <td>
                                        未审核
                                    </td>
                                    <td>
                                        <button class="btn btn-success">通过</button>
                                        <button class="btn btn-danger">不通过</button>
                                    </td>
                                </tr>
                                <tr class="first">
                                    <td>
                                        2015-6-6
                                    </td>
                                    <td>
                                        <a href="#">留言内容</a>
                                    </td>
                                    <td>
                                        用户名
                                    </td>
                                    <td>
                                        未审核
                                    </td>
                                    <td>
                                        <button class="btn btn-success">通过</button>
                                        <button class="btn btn-danger">不通过</button>
                                    </td>
                                </tr>
                                <tr class="first">
                                    <td>
                                        2015-6-6
                                    </td>
                                    <td>
                                        <a href="#">留言内容</a>
                                    </td>
                                    <td>
                                        用户名
                                    </td>
                                    <td>
                                        未审核
                                    </td>
                                    <td>
                                        <button class="btn btn-success">通过</button>
                                        <button class="btn btn-danger">不通过</button>
                                    </td>
                                </tr>
                                <tr class="first">
                                    <td>
                                        2015-6-6
                                    </td>
                                    <td>
                                        <a href="#">留言内容</a>
                                    </td>
                                    <td>
                                        用户名
                                    </td>
                                    <td>
                                        未审核
                                    </td>
                                    <td>
                                        <button class="btn btn-success">通过</button>
                                        <button class="btn btn-danger">不通过</button>
                                    </td>
                                </tr>
                                <tr class="first">
                                    <td>
                                        2015-6-6
                                    </td>
                                    <td>
                                        <a href="#">留言内容</a>
                                    </td>
                                    <td>
                                        用户名
                                    </td>
                                    <td>
                                        未审核
                                    </td>
                                    <td>
                                        <button class="btn btn-success">通过</button>
                                        <button class="btn btn-danger">不通过</button>
                                    </td>
                                </tr>
                                <tr class="first">
                                    <td>
                                        2015-6-6
                                    </td>
                                    <td>
                                        <a href="#">留言内容</a>
                                    </td>
                                    <td>
                                        用户名
                                    </td>
                                    <td>
                                        未审核
                                    </td>
                                    <td>
                                        <button class="btn btn-success">通过</button>
                                        <button class="btn btn-danger">不通过</button>
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
            </div>
            </div>
        </div>
    </div>


	<!-- scripts -->
    <script src="${pageContext.request.contextPath}/web_page/administrator/js/jquery-latest.js"></script>
    <script src="${pageContext.request.contextPath}/web_page/administrator/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/web_page/administrator/js/jquery-ui-1.10.2.custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/web_page/administrator/js/jquery.knob.js"></script>
    <script src="${pageContext.request.contextPath}/web_page/administrator/js/jquery.flot.js"></script>
    <script src="${pageContext.request.contextPath}/web_page/administrator/js/jquery.flot.stack.js"></script>
    <script src="${pageContext.request.contextPath}/web_page/administrator/js/jquery.flot.resize.js"></script>
    <script src="${pageContext.request.contextPath}/web_page/administrator/js/theme.js"></script>
    <script type="text/javascript">
        $(function () {

            // jQuery Knobs
            $(".knob").knob();



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



            // jQuery Flot Chart
            var visits = [[1, 50], [2, 40], [3, 45], [4, 23],[5, 55],[6, 65],[7, 61],[8, 70],[9, 65],[10, 75],[11, 57],[12, 59]];
            var visitors = [[1, 25], [2, 50], [3, 23], [4, 48],[5, 38],[6, 40],[7, 47],[8, 55],[9, 43],[10,50],[11,47],[12, 39]];

            var plot = $.plot($("#statsChart"),
                [ { data: visits, label: "游客"},
                 { data: visitors, label: "会员" }], {
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

            var previousPoint = null;
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
        });
    </script>

</body>
</html>