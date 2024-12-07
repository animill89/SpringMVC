<%--
  Created by IntelliJ IDEA.
  User: Star_Star
  Date: 02/12/2024
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
  <title>编辑用户</title>
</head>
<body>
<h2>修改商品</h2>
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
    <th colspan="2">修改商品信息</th>
  </tr>
  <tr>
    <td>商品名称</td>
    <td><input id="name" type="text" name="name" required></td>
  </tr>
  <tr>
    <td>商品编号</td>
    <td><input id="code" type="text" name="code" required></td>
  </tr>
  <tr>
    <td>商品类型</td>
    <td><input id="type" type="text" name="type" required></td>
  </tr>
  <tr>
    <td>商品单位</td>
    <td><input id="unit" type="text" name="unit" required></td>
  </tr>
  <tr>
    <td>商品单价</td>
    <td><input id="price" type="number" name="price" step="0.01" required></td>
  </tr>
  <tr style="background-color:#ffffff;text-align:center">
    <td colspan="2"><button class="button-default" onclick="edit()">提交</button></td>
  </tr>
</table>

<script>
  function init(){
    let code = '<%= request.getAttribute("code") %>'; // 获取服务器端的code变量
    let url = "/product/get/" + code; // 使用 + 连接字符串
    fetch(url, {
      method: "get"
    }).then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json();
    }).then(data => {
      if(data && data.code == '0'){
        document.getElementById("name").value = data.data.name;
        document.getElementById("code").value = data.data.code;
        document.getElementById("type").value = data.data.type;
        document.getElementById("unit").value = data.data.unit;
        document.getElementById("price").value = data.data.price;
      } else {
        alert(data.msg);
      }
    }).catch(err => {
      alert("错误: " + err);
    });
  }

  window.onload = function () {
    init();
  }

  function edit(){
    let data = {
      "name": document.getElementById("name").value,
      "code": document.getElementById("code").value,
      "type": document.getElementById("type").value,
      "unit": document.getElementById("unit").value,
      "price": document.getElementById("price").value
    };
    let url = "/product/edit"; // 修改为商品编辑的 URL
    fetch(url, {
      method: 'POST',
      body: JSON.stringify(data),
      headers: { 'Content-Type': 'application/json' },
    }).then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
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