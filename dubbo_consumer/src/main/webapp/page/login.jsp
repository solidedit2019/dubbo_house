<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- saved from url=(0032)http://localhost:8080/HouseRent/ -->
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD><TITLE>青鸟租房 - 用户登录</TITLE>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <LINK
            rel=stylesheet type=text/css href="../css/style.css">
    <META name=GENERATOR content="MSHTML 8.00.7601.17514">

    <script src="../admin/js/jquery-1.8.3.js" language="JavaScript"></script>

    <script language="JavaScript">
        var objTime;
        $(function () {
           $("#but1").click(function () {
               $("#but1")[0].disabled=true;
                   $.post("getcode",{"smsMob":$("#smsMob").val()},function(data){
                       if(data.result>0){
                           objTime=setInterval("timecode()",1000)
                       }else {
                           alert("错误");
                           clearInterval(objTime);
                       }

                   },"json");


           })
        });
        var time=120;
        function timecode() {
      if(time>0){
          $("#but1").val(time--+"秒");
      }else {
           clearInterval(objTime);
          $("#but1")[0].disabled=false;
          $("#but1").val("获取验证码");
          time=120;
      }

        }
    </script>
</HEAD>
<BODY>
<DIV id=header class=wrap>
    <DIV id=logo><IMG src="../images/logo.gif"></DIV>
</DIV>
<DIV id=regLogin class=wrap>
    <DIV class=dialog>
        <DIV class=box>
            <H4>用户登录</H4>
            <FORM id=user method=post action=loginAction>
                <DIV class=infos>
                    <TABLE class=field>
                        <TBODY>
                        <TR>
                            <TD colSpan=2></TD>
                        </TR>
                        <TR>
                            <TD class=field>用 户 名：</TD>
                            <TD><!-- <input type="text" class="text" name="name" /> --><INPUT
                                    id=user_name class=text type=text name=name><span>${info}</span></TD>
                        </TR>
                        <TR>
                            <TD class=field>密　　码：</TD>
                            <TD><!-- <input type="password" class="text" name="password" /> --><INPUT
                                    id=user_password class=text type=password name=password></TD>
                        </TR>
                        <%--<tr>--%>
                            <%--<td class="field">手 机 号 码：</td>--%>
                            <%--<td><input type="text" class="text" name="smsMob"  id="smsMob"/>--%>
                                <%--<input type="button"  id="but1" value="获取验证码"/>--%>
                            <%--</td>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<td class="field">验 证 码：</td>--%>
                            <%--<td><input type="text" class="text verycode"  name="veryCode"/>--%>
                               <%--</td>--%>

                        <%--</tr>--%>
                        </TBODY>
                    </TABLE>
                    <DIV class=buttons>
                        <INPUT value=登陆 type=submit>
                        <INPUT onclick='document.location="regs.jsp"' value=注册 type=button>
                    </DIV>
                </DIV>
            </FORM>
        </DIV>
    </DIV>
</DIV>
<DIV id=footer class=wrap>
    <DL>
        <DT>青鸟租房 © 2018 北大青鸟 京ICP证1000001号</DT>
        <DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD>
    </DL>
</DIV>
</BODY>
</HTML>
