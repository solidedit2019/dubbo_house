
    $(function () {
        $('#ta').datagrid({
            toolbar: '#tb',
            title: "街道信息",
            url: 'getStreet',  //服务器地址
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
        

});


function addStreet() {
    $('#addStreet').window('open');
}

function CloseDialog(data) {
    $('#' + data).window('close');
}

<!--添加-->
function SaveDialog() {

    $("#addForm").form('submit', {
            url: "addStreet",
            success: function (data) {
                data = $.parseJSON(data);
                if (data.result) {
                    CloseDialog('addStreet');
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
function upStreet() {
    var rows = $("#ta").datagrid('getSelections');
    if (rows.length != 1) {
        $.messager.alert('提示框', '你还没中行或选择多行！', "info");
        return;
    }
    $("#updateStreet").dialog("open").dialog("setTitle", "修改区域");
    var row = rows[0];
    // $('#updateForm').form('load',row);
    $.post("getStreetById", {"id": row.id}, function (data) {
        $("#updateForm").form('load', data);
    }, "json");
}

function UpDialog() {
    $("#updateForm").form('submit', {
            url: "updateStreet",
            success: function (data) {
                data = $.parseJSON(data);
                if (data.result) {
                    CloseDialog('updateStreet');
                    $('#ta').datagrid('reload');
                    $.messager.alert('提示框', '修改成功！')
                } else {
                    $.messager.alert('提示框', '修改失败')
                }
            }
        }, "json"
    )
}

function deleteListStreet() {
    var rows = $("#ta").datagrid('getSelections');
    if (rows.length==0) {
        $.messager.alert('提示框', '你还没中行！', "info");
        return;
    }
    $.messager.confirm('区域删除', '确认删除吗？?', function (r) {
        if (r) {
            var id = "";
            var rows = $("#ta").datagrid('getSelections');
            for (var i = 0; i < rows.length; i++) {
                id +=rows[i].id+",";
            }
            id = id.substring(0, id.length - 1);
            $.post("deleteListStreet", {"id": id}, function (data) {
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
function deleteStreet(id) {
    $.messager.confirm('区域删除', '确认删除吗？?', function (r) {

        $.post("deleteStreet", {"id": id}, function (data) {
            if (data.result) {
                $('#ta').datagrid('reload');
                $.messager.alert('提示框', '删除成功')
            } else {
                $.messager.alert('提示框', '删除失败')
            }
        }, "json")

    });
}