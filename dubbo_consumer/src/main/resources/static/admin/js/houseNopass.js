$(function () {
    //使用datagrid显示区域
    $('#dg').datagrid({
        fitColumns: true,
        autoRowHeight: false,
        toolbar: '#tb',
        title: "区域信息",
        url: 'getPass?ispass=0&isdel=0',  //服务器地址
        pagination: true,  //启用分页
        pageList: [3, 6, 9, 15, 20], //设置每页大小
        pageSize: 3, //每页三条
        columns: [[
            {field: 'ck', checkbox: true, width: 100, align: 'left'},
            {field: 'id', title: '编号', width: 100, align: 'left'},
            {field: 'tname', title: '房屋类型', width: 100, align: 'left'},
            {field: 'dname', title: '区域名称', width: 100, align: 'left'},
            {
                field: 'sname', title: '街道名称', width: 100, align: 'left'},
            {field: 'title', title: '标题', width: 100, align: 'left'},
            {field: 'description', title: '房屋描述', width: 100, align: 'left'},
            {field: 'price', title: '价格', width: 100, align: 'left'},
            {field: 'pubdate', title: '发布日期', width: 100, align: 'left',
                formatter: function (value, row, index) {
                    var date = new Date(value);
                    var year = date.getFullYear();
                    var m = date.getMonth() + 1;
                    var d = date.getDate();
                    return year + "年" + m + "月" + d+"日";

                }},
            {field: 'floorage', title: '面积', width: 100, align: 'left'},
            {field: 'contact', title: '联系电话', width: 100, align: 'left'},
            {
                field: 'del', title: '操作', width: 100, align: 'left',
                formatter: function (value, row, index) {
                    return "<a href='javascript:houYesPass(" + row.id + ")'>审核</a>";
                }
            }
        ]]
    });
    $('#cc').combobox({
        url:'getAllType',
        valueField:'id',
        textField:'name'
    }
    );


});
function shouHouse() {
    var username = $("#username").val();
    var title = $("#title").val();
    var tname= $("#cc").val();
    $("#dg").datagrid("load",{"username":username,"title":title,"tname":tname});
}
function houYesPass(id) {

    $.post("isPassHouse?ispass=1", {"id": id}, function (data) {
        if (data.result > 0) {
            $('#dg').datagrid('reload');
        } else {
            $.messager.alert('提示框', '审核失败')
        }
    }, "json")

}
function allispassHouse() {
    var rows = $("#dg").datagrid('getSelections');
    if(rows.length==0){
        $.messager.alert('提示框','您还没有选择行',"info");
        return ;
    }
    var id="";
    for (var i = 0; i <rows.length ; i++) {
          id+=rows[i].id+",";
    }
          id=id.substring(0,id.length-1);
           $.post("upAllisPassHouse?ispass=1",{"id":id},function (da) {
                   if(da.result>0){
                       $('#dg').datagrid('reload');
                   }else {
                       $.messager.alert('提示框', '审核失败')
                   }
           },"json")

}