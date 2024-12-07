<%--
  Created by IntelliJ IDEA.
  User: Star_Star
  Date: 02/12/2024
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>商品列表</title>
  <%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"> --%>
</head>
<body>
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

<%-- 1、查询区域 --%>
<a href="/product/toAddPage" class="button-default">新增商品</a>
<a href="javascript:void(0);" class="button-default" onclick="removes()">批量删除</a>

<%-- 2、数据展示区域 --%>
<table class="hovertable">
  <thead>
  <tr>
    <th>商品名称</th>
    <th>商品编号</th>
    <th>商品类型</th>
    <th>商品单位</th>
    <th>商品单价</th>
    <th>操作</th>
  </tr>
  </thead>

  <tbody id="tbl_content"></tbody>
</table>

<script>
  function getSelected() {
    let objs = document.getElementsByName("productId");
    let arr = [];
    for (let k in objs) {
      if (objs[k].checked) {
        arr.push(objs[k].value);
      }
    }
    return arr;
  }

  function removes() {
    if (window.confirm("确定删除吗?")) {
      let url = "/product/remove";
      let d = getSelected();
      fetch(url, {
        method: "POST",
        body: `ids=` + d,
        headers: {"Content-Type": 'application/x-www-form-urlencoded'}
      }).then(response => {
        return response.json();
      }).then(data => {
        if (data && data.code == '0') {
          init();
        } else {
          alert(data.msg);
        }
      }).catch(err => {
        alert(err);
      });
    }
  }

  function remove(code){
    if (window.confirm("确定删除吗?")){
      console.log(code);
      //1、调用fetch方法从后台调用数据发送前台
      let url="/product/remove/"+code;
      fetch(url,{
        method:"get",
        // headers
      }).then(response=>{
        return response.json();
      }).then(data=>{
        if(data&&data.code=='0'){
          init();
        }else{
          alert(data.msg);
        }
      }).catch(err=>{
        alert("请求出错");
      })
    }

  }

  function init() {
    let url = "/product/list";
    fetch(url, {
      method: "POST",
    }).then(response => {
      if (!response.ok) {
        throw new Error("Network response was not ok");
      }
      return response.json();
    }).then(data => {
      if (data && data.code === '0') {
        document.getElementById("tbl_content").innerHTML = "";
        if (data.data.length === 0) {
          // 当没有商品数据时显示提示信息
          document.getElementById("tbl_content").innerHTML = "<tr><td colspan='6' style='text-align:center;'>没有商品数据可显示</td></tr>";
        } else {
          let strHtml = "";
          data.data.forEach(item => {
            strHtml += "<tr>";
            // strHtml += "<td><input type='checkbox' name='productId' value='" + item.id + "'></td>"; // 商品ID
            strHtml += "<td>" + item.name + "</td>"; // 商品名称
            strHtml += "<td>" + item.code + "</td>"; // 商品编号
            strHtml += "<td>" + item.type + "</td>"; // 商品类型
            strHtml += "<td>" + item.unit + "</td>"; // 商品单位
            strHtml += "<td>" + item.price + "</td>"; // 商品单价
            strHtml += "<td>";
            strHtml += '<a href="/product/toEditPage/' + item.code + '" class="button-default">修改</a>';
            strHtml += '<a href="javascript:void(0);" class="button-default" onclick="remove(\'' + item.code + '\')">删除</a>';
            strHtml += "</td>";
            strHtml += "</tr>";
          });
          document.getElementById("tbl_content").innerHTML = strHtml;
        }
      } else {
        alert(data.msg);
      }
    }).catch(err => {
      alert("请求出错: " + err.message);
    });
  }

  window.onload = function () {
    init();
  }
</script>

</body>
</html>