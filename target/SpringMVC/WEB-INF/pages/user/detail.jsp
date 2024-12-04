
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<meta charset="utf-8">
<title>用户详情</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
<body>
<!-- Table goes in the document BODY -->
    <table class="hovertable">
        <tr>
            <th colspan="2">用户详情</th>
        </tr>
        <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
            <td>用户名</td><td>${user.name}</td>
        </tr>
        <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
            <td>邮箱</td><td>${user.email}</td>
        </tr>
        <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
            <td>联系电话</td><td>${user.phoneNumber}</td>
        </tr>
        <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
            <td>性别</td><td>${user.sex==0?'男':'女'}</td>
        </tr>
        
		 <tr style="background-color:#ffffff;text-align:center">
            <td colspan="2"><a href="list">返回列表</a></td>
        </tr>
    </table>
</body>
</html>