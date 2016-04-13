<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>情系江华后台管理系统</title>
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
        <div id="pad-wrapper2" class="users-list">
            <div class="row-fluid header">
                <h3>图片轮播列表</h3>
            </div>

            <!-- Users table -->
            <div class="row-fluid table">
                <div class="table-wrapper orders-table section sutucheck">
                    <div class="row-fluid">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th class="span2">
                                    发布日期
                                </th>
                                <th class="span2">
                                    <span class="line"></span>
                                    图片名
                                </th>
                                <th class="span2">
                                    <span class="line"></span>
                                    申请人
                                </th>
                                <th class="span2">
                                    <span class="line"></span>
                                    图片大小
                                </th>
                                <th class="span2">
                                    <span class="line"></span>
                                    缩略图
                                </th>
                                <th class="span2">
                                    <span class="line"></span>
                                    状态
                                </th>
                                <th class="span2">
                                    <span class="line"></span>
                                    操作
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="first">
                                <td>
                                    2016-6-6
                                </td>
                                <td>
                                    <a href="#">农家腊肉大促销</a>
                                </td>
                                <td>
                                    欣欣
                                </td>
                                <td>
                                    1024*600
                                </td>
                                <td>

                                </td>
                                <td>
                                    未审核
                                </td>
                                <td>
                                    <button class="btn btn-danger btn-small">轮播</button>
                                    <button class="btn btn-important btn-small">删除</button>
                                </td>
                            </tr>
                            <tr class="first">
                                <td>
                                    2016-6-6
                                </td>
                                <td>
                                    <a href="#">农家腊肉大促销</a>
                                </td>
                                <td>
                                    欣欣
                                </td>
                                <td>
                                    1024*600
                                </td>
                                <td>

                                </td>
                                <td>
                                    <label class="label label-danger">轮播</label>
                                </td>
                                <td>
                                    <button class="btn btn-info btn-small">撤消</button>
                                    <button class="btn btn-important btn-small">删除</button>
                                </td>
                            </tr>
                            <tr class="first">
                                <td>
                                    2016-6-6
                                </td>
                                <td>
                                    <a href="#">农家腊肉大促销</a>
                                </td>
                                <td>
                                    欣欣
                                </td>
                                <td>
                                    1024*600
                                </td>
                                <td>

                                </td>
                                <td>
                                    未审核
                                </td>
                                <td>
                                    <button class="btn btn-danger btn-small">轮播</button>
                                    <button class="btn btn-important btn-small">删除</button>
                                </td>
                            </tr>
                            <tr class="first">
                                <td>
                                    2016-6-6
                                </td>
                                <td>
                                    <a href="#">农家腊肉大促销</a>
                                </td>
                                <td>
                                    欣欣
                                </td>
                                <td>
                                    1024*600
                                </td>
                                <td>

                                </td>
                                <td>
                                    <label class="label label-danger">轮播</label>
                                </td>
                                <td>
                                    <button class="btn btn-info btn-small">撤消</button>
                                    <button class="btn btn-important btn-small">删除</button>
                                </td>
                            </tr>
                            <tr class="first">
                                <td>
                                    2016-6-6
                                </td>
                                <td>
                                    <a href="#">农家腊肉大促销</a>
                                </td>
                                <td>
                                    欣欣
                                </td>
                                <td>
                                    1024*600
                                </td>
                                <td>

                                </td>
                                <td>
                                    未审核
                                </td>
                                <td>
                                    <button class="btn btn-danger btn-small">轮播</button>
                                    <button class="btn btn-important btn-small">删除</button>
                                </td>
                            </tr>
                            <tr class="first">
                                <td>
                                    2016-6-6
                                </td>
                                <td>
                                    <a href="#">农家腊肉大促销</a>
                                </td>
                                <td>
                                    欣欣
                                </td>
                                <td>
                                    1024*600
                                </td>
                                <td>

                                </td>
                                <td>
                                    <label class="label label-danger">轮播</label>
                                </td>
                                <td>
                                    <button class="btn btn-info btn-small">撤消</button>
                                    <button class="btn btn-important btn-small">删除</button>
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
    <div class="container-fluid">
        <div id="pad-wrapper" class="users-list">
            <div class="row-fluid header">
                <h3>广告位列表</h3>
            </div>

            <!-- Users table -->
            <div class="row-fluid table">
                <div class="table-wrapper orders-table section sutucheck">
                    <div class="row-fluid">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th class="span2">
                                    发布日期
                                </th>
                                <th class="span2">
                                    <span class="line"></span>
                                    商品名
                                </th>
                                <th class="span2">
                                    <span class="line"></span>
                                    店铺名
                                </th>
                                <th class="span3">
                                    <span class="line"></span>
                                    申请内容
                                </th>
                                <th class="span3">
                                    <span class="line"></span>
                                   状态
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
                                    2016-6-6
                                </td>
                                <td>
                                    <a href="#">江华板栗</a>
                                </td>
                                <td>
                                    欣欣的店
                                </td>
                                <td>
                                    促销 热销
                                </td>
                                <td>
                                    未审核
                                </td>
                                <td>
                                    <button class="btn btn-success btn-small">促销</button>
                                    <button class="btn btn-danger btn-small">热销</button>
                                    <button class="btn btn-info btn-small">推荐</button>
                                    <button class="btn btn-important btn-small">删除</button>
                                </td>
                            </tr>
                            <tr class="first">
                                <td>
                                    2016-6-6
                                </td>
                                <td>
                                    <a href="#">江华板栗</a>
                                </td>
                                <td>
                                    欣欣的店
                                </td>
                                <td>
                                    促销 热销
                                </td>
                                <td>
                                    <label class="label label-success ">促销</label>
                                </td>
                                <td>
                                    <button class="btn btn-success btn-small">撤消</button>
                                    <button class="btn btn-danger btn-small">热销</button>
                                    <button class="btn btn-info btn-small">推荐</button>
                                    <button class="btn btn-important btn-small">删除</button>
                                </td>
                            </tr>
                            <tr class="first">
                                <td>
                                    2016-6-6
                                </td>
                                <td>
                                    <a href="#">江华板栗</a>
                                </td>
                                <td>
                                    欣欣的店
                                </td>
                                <td>
                                    热销
                                </td>
                                <td>
                                    <label class="label label-danger">热销</label>
                                </td>
                                <td>
                                    <button class="btn btn-success btn-small">促销</button>
                                    <button class="btn btn-danger btn-small">撤消</button>
                                    <button class="btn btn-info btn-small">推荐</button>
                                    <button class="btn btn-important btn-small">删除</button>
                                </td>
                            </tr>
                            <tr class="first">
                                <td>
                                    2016-6-6
                                </td>
                                <td>
                                    <a href="#">江华板栗</a>
                                </td>
                                <td>
                                    欣欣的店
                                </td>
                                <td>
                                  热销
                                </td>
                                <td>
                                    <label class="label label-info">推荐</label>
                                </td>
                                <td>
                                    <button class="btn btn-success btn-small">促销</button>
                                    <button class="btn btn-danger btn-small">热销</button>
                                    <button class="btn btn-info btn-small">撤消</button>
                                    <button class="btn btn-important btn-small">删除</button>
                                </td>
                            </tr>
                            <tr class="first">
                                <td>
                                    2016-6-6
                                </td>
                                <td>
                                    <a href="#">江华板栗</a>
                                </td>
                                <td>
                                    欣欣的店
                                </td>
                                <td>
                                    促销 热销
                                </td>
                                <td>
                                    未审核
                                </td>
                                <td>
                                    <button class="btn btn-success btn-small">促销</button>
                                    <button class="btn btn-danger btn-small">热销</button>
                                    <button class="btn btn-info btn-small">推荐</button>
                                    <button class="btn btn-important btn-small">删除</button>
                                </td>
                            </tr>
                            <tr class="first">
                                <td>
                                    2016-6-6
                                </td>
                                <td>
                                    <a href="#">江华板栗</a>
                                </td>
                                <td>
                                    欣欣的店
                                </td>
                                <td>
                                    推荐
                                </td>
                                <td>
                                    未审核
                                </td>
                                <td>
                                    <button class="btn btn-success btn-small">促销</button>
                                    <button class="btn btn-danger btn-small">热销</button>
                                    <button class="btn btn-info btn-small">推荐</button>
                                    <button class="btn btn-important btn-small">删除</button>
                                </td>
                            </tr>
                            <tr class="first">
                                <td>
                                    2016-6-6
                                </td>
                                <td>
                                    <a href="#">江华板栗</a>
                                </td>
                                <td>
                                    欣欣的店
                                </td>
                                <td>
                                   推荐 热销
                                </td>
                                <td>
                                    未审核
                                </td>
                                <td>
                                    <button class="btn btn-success btn-small">促销</button>
                                    <button class="btn btn-danger btn-small">热销</button>
                                    <button class="btn btn-info btn-small">推荐</button>
                                    <button class="btn btn-important btn-small">删除</button>
                                </td>
                            </tr>
                            <tr class="first">
                                <td>
                                    2016-6-6
                                </td>
                                <td>
                                    <a href="#">江华板栗</a>
                                </td>
                                <td>
                                    欣欣的店
                                </td>
                                <td>
                                    促销 热销
                                </td>
                                <td>
                                    <label class="label label-success">促销</label>
                                </td>
                                <td>
                                    <button class="btn btn-success btn-small">撤消</button>
                                    <button class="btn btn-danger btn-small">热销</button>
                                    <button class="btn btn-info btn-small">推荐</button>
                                    <button class="btn btn-important btn-small">删除</button>
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
        <!-- end table sample -->
    </div>
</div>
</div>


<!-- scripts -->
<script src="js/jquery-latest.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-ui-1.10.2.custom.min.js"></script>
<!-- knob -->
<script src="js/jquery.knob.js"></script>
<!-- flot charts -->
<script src="js/jquery.flot.js"></script>
<script src="js/jquery.flot.stack.js"></script>
<script src="js/jquery.flot.resize.js"></script>
<script src="js/theme.js"></script>

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
                [ { data: visits, label: "Signups"},
                    { data: visitors, label: "Visits" }], {
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
                        ticks: [[1, "JAN"], [2, "FEB"], [3, "MAR"], [4,"APR"], [5,"MAY"], [6,"JUN"],
                            [7,"JUL"], [8,"AUG"], [9,"SEP"], [10,"OCT"], [11,"NOV"], [12,"DEC"]],
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