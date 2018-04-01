<%@ page import="com.notebookservice.model.Issue" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<intercept-url pattern="/deviceInfo.jsp" access="hasRole('ANONYMOUS')" />
<head>
    <title>Title</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/flex.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <sec:csrfMetaTags/>
</head>
<body>

<div class="container">
    <div class="row-flex">
        <div class="col-flex">
            <div class=""><label><i class="fa fa-user"></i>Manufacturer :</label>  <span>${device.manufacturer}</span></div>
            <div class=""><label><i class="fa fa-user"></i>Model :</label>  <span> ${device.model} </span></div>
            <div class=""><label><i class="fa fa-calendar"></i>Type :</label>  <span>${device.type}</span></div>
            <div class=""><label><i class="fa fa-male"></i>Issues count :</label>  <span>${device.issueHashSet.size()}</span></div>

        </div>

    </div>
    <h2><a id="myBtn">Add new issue</a></h2>
    <div id="myModal" class="modal">

        <div class="modal-content">
            <span class="close">&times;</span>
            <div class="form-style-8">
                <form:form method="POST" action="/deviceInfo?did=${device.deviceId}" modelAttribute="issue">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                    <label>Name:</label>
                    <spring:bind path="name">
                    <form:input path="name" autofocus="true" placeholder="Name" required="true"></form:input>
                        <form:errors path="name"></form:errors>
                    </spring:bind>


                    <label>Description:</label>
                    <spring:bind path="discription">
                    <form:input path="description" placeholder="Description" required="true"></form:input>
                        <form:errors path="description"></form:errors>
                    </spring:bind>


                    <input type="submit" value="Add">
                </form:form>
            </div>
        </div>
    </div>

        <div class="form-style-8">
            <c:forEach var="issue" items="${device.issueHashSet}">
                <h3>Issue ${issue.issueId}</h3>
            <div class="row-flex">
                <label>Name</label>
                <input type="text" id="name" value="${issue.name}" contenteditable="false" disabled="disabled"/>
            </div>

            <div class="row-flex">
                <label>Description</label>
                <input type="text" id="discription" value="${issue.description}" disabled="disabled"/>
            </div>

            <div class="row-flex">
                <label>Fixed</label>
                        <input type="text" id="fixed" value="${issue.fixed}" disabled="disabled" />
            </div>
                <c:choose>
                <c:when test="${pageContext.request.userPrincipal.name == 'admin123'}">
                    <a href="/editIssue/${issue.issueId}" ><i class="fa fa-upload"></i>Edit</a>
                </c:when>
                <c:otherwise>

                </c:otherwise>
            </c:choose>


                <hr class="style17">
            </c:forEach>
            <!--<input type="submit" name="action1" value="Save">-->
        </div>



</div>




</body>
<script>
    // Get the modal
    var modal = document.getElementById('myModal');

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks on the button, open the modal
    btn.onclick = function() {
        modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</html>
