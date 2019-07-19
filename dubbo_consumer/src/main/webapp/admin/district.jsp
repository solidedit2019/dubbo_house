<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>区域信息</title>
    <link rel="stylesheet" type="text/css" href="easyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyUI/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyUI/css/demo.css">
    <script src="js/jquery-1.8.3.js"></script>
    <script src="js/jquery.easyui.min.js"></script>
    <script language="JavaScript" src="js/district.js">
    </script>
</head>
<body>
<!--显示区域-->
<table id="dg" fit="true" rownumbers="true"></table>

<div id="tb">
    <a href="javascript:addDistrict()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
    <a href="javascript:upDistrict()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
    <a href="javascript:deleteListDistrict()" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>

<div id="addDistrict" class="easyui-dialog" buttons="#addButtons"
     style="width: 280px; height: 250px; padding: 10px 20px;" closed="true" title="添加区域">

    <form id="addForm" method="post">
        <table>
            <tr>
                <td>区域名称:</td>
                <td><input type="text" name="name"/></td>
            </tr>

        </table>
    </form>
</div>

<div id="updateDistrict" class="easyui-dialog" buttons="#updateButtons"
     style="width: 280px; height: 250px; padding: 10px 20px;" closed="true">

    <form id="updateForm" method="post">
        <table>
            <tr>
                <td>区域编号:</td>
                <td><input type="text" name="id" readonly/></td>
            </tr>
            <tr>
                <td>区域名称:</td>
                <td><input type="text" name="name"/></td>
            </tr>

        </table>
    </form>
</div>
<div id="showStreet" class="easyui-dialog" buttons="#streetButtons"
     style="width: 400px; height: 400px; padding: 10px 20px;" closed="true">
    <table id="ta" fit="true" rownumbers="true"></table>

</div>

<div id="addButtons">
    <a href="javascript:SaveDialog()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:CloseDialog('addDistrict')" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>
<div id="updateButtons">
    <a href="javascript:UpDialog()" class="easyui-linkbutton" iconCls="icon-ok">修改</a>
    <a href="javascript:CloseDialog('updateDistrict')" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>
<div id="streetButtons">
    <a href="javascript:UpDialog()" class="easyui-linkbutton" iconCls="icon-ok">修改</a>
    <a href="javascript:CloseDialog('showStreet')" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>

</body>
</html>
