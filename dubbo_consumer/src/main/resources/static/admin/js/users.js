
    $(function () {
        $('#ta').datagrid({
            toolbar: '#tb',
            title: "用户信息",
            url: 'getUsers',  //服务器地址
            pagination: true,  //启用分页
            pageList: [3, 6, 9, 15, 20], //设置每页大小
            pageSize: 3, //每页三条
            columns: [[
                {field: 'ck', checkbox: true, width: 100, align: 'left'},
                {field: 'id', title: '用户编号', width: 100, align: 'left'},
                {field: 'name', title: '用户名称', width: 100, align: 'left'},
                {field: 'telephone', title: '电话', width: 100, align: 'left'},
                {
                    field: 'del', title: '操作', width: 100, align: 'left',
                    formatter: function (value, row, index) {
                        return "<a href='javascript:deleteUsers(" + row.id + ")'>删除</a>";
                    }
                }
            ]]
        });
        

});

    function shouUsers() {
        var name = $("#name").val();
        var telephone = $("#telephone").val();
        $("#ta").datagrid("load",{"name":name,"telephone":telephone});
    }
function addUsers() {
    $('#addUsers').window('open');
}

function CloseDialog(data) {
    $('#' + data).window('close');
}

<!--添加-->
function SaveDialog() {

    $("#addForm").form('submit', {
            url: "addUsers",
            success: function (data) {
                data = $.parseJSON(data);
                if (data.result) {
                    CloseDialog('addUsers');
                    $('#ta').datagrid('reload');
                    $.messager.alert('提示框', '添加成功！');
                    $("#addForm :input").val("");
                } else {
                    $.messager.alert('提示框', '添加失败')
                }
            }
        }
    )
}
<!--修改-->
function upUsers() {
    var rows = $("#ta").datagrid('getSelections');
    if (rows.length != 1) {
        $.messager.alert('提示框', '你还没中行或选择多行！', "info");
        return;
    }
    $("#updateUsers").dialog("open").dialog("setTitle", "修改房屋类型");
    var row = rows[0];
    // $('#updateForm').form('load',row);
    $.post("getUsersById", {"id": row.id}, function (data) {
        $("#updateForm").form('load', data);
    }, "json");
}

function UpDialog() {
    $("#updateForm").form('submit', {
            url: "updateUsers",
            success: function (data) {
                data = $.parseJSON(data);
                if (data.result) {
                    CloseDialog('updateUsers');
                    $('#ta').datagrid('reload');
                    $.messager.alert('提示框', '修改成功！')
                } else {
                    $.messager.alert('提示框', '修改失败')
                }
            }
        }, "json"
    )
}

function deleteListUsers() {
    var rows = $("#ta").datagrid('getSelections');
    if (rows.length==0) {
        $.messager.alert('提示框', '你还没中行！', "info");
        return;
    }
    $.messager.confirm('房屋类型删除', '确认删除吗？?', function (r) {
        if (r) {
            var id = "";
            var rows = $("#ta").datagrid('getSelections');
            for (var i = 0; i < rows.length; i++) {
                id +=rows[i].id+",";
            }
            id = id.substring(0, id.length - 1);
            $.post("deleteListUsers", {"id": id}, function (data) {
                if (data.result>0) {
                    $('#ta').datagrid('reload');
                    $.messager.alert('提示框', '删除成功')
                } else {
                    $.messager.alert('提示框', '删除失败')
                }
            }, "json")
        }

    });
}
function deleteUsers(id) {
    $.messager.confirm('房屋类型删除', '确认删除吗？?', function (r) {

        $.post("deleteUsers", {"id": id}, function (data) {
            if (data.result) {
                $('#ta').datagrid('reload');
                $.messager.alert('提示框', '删除成功')
            } else {
                $.messager.alert('提示框', '删除失败')
            }
        }, "json")

    });
}