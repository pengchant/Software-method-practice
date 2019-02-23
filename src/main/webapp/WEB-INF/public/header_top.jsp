<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width,user-scalable=0,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0"/>
    <!-- 引入zui -->
    <link href="${base}/ZUI/css/zui.min.css" rel="stylesheet"/>

    <%-- 针对IE8浏览器，我们引入html5shiv来使得HTML5标签在IE8中也能使用 --%>
    <!--[if lt IE 9]>
    <script src="${base}/ZUI/lib/ieonly/html5shiv.js"></script>
    <![endif]-->

    <%-- 因为IE8及早期版本同样不支持media query来实现响应式布局，我们同样可以通过条件注释引入respond.js来帮助ie实现该功能 --%>
    <!--[if lt IE 9]>
    <script src="${base}/ZUI/lib/ieonly/respond.js"></script>
    <![endif]-->

    <%-- 因为IE8及早期版本不支持Canvas，如果你的产品用到ZUI中的 图表 视图，则需要引入 ExplorerCanvas 来支持绘图功能 --%>
    <!--[if lt IE 9]>
    <script src="${base}/ZUI/lib/ieonly/excanvas.js"></script>
    <![endif]-->
