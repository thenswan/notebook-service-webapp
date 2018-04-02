<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<%--suppress JSUnresolvedLibraryURL --%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Create an account</title>

    <!-- page css -->
    <link href="${contextPath}/resources/elite-admin/css/pages/login-register-lock.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${contextPath}/resources/elite-admin/css/style.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="skin-default-dark card-no-border">
<!-- ============================================================== -->
<!-- Preloader - style you can find in spinners.css -->
<!-- ============================================================== -->
<div class="preloader">
    <div class="loader">
        <div class="loader__figure"></div>
        <p class="loader__label">Elite admin</p>
    </div>
</div>
<!-- ============================================================== -->
<!-- Main wrapper - style you can find in pages.scss -->
<!-- ============================================================== -->
<section id="wrapper">
    <div class="login-register" style="background-image:url(${contextPath}/resources/elite-admin/images/background/login-register.jpg);">
        <div class="login-box card">
            <div class="card-body">
                <form:form method="POST" modelAttribute="userForm" class="form-horizontal form-material" id="loginform">
                    <h3 class="box-title m-b-20">Sign Up</h3>
                    <spring:bind path="username">
                    <div class="form-group">
                        <div class="col-xs-12">
                            <form:input class="form-control" type="text" path="username" required="" placeholder="Name"/>
                        </div>
                    </div>
                    </spring:bind>
                    <spring:bind path="password">
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <form:input class="form-control" type="password" path="password" required="" placeholder="Password"/>
                        </div>
                    </div>
                    </spring:bind>
                    <spring:bind path="confirmPassword">
                    <div class="form-group">
                        <div class="col-xs-12">
                            <form:input class="form-control" type="password" path="confirmPassword" required="" placeholder="Confirm Password"/>
                        </div>
                    </div>
                    </spring:bind>
                    <div class="form-group text-center p-b-20">
                        <div class="col-xs-12">
                            <button class="btn btn-info btn-lg btn-block btn-rounded text-uppercase waves-effect waves-light" type="submit">Sign Up</button>
                        </div>
                    </div>
                    <div class="form-group m-b-0">
                        <div class="col-sm-12 text-center">
                            Already have an account? <a href="${contextPath}/login" class="text-info m-l-5"><b>Sign In</b></a>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</section>

<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<script src="${contextPath}/resources/elite-admin/js/jquery/jquery-3.2.1.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="${contextPath}/resources/elite-admin/js/popper/popper.min.js"></script>
<script src="${contextPath}/resources/elite-admin/js/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function() {
        $(".preloader").fadeOut();
    });
    $(function() {
        $('[data-toggle="tooltip"]').tooltip()
    });
    // ==============================================================
    // Login and Recover Password
    // ==============================================================
    $('#to-recover').on("click", function() {
        $("#loginform").slideUp();
        $("#recoverform").fadeIn();
    });
</script>
</body>

</html>