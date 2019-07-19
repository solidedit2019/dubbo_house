<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>区域信息</title>
    <link rel="stylesheet" type="text/css" href="easyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyUI/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyUI/css/demo.css">
    <script src="js/jquery-1.8.3.js"></script>
    <script src="js/jquery.easyui.min.js"></script>
    <script language="JavaScript" src="js/houseNopass.js">
    </script>
</head>
<body>
<!--显示区域-->
<table id="dg" fit="true" rownumbers="true"></table>

<div id="tb">
    <a href="javascript:allispassHouse()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">批量审核</a></br>
<div>
    用户：<input type="text" name="username" id="username">
    标题：<input type="text" name="title"id="title">
     户型：<input id="cc" name="tname" >
    <a href="javascript:shouHouse()" class="easyui-linkbutton"
       data-options="iconCls:'icon-search',plain:true">查询</a>
</div>
</div>

</body>
</html>
