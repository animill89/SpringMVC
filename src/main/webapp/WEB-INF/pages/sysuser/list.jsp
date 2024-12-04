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
    <title>用户列表</title>
<%--    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">--%>
</head>
<body>

<%--1、查询区域--%>
<a href="/user/toAddPage" class="button-default">新增</a>
<a href="javascript:void(0);" class="button-default" onclick="removes()">批量删除</a>
<%--2、数据展示区域--%>

<table class="hovertable">
   <thead>
   <tr>
       <th>选择</th>
       <th>用户名</th>
       <th>邮箱</th>
       <th>性别</th>
       <th>电话</th>
       <th >操作</th>
   </tr>
   </thead>

    <tbody id="tbl_content"></tbody>

</table>

<script>

    function getSelected(){
        let objs=document.getElementsByName("userId");
        let arr = new Array();
        for(k in objs){
            if (objs[k].checked){
                arr.push(objs[k].value);
            }
        }
        return arr;
    }
    // window.location="";
    function removes(){
        if (window.confirm("确定删除吗?")){
            let url="/user/remove";
            let d=getSelected();
            fetch(url,{
                method:"post",
                body:`ids=`+d,
                headers: {"Content-Type": 'application/x-www-form-urlencoded',}
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
                alert(err);
            })
        }
        //1、获取需要删除的用户id
        //2、调用fetch方法发送后台服务请求
        //3、页面渲染

    }

    function remove(id){
        if (window.confirm("确定删除吗?")){
            //1、调用fetch方法从后台调用数据发送前台
            let url="/user/remove/"+id;
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
                alert(err);
            })
        }

    }

    function init(){
        //1、调用fetch方法从后台调用数据发送前台
        let url="/user/list";
        fetch(url,{
            method:"POST",
            // headers
        }).then(response=>{
            return response.json();
        }).then(data=>{
            if(data&&data.code=='0'){
                document.getElementById("tbl_content").innerHTML="";
                let strHtml="";
                data.data.forEach(item=>{
                    strHtml+="<tr>"
                    strHtml+="<td>"
                    strHtml+="<input id='ckb' type='checkbox' name='userId' value='"+item.userId+"'>"
                    strHtml+="</td>"
                    strHtml+="</tr>"

                    strHtml+="<tr>"
                    strHtml+="<td>"
                    strHtml+=item.name;
                    strHtml+="</td>"
                    strHtml+="</tr>"

                    strHtml+="<tr>"
                    strHtml+="<td>"
                    strHtml+=item.email;
                    strHtml+="</td>"
                    strHtml+="</tr>"

                    strHtml+="<tr>"
                    strHtml+="<td>"
                    strHtml+=item.sex===0?'男':'女';
                    strHtml+="</td>"
                    strHtml+="</tr>"

                    strHtml+="<tr>"
                    strHtml+="<td>"
                    strHtml+=item.phoneNumber;
                    strHtml+="</td>"
                    strHtml+="</tr>"

                    strHtml+="<tr>"
                    strHtml+="<td>"
                    strHtml+='<a href="/user/toEditPage/'+item.userId+'" class="button-default">修改</a>'
                    strHtml+='<a href="javascript:void(0);" class="button-default" onclick="removes('+item.userId+')">删除</a>'
                    strHtml+="</td>"
                    strHtml+="</tr>"
                })
                document.getElementById("tbl_content").innerHTML=strHtml;
            }
        }).catch(err=>{
            alert(err);
        })
    }
    window.onload=function (){
        init();
    }
</script>

</body>
</html>
