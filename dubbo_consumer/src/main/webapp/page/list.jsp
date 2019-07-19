<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>青鸟租房 - 首页</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="../css/style.css">
<META name=GENERATOR content="MSHTML 8.00.7601.17514"></HEAD>

<script language="JavaScript" src="../admin/js/jquery-1.8.3.js"></script>
<script>
   $(function () {
       $.post("getAllType",null,function (data) {
           for (var i = 0; i <data.length ; i++) {
               var op=$("<option value="+data[i].id+">"+data[i].name+"</option>");
               $("#typeid").append(op);
           }
           $("#typeid").val(${condition.typeid})
       },"json");

       $.post("getAllDistrict",null,function (data) {
           for (var i = 0; i <data.length ; i++) {
               var op=$("<option value="+data[i].id+">"+data[i].name+"</option>");
               $("#did").append(op);
           }
           $("#did").val(${condition.did})
       },"json");


          var did=${condition.did}
           $.post("getAllStreet",{"did":did},function (data) {
                if(data!=null){
                    for (var i = 0; i <data.length ; i++) {
                        var op=$("<option value="+data[i].id+">"+data[i].name+"</option>");
                        $("#streetid").append(op);
                    }
                }

               $("#streetid").val(${condition.streetid})
           },"json");



       $("#did").change(function () {
           var did=$("#did").val();
           $.post("getAllStreet",{'did':did},function (data) {
               $("#streetid>option:gt(0)").remove();
               for (var i = 0; i <data.length ; i++) {

                   var op=$("<option value="+data[i].id+">"+data[i].name+"</option>");
                   $("#streetid").append(op);
               }

           },"json");
       });


   });

   function do_page(page) {
       $("#page").val(page);
       $("#form1").submit();

   }

</script>
<BODY>
<DIV id=header class=wrap>
<DIV id=logo><IMG src="../images/logo.gif"></DIV></DIV>
<DIV id=navbar class=wrap>
<DL class="search clearfix">
  <FORM id=form1 method=post action=getPageHouse>
  <Dd>
  <UL>

      <input type="hidden" id="page" name="page" value="1">
    <LI class=first>标题</LI><li>
      <INPUT  type=text name=title size="10px" value="${condition.title}" >

    </LI>
  </UL>
  </Dd>
  <DD>
  <UL>
    <LI>价格 </LI>
    <LI>
      <input type="text"  name="minprice" value="${condition.minprice}" size="8px">-
      </LI>
  </UL>
  </DD>
    <DD>
      <UL>
        <LI>价格 </LI>
        <LI>
          <input type="text"  name="maxprice" value="${condition.maxprice}" size="8px">
        </LI>
      </UL>
    </DD>

  <DD>
  <UL>
    <LI class=first>房屋区域</LI>
    <LI>
      <SELECT id="did" name="did">
      <OPTION  value="">不限</OPTION>
    </SELECT> </LI></UL></DD>
  <DD>
    <DD>
  <UL>
    <LI class=first>房屋街道</LI>
    <LI><SELECT id=streetid name=streetid >
      <OPTION  value="">不限</OPTION>

    </SELECT> </LI></UL></DD>
  <DD>
  <UL>
    <LI class=first>房型</LI>
    <LI>
      <SELECT name=typeid id="typeid">
      <OPTION  value="">不限</OPTION>

    </SELECT>
  </LI></UL></DD>

    <Dd style="height: 30px">
      <UL >
          <LABEL class=ui-blue >
              <INPUT style="width: 100px; height: 45px"  value=搜索房屋 type=submit name=search></LABEL>
      </UL>
    </Dd>

  </FORM>
</DL>
</DIV>
<c:if test="${!empty info.list}">
  <c:forEach items="${info.list}" var="h">

<DIV class="main wrap">
<TABLE class=house-list>
  <TBODY>
  <TR>
    <TD class=house-thumb><span><A href="details.jsp" target="_blank"><img src="../images/thumb_house.gif" width="100" height="75" alt=""></a></span></TD>
    <TD>
      <DL>
        <DT><A href="details.jsp" target="_blank">${h.title}</A></DT>
        <DD>${h.dname}-${h.sname},${h.floorage}平米<BR>联系方式：${h.contact} </DD></DL></TD>
    <TD class=house-type>${h.tname}</TD>
    <TD class=house-price><SPAN>${h.price}</SPAN>元/月</TD></TR>
  </c:forEach>
  </c:if>
  <c:if test="${empty info.list}">
    <center style="color: red;">无租房信息</center>
  </c:if>
  </TBODY></TABLE>
<DIV class=pager>
<UL>
  <LI class=current><A href="javascript:do_page(1)">首页</A></LI>
  <LI><A href="javascript:do_page(${info.prePage==0?1:info.prePage})">上一页</A></LI>
  <LI><A href="javascript:do_page(${info.nextPage==0?1:info.nextPage})">下一页</A></LI>
  <LI><A href="javascript:do_page(${info.pages})">末页</A></LI></UL><SPAN
class=total>${info.pageNum}/${info.pages}页</SPAN> </DIV></DIV>
<DIV id=footer class=wrap>
<DL>
  <DT>青鸟租房 © 2018 北大青鸟 京ICP证1000001号</DT>
  <DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD></DL></DIV></BODY></HTML>
