<%--
  Created by IntelliJ IDEA.
  User: Star_Star
  Date: 20/11/2024
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<meta charset="utf-8">
<title>用户列表</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
<body>
<!-- Table goes in the document BODY -->
<table class="hovertable">
    <tr><td colspan="8"><a href="add">新增用户</a></td></tr>
    <tr>
        <th>选择</th><th>用户名</th><th>邮箱</th><th>性别</th><th>电话</th><th colspan="5">操作</th>
    </tr>
    <c:forEach items="${list}" var="item">
        <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';" style="background-color: rgb(212, 227, 229);">
            <td>
                <input type="checkbox" name="userIds" value="${item.userId}"> <!-- 复选框 -->
            </td>
            <td>${item.name}</td>
            <td>${item.email}</td>
            <td>${item.sex == 0 ? '男' : '女'}</td>
            <td>${item.phoneNumber}</td>
            <td><a href="detail?name=${item.name}">详情</a></td>
            <td><a href="update?username=${item.name}">修改</a></td>
            <td><a href="delete?name=${item.name}">删除</a></td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
