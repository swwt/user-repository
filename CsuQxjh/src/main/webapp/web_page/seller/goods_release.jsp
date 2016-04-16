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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web_page/seller/css/layout.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web_page/seller/css/elements.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web_page/seller/css/icons.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web_page/seller/css/lib/font-awesome.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web_page/seller/ss/compiled/form-showcase.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web_page/seller/css/compiled/new-user.css" type="text/css" media="screen" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>

    <%@include file="seller_navbar.jsp"%>
	<%@include file="seller_navigation.jsp"%>

	<!-- main container -->
    <div class="content">
        
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header">
                    <h3>添加新商品</h3>
                </div>

                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container">
                            <form class="new_user_form" >
                                <div class="span12 field-box">
                                    <div><strong>封面图片:</strong></div>
                                    <input type="file" id="suoluetu" class="hide" imgId="img" name="files">
                                    <label for="suoluetu" >
                                        <img id="img" src="${pageContext.request.contextPath}/web_page/seller/img/new-gallery-img.png" width="80" style="width:20vw;height=20vw">
                                    </label>
                                </div>
                                <div class="span12 field-box">
                                    <div><strong>商品图片:</strong></div>
                                    <input type="file" id="suoluetu1" class="hide" imgId="img1" name="files">
                                    <label for="suoluetu1" >
                                        <img id="img1" src="${pageContext.request.contextPath}/web_page/seller/img/new-gallery-img.png" width="80" style="width:20vw;height=20vw">
                                    </label>
                                    <input type="file" id="suoluetu2" class="hide" imgId="img2" name="files">
                                    <label for="suoluetu2" >
                                        <img id="img2" src="${pageContext.request.contextPath}/web_page/seller/img/new-gallery-img.png" width="80" style="width:20vw;height=20vw">
                                    </label>
                                    <input type="file" id="suoluetu3" class="hide" imgId="img3" name="files">
                                    <label for="suoluetu3" >
                                        <img id="img3" src="${pageContext.request.contextPath}/web_page/seller/img/new-gallery-img.png" width="80" style="width:20vw;height=20vw">
                                    </label>
                                    <input type="file" id="suoluetu4" class="hide" imgId="img4" name="files">
                                    <label for="suoluetu4" >
                                        <img id="img4" src="${pageContext.request.contextPath}/web_page/seller/img/new-gallery-img.png" width="80" style="width:20vw;height=20vw">
                                    </label>
                                    <input type="file" id="suoluetu5" class="hide" imgId="img5" name="files">
                                    <label for="suoluetu5" >
                                        <img id="img5" src="${pageContext.request.contextPath}/web_page/seller/img/new-gallery-img.png" width="80" style="width:20vw;height=20vw">
                                    </label>
                                </div>
                                <div class="span12 field-box">
                                    <label>商品名:</label>
                                    <input class="span9" type="text" />
                                </div>
                                <div class="span12 field-box">
                                    <label>商品分类:</label>
                                    <div class="ui-select span3">
                                        <select title="商品分类">
                                            <option value="" >分类</option>
                                            <option value="" >分类</option>
                                            <option value="" >分类</option>
                                            <option value="" >分类</option>
                                            <option value="" >分类</option>
                                            <option value="" >分类</option>
                                        </select>
                                        <select title="商品分类">
                                            <option value="" >分类</option>
                                            <option value="" >分类</option>
                                            <option value="" >分类</option>
                                            <option value="" >分类</option>
                                            <option value="" >分类</option>
                                            <option value="" >分类</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="span12 field-box">
                                    <div class="span6">
                                        <label>市场价:</label>
                                        <div class="input-append">
                                            <input class="span8" type="text" />
                                            <span class="add-on">元</span>
                                        </div>
                                    </div>
                                    <div class="span6">
                                        <label>会员价:</label>
                                        <div class="input-append">
                                            <input class="span8" type="text" />
                                            <span class="add-on">元</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="span12 field-box">
                                    <div><strong>推荐至:</strong></div><br>
                                    <label class="checkbox">
                                        <input type="checkbox" /> 精品
                                    </label>
                                    <label class="checkbox">
                                        <input type="checkbox" /> 新品
                                    </label>
                                    <label class="checkbox">
                                        <input type="checkbox" /> 热销
                                    </label>
                                    <label class="checkbox">
                                        <input type="checkbox" /> 促销
                                    </label>
                                </div>
                                <div class="span12 field-box textarea">
                                    <label>商品详情:</label>
                                    <textarea class="span9" title="商品详情"></textarea>
                                    <span class="charactersleft">可用插件直接代替textarea</span>
                                </div>
                                <div class="span11 field-box actions">
                                    <input type="button" class="btn-glow primary" value="发布商品" />
                                    <span>—</span>
                                    <input type="reset" value="重置信息" class="reset" />
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- side right column -->
                    <div class="span3 form-sidebar pull-right">

                        <div class="alert alert-info hidden-tablet">
                            <i class="icon-lightbulb pull-left"></i>
                            温馨提示
                            <h6>希望我们的建议可以帮助到您</h6><br />
                            <p>1.封面图片不宜过大，建议在600*400以内</p>
                            <p>2.上传的图片大小最好在1024*1024以内</p>
                            <p>1.封面图片不宜过大，建议在600*400以内</p>
                            <p>2.上传的图片大小最好在1024*1024以内</p>
                            <p>1.封面图片不宜过大，建议在600*400以内</p>
                            <p>2.上传的图片大小最好在1024*1024以内</p>
                        </div>                        

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end main container -->


	<!-- scripts -->
    <script src="${pageContext.request.contextPath}/web_page/seller/js/jquery-latest.js"></script>
    <script src="${pageContext.request.contextPath}/web_page/seller/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/web_page/seller/js/theme.js"></script>

    <script type="text/javascript">
        $(function () {

            // toggle form between inline and normal inputs
            var $buttons = $(".toggle-inputs button");
            var $form = $("form.new_user_form");

            $buttons.click(function () {
                var mode = $(this).data("input");
                $buttons.removeClass("active");
                $(this).addClass("active");

                if (mode === "inline") {
                    $form.addClass("inline-input");
                } else {
                    $form.removeClass("inline-input");
                }
            });
        });

       $('input[name="files"]').change(function () {
                var $file = $(this);

                var imgId = "#"+$file.attr('imgId');
                // alert(imgId);

                var fileObj = $file[0];
                var windowURL = window.URL || window.webkitURL;
                var dataURL;
                var $img = $(imgId);


                if (fileObj && fileObj.files && fileObj.files[0]) {
                    dataURL = windowURL.createObjectURL(fileObj.files[0]);
                    // alert(dataURL);
                    $img.attr('src', dataURL);
                } else {
                    dataURL = $file.val();
                    var imgObj = document.getElementById(imgId);
                     // 两个坑:
                     // 1、在设置filter属性时，元素必须已经存在在DOM树中，动态创建的Node，也需要在设置属性前加入到DOM中，先设置属性在加入，无效；
                     // 2、src属性需要像下面的方式添加，上面的两种方式添加，无效；
                    imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                    // alert(dataURL);
                    imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
                }
            }
        );

    </script>

</body>
</html>