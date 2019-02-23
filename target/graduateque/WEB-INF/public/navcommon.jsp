<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<nav class="menu" data-ride="menu" style="width: 200px">
    <ul id="treeMenu" class="tree tree-menu" data-ride="tree">
        <!-- 就业指导老师 -->
        <c:if test="${sessionScope.account.type=='1'}">
            <li><a href="/user/teacher.do"><i class="icon icon-desktop"></i>出题</a></li>
        </c:if>
        <li><a href="/exam/added.do"><i class="icon icon-file-text-o"></i>查看已出题</a></li>
        <li><a href="#"><i class="icon icon-area-chart"></i>统计结果查询</a></li>
        <!--学生-->
        <li><a href="#"><i class="icon icon-edit"></i>做题</a></li>
    </ul>
</nav>
