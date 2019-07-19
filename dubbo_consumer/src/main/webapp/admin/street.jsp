
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="easyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyUI/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyUI/css/demo.css">
    <script src="js/jquery-1.8.3.js"></script>
    <script src="js/jquery.easyui.min.js"></script>
    <script language="JavaScript" src="js/street.js">

    </script>
</head>


<body>
<table id="ta" fitColumns="true" fit="true" ></table>
<div id="tb">
    <a href="javascript:addStreet()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
    <a href="javascript:upStreet()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
    <a href="javascript:deleteListStreet()" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>
<div id="addStreet" class="easyui-dialog" buttons="#addButtons"
style="width: 280px; height: 250px; padding: 10px 20px;" closed="true" title="添加街道">

<form id="addForm" method="post">
    <table>
        <tr>
            <td>街道名称:</td>
            <td><input type="text" name="name"/></td>
        </tr>

    </table>
</form>
</div>

<div id="updateStreet" class="easyui-dialog" buttons="#updateButtons"
     style="width: 280px; height: 250px; padding: 10px 20px;" closed="true">

    <form id="updateForm" method="post">
        <table>
            <tr>
                <td>街道编号:</td>
                <td><input type="text" name="id" readonly/></td>
            </tr>
            <tr>
                <td>街道名称:</td>
                <td><input type="text" name="name"/></td>
            </tr>

        </table>
    </form>
</div>




<div id="addButtons">
    <a href="javascript:SaveDialog()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:CloseDialog('addStreet')" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>
<div id="updateButtons">
    <a href="javascript:UpDialog()" class="easyui-linkbutton" iconCls="icon-ok">修改</a>
    <a href="javascript:CloseDialog('updateStreet')" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>

</body>
</html>
