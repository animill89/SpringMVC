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
<title>新增用户</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
<body>
<!-- Table goes in the document BODY -->
<form method="post" action="add">
  <table class="hovertable">
    <tr>
      <th colspan="2">新增用户信息</th>
    </tr>
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
      <td>用户名</td><td><input type="text" name="name"></td>
    </tr>
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
      <td>邮箱</td><td><input type="email" name="email"></td>
    </tr>
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
      <td>联系电话</td><td><input type="text" name="phoneNumber"></td>
    </tr>
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
      <td>性别</td><td><input type="radio" value="0" name="sex">男<input type="radio" value="1" name="sex">女</td>
    </tr>
    <tr style="background-color:#ffffff;text-align:center">
      <td colspan="2"><input type="submit" value="提交" style="width:100%"></td>
    </tr>
  </table>
</form>
</body>
</html>

