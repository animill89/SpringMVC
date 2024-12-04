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
    <title>新增页面</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>

<h2>新增页面</h2>
<table class="hovertable">
    <tr>
        <th colspan="2">新增用户信息</th>
    </tr>
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
        <td>用户名</td><td><input id="name" type="text" name="name"></td>
    </tr>
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
        <td>邮箱</td><td><input id="email" type="email" name="email"></td>
    </tr>
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
        <td>联系电话</td><td><input id="phoneNumber" type="tel" name="phoneNumber"></td>
    </tr>
    <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
        <td>性别</td>
            <td>
                 <label><input id="sex1" type="radio" value="0" name="sex">男</label>
                  <label><input id="sex2" type="radio" value="1" name="sex">女</label>
            </td>
    </tr>
    <tr style="background-color:#ffffff;text-align:center">
        <td colspan="2"><button class="button-default" onclick="add()">提交</button></td>
    </tr>
</table>
<script>
    function getValue(){
        let radio = document.getElementsByName("sex");
        for(i=0;i<radio.length;i++){
            if(radio[i].checked){
                // alert(radio[i].value);
                return radio[i].value;
            }
        }
        return null;
    }

    function add(){
        let data={
            "name":document.getElementById("name").value,
            "sex":getValue(),
            "email":document.getElementById("email").value,
            "phoneNumber":document.getElementById("phoneNumber").value,
            // "sex":document.getElementById("price").value
        }
        let url="/user/add";
        fetch(url,{
            method:'POST',
            body:JSON.stringify(data),
            headers:{'Content-Type':'application/json'},
        }).then(response=>{
            return response.json();
        }).then(data=>{
            if(data&&data.code=='0'){
                window.location='/user/toUserPage'
            }else{
                alert(data.msg);
            }
        }).catch(err=>{
            alert("错误")
        })
    }


</script>
</body>
</html>
