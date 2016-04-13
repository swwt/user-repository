<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="sidebar-nav">
        <ul id="dashboard-menu">
            <li class="active">
                <div class="pointer">
                    <div class="arrow"></div>
                    <div class="arrow_border"></div>
                </div>
                <a href="${pageContext.request.contextPath}/web_page/administrator/index.jsp">
                    <i class="icon-home"></i>
                    <span>起始页</span>
                </a>
            </li>            
            <li>
                <div class="pointer">
                    <div class="arrow"></div>
                    <div class="arrow_border"></div>
                </div>
                <a href="${pageContext.request.contextPath}/web_page/administrator/index-manager.jsp">
                    <i class="icon-signal"></i>
                    <span>首页管理</span>
                </a>
            </li>
            <li>
                <a class="dropdown-toggle" href="#">
                    <i class="icon-group"></i>
                    <span>用户管理</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="/pc_user/pageQueryUsers">会员管理</a></li>
                    <li><a href="seller-manager.html">商家管理</a></li>
                    <li><a href="seller-ask.html">卖家审核</a></li>
                </ul>
            </li>
            <li>
                <a class="dropdown-toggle" href="#">
                    <i class="icon-edit"></i>
                    <span>订单管理</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="order-list.html">订单列表</a></li>
                    <li><a href="pay-list.html">已完成订单</a></li>
                </ul>
            </li>
            <li>
                <a class="dropdown-toggle ui-elements" href="#">
                    <i class="icon-tasks"></i>
                    <span>商品管理</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="goods.html">商品列表</a></li>
                    <li><a href="goods-ask.html">商品审核</a></li>
                </ul>
            </li>
            <li>
                <a class="dropdown-toggle ui-elements" href="#">
                    <i class="icon-flag"></i>
                    <span>公益管理</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="welfare.html">公益列表</a></li>
                    <li><a href="new-welfare.html">添加公益</a></li>
                </ul>
            </li>
            <li>
                <a class="dropdown-toggle ui-elements" href="#">
                    <i class="icon-code-fork"></i>
                    <span>站点管理</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="web-manager.html">站点信息</a></li>
                    <li><a href="new-manager.html">添加管理员</a></li>
                </ul>
            </li>
            <li>
                <a href="log.html">
                    <i class="icon-cog"></i>
                    <span>历史纪录</span>
                </a>
            </li>
        </ul>
    </div>
    <!-- end sidebar -->