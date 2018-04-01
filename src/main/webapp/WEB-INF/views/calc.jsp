<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 27.02.2018
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <c:choose>
        <c:when test="${result == null}">
            <h2>Hello NoNAMER</h2>
        </c:when>
        <c:otherwise>
            <h2>Hello ${result}</h2>
        </c:otherwise>
    </c:choose>


</div>
</body>
</html>
