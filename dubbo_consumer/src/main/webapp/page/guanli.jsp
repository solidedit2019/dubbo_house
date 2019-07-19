<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- saved from url=(0050)http://localhost:8080/HouseRent/manage!list.action -->
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
    <TITLE>青鸟租房 - 用户管理</TITLE>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <LINK
            rel=stylesheet type=text/css href="../css/style.css">

    <META name=GENERATOR>

    <script language="JavaScript" src="../admin/js/jquery-1.8.3.js"></script>
    <script language="JavaScript" src="../admin/js/jquery.form.js"></script>

    <script language="JavaScript">

            function deleteHouse(id) {
               if(confirm("确认删除")){
                  $.post("deleteHouse",{"id":id},function (data) {
                            if(data.result>0){
                               alert("删除成功");
                               location.href="getHouse";
                            }else {
                                alert("删除失败")

                            }
                  },"json")
               }
            }


    </script>
</HEAD>
<BODY>
<DIV id=header class=wrap>
    <DIV id=logo><IMG src="../images/logo.gif"></DIV>

    <DIV class=search>
        欢迎：<span>${sessionScope.users.name}</span>
        <LABEL class="ui-green searchs">
        <a href="goFaBu" title="">发布房屋信息</a></LABEL>
        <LABEL class=ui-green><INPUT onclick='document.location="login.jsp"' value="退       出" type=button name=search></LABEL>
    </DIV>
</DIV>
<DIV class="main wrap">
    <DIV id=houseArea>
        <TABLE class=house-list>
            <TBODY>
            <c:forEach items="${pageHouse.list}" var="h">


            <TR>
                <TD class=house-thumb>
                    <SPAN><A href="getPageHouse" target="_blank">
                        <img src="http://localhost:80/${h.path}" width="100" height="75" alt=""></A></SPAN>
                </TD>
                <TD>
                    <DL>
                        <DT><A href="detail?id=${h.id}" target="_blank">${h.title}</A></DT>
                        <DD>${h.dname}${h.sname}${h.floorage}平米${h.tname}<BR>联系方式：${h.contact}</DD>
                    </DL>
                </TD>
                <TD class=house-type><LABEL class=ui-green><INPUT onclick="location.href='goUpdate?id=${h.id}'" value="修    改" type=button
                                                                  name=search></LABEL></TD>
                <TD class=house-price><LABEL class=ui-green><INPUT value="删    除" type=button name=search onclick="deleteHouse(${h.id})"></LABEL></TD>
            </TR>

            </c:forEach>
            </TBODY>
        </TABLE>
    </DIV>

    <DIV class=pager>
        <UL>
            <c:forEach begin="1" end="${pageHouse.pages}" var="v">
            <LI class=current><A id=widget_338868862
                                 href="getHouse?page=${v}"
                                 parseContent="true" showError="true" targets="houseArea"
                                 ajaxAfterValidation="false" validate="false"
                                 dojoType="struts:BindAnchor">${v}</A>
            </LI>
            </c:forEach>
        </UL>
        <SPAN class=total>${pageHouse.pageNum}/${pageHouse.pages}页</SPAN></DIV>
</DIV>
<DIV id=footer class=wrap>
    <DL>
        <DT>青鸟租房 © 2018 北大青鸟 京ICP证1000001号</DT>
        <DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD>
    </DL>
</DIV>
</BODY>
</HTML>
