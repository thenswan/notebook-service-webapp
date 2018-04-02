<%@ taglib prefix="c" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Edit issue</title>

    <!-- Custom CSS -->
    <link href="${contextPath}/resources/elite-admin/css/style.min.css" rel="stylesheet">
    <!-- page css -->
    <link href="${contextPath}/resources/elite-admin/css/pages/file-upload.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="skin-default-dark fixed-layout">
<!-- ============================================================== -->
<!-- Preloader - style you can find in spinners.css -->
<!-- ============================================================== -->
<div class="preloader">
    <div class="loader">
        <div class="loader__figure"></div>
        <p class="loader__label">Notebook service</p>
    </div>
</div>
<!-- ============================================================== -->
<!-- Main wrapper - style you can find in pages.scss -->
<!-- ============================================================== -->
<div id="main-wrapper">
    <!-- ============================================================== -->
    <!-- Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <aside class="left-sidebar" style="padding-top: 0">
        <!-- Sidebar scroll-->
        <div class="scroll-sidebar">
            <!-- User Profile-->
            <div class="user-profile">
                <div class="user-pro-body">
                    <div>
                        <img src="${contextPath}/resources/elite-admin/images/users/2.jpg" alt="user-img"
                             class="img-circle">
                    </div>
                    <div class="dropdown">
                        <a href="javascript:void(0)" class="dropdown-toggle u-dropdown link hide-menu"
                           data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">${pageContext.request.userPrincipal.name} <span
                                class="caret"></span></a>
                        <div class="dropdown-menu animated flipInY">
                            <a onclick="document.forms['logoutForm'].submit()" href="#" class="dropdown-item"><i
                                    class="fa fa-power-off"></i> Logout</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Sidebar navigation-->
            <nav class="sidebar-nav">
                <ul id="sidebarnav">
                    <li class="nav-small-cap">--- MENU</li>
                    <li>
                        <a class="waves-effect waves-dark" href="/welcome"
                           aria-expanded="false"><i class="fa fa-circle-o text-success"></i><span class="hide-menu">Tickets</span></a>
                    </li>
                    <li><a class="waves-effect waves-dark" href="/charts" aria-expanded="false"><i
                            class="fa fa-circle-o text-info"></i><span class="hide-menu">Charts</span></a></li>
                    <li><a onclick="document.forms['logoutForm'].submit()" class="waves-effect waves-dark" href="#"
                           aria-expanded="false"><i
                            class="fa fa-circle-o text-danger"></i><span class="hide-menu">Log Out</span></a></li>
                </ul>
            </nav>
            <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
    </aside>
    <!-- ============================================================== -->
    <!-- End Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Page wrapper  -->
    <!-- ============================================================== -->
    <div class="page-wrapper" style="padding-top: 0">
        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->
        <div class="container-fluid">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h4 class="text-themecolor">Issues</h4>
                </div>
                <div class="col-md-7 align-self-center text-right">
                    <div class="d-flex justify-content-end align-items-center">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Issues</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Start Page Content -->
            <!-- ============================================================== -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Edit issue</h4>
                            <c:form action="/editIssue" method="post" commandName="issue" class="form-material m-t-40">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <c:hidden path="issueId"/>
                                <div class="form-group">
                                    <label for="field1">
                                    <span>Issue Name</span>
                                        <c:input type="text" class="form-control form-control-line" path="name"/>
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label for="field2">
                                    <span>Issue Description</span>
                                        <c:input type="text" class="form-control form-control-line" path="description"/>
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label for="field3">
                                    <span>Issue Status</span>
                                        <c:input type="text" class="form-control form-control-line" path="fixed"/>
                                    </label>
                                </div>
                                <button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Submit</button>
                            </c:form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- .row -->
            <!-- ============================================================== -->
            <!-- End PAge Content -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Page wrapper  -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- footer -->
    <!-- ============================================================== -->
    <footer class="footer">
        © 2018 Notebook Service by the.n.swan
    </footer>
    <!-- ============================================================== -->
    <!-- End footer -->
    <!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<script src="${contextPath}/resources/elite-admin/node_modules/jquery/jquery-3.2.1.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="${contextPath}/resources/elite-admin/node_modules/popper/popper.min.js"></script>
<script src="${contextPath}/resources/elite-admin/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="${contextPath}/resources/elite-admin/js/perfect-scrollbar.jquery.min.js"></script>
<!--Wave Effects -->
<script src="${contextPath}/resources/elite-admin/js/waves.js"></script>
<!--Menu sidebar -->
<script src="${contextPath}/resources/elite-admin/js/sidebarmenu.js"></script>
<!--stickey kit -->
<script src="${contextPath}/resources/elite-admin/node_modules/sticky-kit-master/dist/sticky-kit.min.js"></script>
<script src="${contextPath}/resources/elite-admin/node_modules/sparkline/jquery.sparkline.min.js"></script>
<!--Custom JavaScript -->
<script src="${contextPath}/resources/elite-admin/js/custom.min.js"></script>
<!-- Footable -->
<script src="${contextPath}/resources/elite-admin/node_modules/footable/js/footable.all.min.js"></script>
<script src="${contextPath}/resources/elite-admin/node_modules/bootstrap-select/bootstrap-select.min.js"
        type="text/javascript"></script>
<!--FooTable init-->
<script src="${contextPath}/resources/elite-admin/js/pages/footable-init.js"></script>

<script>
    $('tr[data-href]').on("click", function() {
        document.location = $(this).data('href');
    });
</script>

</body>
</html>