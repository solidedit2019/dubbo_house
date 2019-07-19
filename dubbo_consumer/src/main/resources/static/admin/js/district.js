$(function () {
    //使用datagrid显示区域
    $('#dg').datagrid({
        fitColumns:true,
        autoRowHeight:false,
        toolbar: '#tb',
        title: "区域信息",
        url: 'getDistrict',  //服务器地址
        pagination: true,  //启用分页
        pageList: [3, 6, 9, 15, 20], //设置每页大小
        pageSize: 3, //每页三条
        columns: [[
            {field: 'ck', checkbox: true, width: 100, align: 'left'},
            {field: 'id', title: '编号', width: 100, align: 'left'},
            {field: 'name', title: '区域名称', width: 100, align: 'left'},
            {field: 'del', title: '操作', width: 100, align: 'left',
                formatter: function (value, row, index) {
                    return "<a href='javascript:deleteDistrict(" + row.id + ")'>删除</a>"+
                        "&nbsp;&nbsp;"+"<a href='javascript:showStreet(" + row.id + ")'>查看街道</a>";
                }
            }
        ]]
    });


});

function showStreet(id) {
    $('#showStreet').window('open');
    $('#ta').datagrid({
        toolbar: '#tb',
        title: "街道信息",
        url: 'getStreet?id='+id,  //服务器地址
        pagination: true,  //启用分页
        pageList: [3, 6, 9, 15, 20], //设置每页大小
        pageSize: 3, //每页三条
        columns: [[
            {field: 'ck', checkbox: true, width: 100, align: 'left'},
            {field: 'id', title: '街道编号', width: 100, align: 'left'},
            {field: 'name', title: '街道名称', width: 100, align: 'left'},
            {
                field: 'del', title: '删除区域', width: 100, align: 'left',
                formatter: function (value, row, index) {
                    return "<a href='javascript:deleteStreet(" + row.id + ")'>删除</a>";
                }
            }
        ]]
    });
}
function addDistrict() {
    $('#addDistrict').window('open');
}

function CloseDialog(data) {
    $('#' + data).window('close');
}

<!--添加-->
function SaveDialog() {

    $("#addForm").form('submit', {
            url: "addDistrict",
            success: function (data) {
                data = $.parseJSON(data);
                if (data.result) {
                    CloseDialog('addDistrict');
                    $("#addForm :input").val("");
                    $('#dg').datagrid('reload');
                    $.messager.alert('提示框', '添加成功！')
                } else {
                    $.messager.alert('提示框', '添加失败')
                }
            }
        }
    )
}
<!--修改-->
function upDistrict() {
    var rows = $("#dg").datagrid('getSelections');
    if (rows.length != 1) {
        $.messager.alert('提示框', '你还没中行或选择多行！', "info");
        return;
    }
    $("#updateDistrict").dialog("open").dialog("setTitle", "修改区域");
    var row = rows[0];
    // $('#updateForm').form('load',row);
    $.post("getDistrictById", {"id": row.id}, function (data) {
        $("#updateForm").form('load', data);
    }, "json");
}

function UpDialog() {
    $("#updateForm").form('submit', {
            url: "updateDistrict",
        success: function (data) {
                data = $.parseJSON(data);
                if (data.result) {
                    CloseDialog('updateDistrict');
                    $('#dg').datagrid('reload');
                    $.messager.alert('提示框', '修改成功！')
                } else {
                    $.messager.alert('提示框', '修改失败')
                }
            }
        }, "json"
    )
}

function deleteListDistrict() {
    var rows = $("#dg").datagrid('getSelections');
    if (rows.length==0) {
        $.messager.alert('提示框', '你还没中行！', "info");
        return;
    }
    $.messager.confirm('区域删除', '确认删除吗？?', function (r) {
        if (r) {
            var id = "";
            var rows = $("#dg").datagrid('getSelections');
            for (var i = 0; i < rows.length; i++) {
                id +=rows[i].id+",";
            }
            id = id.substring(0, id.length - 1);
            $.post("deleteListDistrict", {"id": id}, function (data) {
                if (data.result>0) {
                    $('#dg').datagrid('reload');
                    $.messager.alert('提示框', '删除成功')
                } else {
                    $.messager.alert('提示框', '删除失败')
                }
            }, "json")
        }

    });
}
function deleteDistrict(id) {
    $.messager.confirm('区域删除', '确认删除吗？?', function (r) {

        $.post("deleteDistrict", {"id": id}, function (data) {
            if (data.result) {
                $('#dg').datagrid('reload');
                $.messager.alert('提示框', '删除成功')
            } else {
                $.messager.alert('提示框', '删除失败')
            }
        }, "json")

    });
}