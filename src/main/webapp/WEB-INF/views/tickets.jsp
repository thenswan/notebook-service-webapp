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

    <title>Tickets</title>

    <!-- Footable CSS -->
    <link href="${contextPath}/resources/elite-admin/node_modules/footable/css/footable.core.css" rel="stylesheet">
    <link href="${contextPath}/resources/elite-admin/node_modules/bootstrap-select/bootstrap-select.min.css"
          rel="stylesheet"/>
    <!-- Page CSS -->
    <link href="${contextPath}/resources/elite-admin/css/pages/contact-app-page.css" rel="stylesheet">
    <link href="${contextPath}/resources/elite-admin/css/pages/footable-page.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${contextPath}/resources/elite-admin/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="skin-default-dark fixed-layout">
<form id="logoutForm" method="POST" action="${contextPath}/logout">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
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
                            class="fa fa-circle-o text-info"></i><span class="hide-menu">Statistics</span></a></li>
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
                    <h4 class="text-themecolor">Tickets</h4>
                </div>
                <div class="col-md-7 align-self-center text-right">
                    <div class="d-flex justify-content-end align-items-center">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Tickets</li>
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
                            <h4 class="card-title">Support Ticket List</h4>
                            <h6 class="card-subtitle">List of ticket opened by customers</h6>
                            <div class="table-responsive">
                                <table id="demo-foo-addrow" class="table m-t-30 table-hover no-wrap contact-list"
                                       data-page-size="10">
                                    <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Code</th>
                                        <th>Type</th>
                                        <th>Manufacturer</th>
                                        <th>Model</th>
                                        <c:choose>
                                            <c:when test="${pageContext.request.userPrincipal.name == 'admin123'}">
                                                <th>Action</th>
                                            </c:when>
                                        </c:choose>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="device" items="${listDevices}">
                                        <tr data-href="deviceInfo/${device.deviceId}" style="cursor: pointer">

                                            <td>${device.deviceId}</td>
                                            <td>${device.code}</td>
                                            <td>${device.type}</td>
                                            <td>${device.manufacturer}</td>
                                            <td>${device.model}</td>
                                            <c:choose>
                                                <c:when test="${pageContext.request.userPrincipal.name == 'admin123'}">
                                                    <td>
                                                        <a href="deleteDevice?id=${device.deviceId}" type="button"
                                                                class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn"
                                                                data-toggle="tooltip" data-original-title="Delete">
                                                            <i class="ti-close" aria-hidden="true"></i></a>
                                                    </td>
                                                </c:when>
                                            </c:choose>

                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td colspan="2">
                                            <button type="button" class="btn btn-info btn-rounded"
                                                    data-toggle="modal" data-target="#add-contact">Add New Device
                                            </button>
                                        </td>
                                        <div id="add-contact" class="modal fade in" tabindex="-1" role="dialog"
                                             aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title" id="myModalLabel">Add New
                                                            Device</h4>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-hidden="true">×
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form:form method="POST" action="/welcome" id="form1"
                                                                   modelAttribute="NewDevice"
                                                                   class="form-horizontal form-material">
                                                            <div class="form-group">
                                                                <input type="hidden" name="${_csrf.parameterName}"
                                                                       value="${_csrf.token}"/>
                                                                <div class="col-md-12 m-b-20">
                                                                    <form:input path="code" type="text"
                                                                                class="form-control"
                                                                                placeholder="Code" required="true"/>
                                                                </div>
                                                                <div class="col-md-12 m-b-20">
                                                                    <form:input path="manufacturer" type="text"
                                                                                class="form-control"
                                                                                placeholder="Manufacturer"
                                                                                required="true"/>
                                                                </div>
                                                                <div class="col-md-12 m-b-20">
                                                                    <form:input path="model" type="text"
                                                                                class="form-control"
                                                                                placeholder="Model" required="true"/>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button id="submit" form="form1" type="submit"
                                                                            class="btn btn-info waves-effect">
                                                                        Save
                                                                    </button>

                                                                    <button type="button"
                                                                            class="btn btn-default waves-effect"
                                                                            data-dismiss="modal">
                                                                        Cancel
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </form:form>
                                                    </div>

                                                </div>
                                                <!-- /.modal-content -->
                                            </div>
                                            <!-- /.modal-dialog -->
                                        </div>
                                        <td colspan="3">
                                            <div class="text-right">
                                                <ul class="pagination"></ul>
                                            </div>
                                        </td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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