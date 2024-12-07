<%--
  Created by IntelliJ IDEA.
  User: Star_Star
  Date: 02/12/2024
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>新增商品页面</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>

<h2>新增商品页面</h2>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 20px;
  }

  .hovertable {
    width: 100%;
    border-collapse: collapse;
    table-layout: fixed;
  }

  .hovertable th, .hovertable td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }

  .hovertable th {
    background-color: #4CAF50;
    color: white;
  }

  .hovertable tr:nth-child(even) {
    background-color: #f2f2f2;
  }

  .hovertable tr:hover {
    background-color: #ddd;
  }

  .button-default {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
  }

  .button-default:hover {
    background-color: #45a049;
  }

  input[type="text"], input[type="number"] {
    padding: 8px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
  }

  input[type="text"]:focus, input[type="number"]:focus {
    border-color: #4CAF50;
    outline: none;
  }
</style>
<table class="hovertable">
  <tr>
    <th colspan="2">新增商品信息</th>
  </tr>
  <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
    <td>商品名称</td><td><input id="name" type="text" name="name"></td>
  </tr>
  <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
    <td>商品编号</td><td><input id="code" type="text" name="code"></td>
  </tr>
  <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
    <td>商品类型</td><td><input id="type" type="text" name="type"></td>
  </tr>
  <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
    <td>商品单位</td><td><input id="unit" type="text" name="unit"></td>
  </tr>
  <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
    <td>商品单价</td><td><input id="price" type="number" name="price" step="0.01"></td>
  </tr>
  <tr style="background-color:#ffffff;text-align:center">
    <td colspan="2"><button class="button-default" onclick="add()">提交</button></td>
  </tr>
</table>
<script>
  function add(){
    let data = {
      "id":"1",
      "name": document.getElementById("name").value,
      "code": document.getElementById("code").value,
      "type": document.getElementById("type").value,
      "unit": document.getElementById("unit").value,
      "price": document.getElementById("price").value
    }
    let url = "/product/add"; // 修改为商品添加的 URL
    fetch(url, {
      method: 'POST',
      body: JSON.stringify(data),
      headers: { 'Content-Type': 'application/json' },
    }).then(response => {
      return response.json();
    }).then(data => {
      if (data && data.code == '0') {
        window.location = '/product/toProductPage'; // 修改为商品列表页面的 URL
      } else {
        alert(data.msg);
      }
    }).catch(err => {
      alert("错误: " + err);
    });
  }
</script>
</body>
</html>