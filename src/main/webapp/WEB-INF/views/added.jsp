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
                    查看已出题
                </div>
                <div class="panel-body">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>问卷调查名称</th>
                            <th>开始时间</th>
                            <th>结束时间</th>
                            <th>已作答人数</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pagedata.list}" var="item" varStatus="status">
                            <tr>
                                <td>${item.id}</td>
                                <td>${item.title}</td>
                                <td><fmt:formatDate value="${item.starttime}" pattern="yyyy-MM-dd"/></td>
                                <td><fmt:formatDate value="${item.endtime}" pattern="yyyy-MM-dd"/></td>
                                <td>${item.hastested}</td>
                                <td>
                                    <c:if test="${sessionScope.account.type=='1'}">
                                        <button class="btn btn-info"
                                                type="button"
                                                onclick="window.location.href='/exam/tongji.do?examid=${item.id}'">
                                            <i class="icon icon-eye-open"></i>
                                        </button>
                                    </c:if>
                                    <button class="btn btn-warning"
                                            type="button"
                                            onclick="window.location.href='/exam/doexam.do?examid=${item.id}'">
                                        <i class="icon icon-pencil"></i></button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <ul class="pager"
                        id="myPagerExample"
                        data-ride="pager"
                        data-page="${pagedata.pageNum}"
                        data-rec-per-page="${pagedata.pageSize}"
                        data-rec-total="${pagedata.total}"
                        data-elements="prev_icon,nav,next_icon"
                        data-link-creator="/exam/added.do?pageNo={page}&pageSize={recPerPage}"></ul>
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

        $('#myPagerExample').pager({
            linkCreator: function (page, pager) {
                return '/exam/added.dod?pageNo=' + page + '&pageSize=' + pager.recPerPage;
            }
        });

    });
</script>
<%@include file="../public/footer_bottom.jsp" %>