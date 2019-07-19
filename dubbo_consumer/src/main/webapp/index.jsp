<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <tr>
        <td>区域编号</td>
        <td>区域名称</td>
    </tr>
    <c:forEach var="d" items="${list}">
        <tr>
            <td>${d.id}</td>
            <td>${d.name}</td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
