<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    做题
                </div>
                <div class="panel-body">
                    <!-- 试题内容 -->
                    <div class="container">
                        <span class="text-primary"
                              style="font-size:16px;font-weight: 800;">${paper.testPaper.title}</span>
                        <span class="pull-right text-danger">
                            开始时间：<fmt:formatDate value="${paper.testPaper.starttime}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;
                            结束时间：<fmt:formatDate value="${paper.testPaper.endtime}" pattern="yyyy-MM-dd"/>
                        </span>
                    </div>
                    <hr>
                    <form  method="post" id="subform">
                        <input type="hidden" name="paperid" value="${paper.testPaper.id}">
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
                                                <input type="radio" name="ss_${item.question.id}" value="${sitem.id}"/>${sitem.content}
                                            </p>
                                        </c:forEach>
                                    </c:if>
                                    <!-- 多选 -->
                                    <c:if test="${item.question.type == '1'}">
                                        <c:forEach items="${item.selectItemList}" var="mitem" varStatus="dstatus">
                                            <p>
                                                <input type="checkbox" name="ms_${item.question.id}" value="${mitem.id}"/>${mitem.content}
                                            </p>
                                        </c:forEach>
                                    </c:if>
                                    <!-- 问答 -->
                                    <c:if test="${item.question.type == '2'}">
                                        <textarea name="wd_${item.question.id}" class="form-control" id="" cols="60"
                                                  rows="5"></textarea>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                        <hr>
                        <div style="text-align: center;margin:10px;">
                            <button class="btn btn-success" type="button" id="subwjquestion">提交问卷调查</button>
                        </div>
                    </form>
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
        $("#subwjquestion").on("click", function () {
            var dataJson = $("#subform").serializeArray();
            console.log(dataJson);
            $.ajax({
                url: "/exam/submitexam.do",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                type: "post",
                data: JSON.stringify(dataJson)
            }).done(function (msg) {
                if (msg == "success") {
                    alert("操作成功!")
                } else {
                    alert("操作失败！")
                }
            });
        });
    });
</script>
<%@include file="../public/footer_bottom.jsp" %>