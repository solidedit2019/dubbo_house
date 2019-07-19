<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>青鸟租房 -发布房屋信息</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type><LINK 
rel=stylesheet type=text/css href="../css/style.css">
<META name=GENERATOR content="MSHTML 8.00.7601.17514">
  <script language="JavaScript" src="../admin/js/jquery-1.8.3.js"></script>
  <script language="JavaScript" src="../admin/js/jquery.form.js"></script>

  <script language="JavaScript">
      $(function () {
          $("#district_id").change(function () {
              var did=$(this).val();
              $.post("getStreetByDid",{id:did},function (data) {
                  $("#street_id>option:gt(0)").remove();
                  for (var i = 0; i <data.length ; i++) {
                      var opt=$("<option value="+data[i].id+">"+data[i].name+"</option>");
                      $("#street_id").append(opt);
                  }

              },"json")
          });
         $.post("getAllType",null,function (data) {
             for (var i = 0; i <data.length ; i++) {
                 var op="<option value="+data[i].id+">"+data[i].name+"</option>"
                 $("#typeId").append(op);
             }
            $("#typeId").val(${house.typeId})
         },"json");

          $.post("getAllDistrict",null,function (data) {
              for (var i = 0; i <data.length ; i++) {
                  var op="<option value="+data[i].id+">"+data[i].name+"</option>"
                  $("#district_id").append(op);
              }
              $("#district_id").val(${house.did});
          },"json");


              var did=${house.did};
          $.post("getAllStreet",{did:did},function (data) {
              for (var i = 0; i <data.length ; i++) {
                  var op="<option value="+data[i].id+">"+data[i].name+"</option>"
                  $("#street_id").append(op);
              }
              $("#street_id").val(${house.streetId})
          },"json");

      })
  </script>
</HEAD>
<BODY>
<DIV id=header class=wrap>
<DIV id=logo><IMG src="../images/logo.gif"></DIV></DIV>
<DIV id=regLogin class=wrap>
<DIV class=dialog>
<DL class=clearfix>
  <DT>新房屋信息发布</DT>
  <DD class=past>填写房屋信息</DD></DL>
<DIV class=box>
<FORM id=add_action method=post name=add.action 
action=updateHouse enctype="multipart/form-data" >
<DIV class=infos>
<TABLE class=field>
  <TBODY>
  <TR>
    <input type="hidden" name="id" value="${house.id}">
    <TD class=field>标　　题：</TD>
    <TD><INPUT id=add_action_title class=text value="${house.title}" type=text name=title> </TD></TR>
  <TR>
    <TD class=field>户　　型：</TD>
    <TD><SELECT class=text name=typeId id="typeId">

    </SELECT></TD></TR>
  <TR>
    <TD class=field>面　　积：</TD>
    <TD><INPUT id=add_action_floorage value="${house.floorage}" class=text type=text
name=floorage></TD></TR>
  <TR>
    <TD class=field>价　　格：</TD>
    <TD><INPUT id=add_action_price value="${house.price}" class=text type=text name=price> </TD></TR>
  <TR>
    <TD class=field>发布日期：</TD>
    <TD><INPUT class=text type=date value="<fmt:formatDate value="${house.pubdate}" pattern="yyyy-MM-dd"></fmt:formatDate>" name=pubdate></TD></TR>
  <TR>
    <TD class=field>位　　置：</TD>
    <TD>区：<SELECT class=text name=did id="district_id">
      <OPTION selected value="">--请选择--</OPTION>


    </SELECT> 街：<SELECT class=text
        name=streetId id="street_id">
      <OPTION selected value="" >--请选择--</OPTION></SELECT>
    </TD></TR>
  <TR>
    <TD class=field>联系方式：</TD>
    <TD><INPUT id=add_action_contact value="${house.contact}" class=text type=text name=contact></TD>
  </TR>
  <tr>
    <td class=field></td>
    <td> <img width="100" src="http://localhost:80/${house.path}" ></td>
  </tr>
  <TR>
    <TD class=field>选择图片：</TD>
    <TD><input type="file" id="pfile" name="pfile"></TD>
    <input type="hidden" name="path" value="${house.path}">
  </TR>
  <TR>
    <TD class=field>详细信息：</TD>
    <TD><TEXTAREA name=description>${house.description}</TEXTAREA></TD>
  </TR>
  </TBODY>
</TABLE>
  <DIV class=buttons><INPUT  value=修改 type=submit><INPUT  value=返回 type=button onclick="history.go(-1)"></DIV>


</DIV>
</FORM>
</DIV>
</DIV>
</DIV>
</BODY>

</HTML>