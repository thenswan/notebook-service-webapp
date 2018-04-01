<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>



<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/flex.css" rel="stylesheet">
</head>
<body>

<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a>
        </h2>


        <!--<h2><a href="/ships">Ships list</a></h2>-->

    </c:if>

</div>
<ul class="list-group">
    <li class="list-group-item list-group-item-danger">LIST OF DEVICES</li>
    <c:forEach var="ship" items="${listDevices}">
        <li class="list-group-item list-group-item-success">
            <a href="deviceInfo/${ship.deviceId}">${ship.model}</a>
            <c:choose>
                <c:when test="${pageContext.request.userPrincipal.name == 'admin123'}">
                    <a href="deleteDevice?id=${ship.deviceId}" style="color:red" data-confirm="Are you sure you want to delete it?"> Delete </a>
                </c:when>
                <c:otherwise>

                </c:otherwise>
            </c:choose>

        </li>
    </c:forEach>
</ul>
<c:choose>
    <c:when test="${pageContext.request.userPrincipal.name != 'admin123'}">
        <h2><a id="myBtn">Add new device</a></h2>
    </c:when>
    <c:otherwise>

    </c:otherwise>
</c:choose>

<div id="myModal" class="modal">

    <div class="modal-content">
        <span class="close">&times;</span>
        <div class="form-style-8">
            <form:form method="POST" action="/welcome" modelAttribute="newd">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <label>Manufacteur:</label>
                <form:input path="manufactuer" autofocus="true" placeholder="Manufacteur" required="true"></form:input>
                <label>Model:</label>
                <form:input path="model" placeholder="Model" required="true"></form:input>
                <label>Code:</label>
                <form:input path="code" placeholder="Code" required="true"></form:input>
                <input id="submit" type="submit" value="Submit" name="action1">
            </form:form>
        </div>
    </div>
</div>

<canvas id="myChart" width="400" height="150"></canvas>

<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/Chart.bundle.js"></script>
<script src="${contextPath}/resources/js/randomColor.js"></script>
<script src="${contextPath}/resources/js/Chart.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/dialog.js"></script>
<script src="${contextPath}/resources/js/jQuery.js"></script>
<script>
    var ctx = document.getElementById("myChart").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: [
            <c:choose>
            <c:when test="${pageContext.request.userPrincipal.name != 'admin123'}">
                <c:forEach var="device" items="${listDevices}">
                '${device.manufactuer} ${device.model}',
                </c:forEach>
        </c:when>
        <c:otherwise>
                <c:forEach var="device" items="${listManuf}">
                '${device.key}',
                </c:forEach>
        </c:otherwise>
        </c:choose>



            ],
            datasets: [{
                label: '# of Issues',
                data: [
                <c:choose>
                <c:when test="${pageContext.request.userPrincipal.name != 'admin123'}">
                    <c:forEach var="device" items="${listDevices}">
                    '${device.issues.size()}',
                    </c:forEach>
            </c:when>
            <c:otherwise>
                    <c:forEach var="device" items="${listManuf}">
                    '${device.value}',
                    </c:forEach>
            </c:otherwise>
            </c:choose>


                ],
                backgroundColor: [
                    <c:forEach var="device" items="${listDevices}">
                    randomColor(),
                    </c:forEach>
                    <c:forEach var="device" items="${listManuf}">
                    randomColor(),
                    </c:forEach>
                ],

                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    });


</script>
<script>
    $(document).on('click', ':not(form)[data-confirm]', function(e){
        if(!confirm($(this).data('confirm'))){
            e.stopImmediatePropagation();
            e.preventDefault();
        }
    });
</script>
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
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>