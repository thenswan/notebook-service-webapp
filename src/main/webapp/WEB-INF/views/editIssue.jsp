<%@ taglib prefix="c" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 24.03.2018
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<link href="${contextPath}/resources/css/flex.css" rel="stylesheet">
<div class="container">
    <c:form class="form-style-4" action="/editIssue" method="post" commandName="issue">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <c:hidden path="issueId"></c:hidden>

        <label for="field1">
            <span>Issue Name</span><c:input path="name"></c:input>
        </label>
        <label for="field2">
            <span>Issue Description</span><c:input path="discription"></c:input>
        </label>
        <label for="field3">
            <span>Issue Status</span> <c:input path="fixed"></c:input>
        </label>
        <label>
            <span>&nbsp;</span><input type="submit" value="Save" />
        </label>
    </c:form>

</div>

</body>
</html>
