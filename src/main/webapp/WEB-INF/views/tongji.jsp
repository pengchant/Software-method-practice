<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="../public/header_top.jsp" %>
<link href="../../ZUI/lib/datetimepicker/datetimepicker.min.css" rel="stylesheet">
<style>

    .m_a {
        text-decoration: none;
        color: white;
    }

    .m_a:hover {
        color: white;
        text-decoration: none;
    }

    .m_banner {
        height: 80px;
        background: #3280fc;
        font-size: 17px;
        color: white;
    }

    .logo {
        line-height: 80px;
        font-size: 19px;
    }

    .navfunc {
        line-height: 90px;
        font-size: 15px;
    }

</style>
<%@include file="../public/header_title.jsp" %>
<nav class="m_banner">
    <div class="container">
        <div class="logo pull-left">
            <i class="icon icon-group"></i>毕业问卷调查系统
        </div>
        <div class="pull-right navfunc">
            欢迎<span>${sessionScope.account.uname}</span>,
            <a href="/user/test.do" class="m_a">退出登录</a>
        </div>
    </div>
</nav>
<div class="container" style="margin-top:20px;">
    <div class="row">
        <div class="col-md-3">
            <%@include file="../public/navcommon.jsp" %>
        </div>
        <div class="col-md-9">
            <div class="panel panel-primary" style="min-height:400px;">
                <div class="panel-heading">
                    统计结果查询
                </div>
                <div class="panel-body">
                    <!-- 试题内容 -->
                    <div class="container">
                        <span class="text-primary"
                              style="font-size:16px;font-weight: 800;">${paper.testPaper.title}</span>
                        已有${paper.testPaper.hastested==null?0:paper.testPaper.hastested}人作答
                    </div>
                    <hr>
                    <c:forEach items="${paper.questionListdata}" var="item" varStatus="status">
                        <div class="container">
                            <div style="font-size: 17px;font-weight: 800;">
                                    ${item.question.content}
                            </div>
                            <div style="margin-left:10px;">
                                <!-- 选项 --->
                                <c:if test="${item.question.type == '0'}">
                                    <c:forEach items="${item.selectItemList}" var="sitem" varStatus="mstatus">
                                        <p>
                                             ${sitem.content} <span class="pull-right"> ${sitem.counter}
                                                 / ${paper.testPaper.hastested==null?0:paper.testPaper.hastested}</span>
                                        </p>
                                    </c:forEach>
                                </c:if>
                                <!-- 多选 -->
                                <c:if test="${item.question.type == '1'}">
                                    <c:forEach items="${item.selectItemList}" var="mitem" varStatus="dstatus">
                                        <p>
                                            ${mitem.content} <span class="pull-right"> ${mitem.counter}
                                                / ${paper.testPaper.hastested==null?0:paper.testPaper.hastested}</span>
                                        </p>
                                    </c:forEach>
                                </c:if>
                                <!-- 问答 -->
                                <c:if test="${item.question.type == '2'}">
                                    <c:forEach items="${item.answeritems}" var="answitem" varStatus="anstatus">
                                        <p>
                                            ${answitem.content}
                                        </p>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../public/footer_foot.jsp" %>
<script src="../../ZUI/lib/datetimepicker/datetimepicker.min.js"></script>
<script src="../../static/js/common.js"></script>
<script>
    $(function () {


    });
</script>
<%@include file="../public/footer_bottom.jsp" %>