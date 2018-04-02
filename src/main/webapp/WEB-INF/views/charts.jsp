<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Statistics</title>

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
<%--<div class="preloader">--%>
<%--<div class="loader">--%>
<%--<div class="loader__figure"></div>--%>
<%--<p class="loader__label">Notebook service</p>--%>
<%--</div>--%>
<%--</div>--%>
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
                    <h4 class="text-themecolor">Statistics</h4>
                </div>
                <div class="col-md-7 align-self-center text-right">
                    <div class="d-flex justify-content-end align-items-center">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Statistics</li>
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

                <!-- column -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Monthly Report</h4>
                            <div id="bar-chart" style="width:100%; height:400px;"></div>
                        </div>
                    </div>
                </div>
                <!-- column -->

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
        <c:forEach var="device" items="${listDevices}">
        </c:forEach>
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
<!-- ============================================================== -->
<!-- This page plugins -->
<!-- ============================================================== -->
<!-- Chart JS -->
<script src="${contextPath}/resources/elite-admin/node_modules/echarts/echarts-all.js"></script>
<script src="${contextPath}/resources/elite-admin/node_modules/echarts/echarts-init.js"></script>

<script>
    // ==============================================================
    // Bar chart option
    // ==============================================================
    var myChart = echarts.init(document.getElementById('bar-chart'));

    // specify chart configuration item and data
    option = {
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['# of Issues'],
            textStyle : {
                color: "#ced4da"
            }
        },
        toolbox: {
            show: true,
            feature: {
                magicType: {show: true, type: ['line', 'bar']},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        color: ["#55ce63", "#009efb"],
        calculable: true,
        xAxis: [
            {
                type: 'category',
                nameTextStyle : {
                    color: "#ced4da"
                },
                data: [
                    <c:choose>
                    <c:when test="${pageContext.request.userPrincipal.name != 'admin123'}">
                    <c:forEach var="device" items="${listDevices}">
                    '${device.manufacturer} ${device.model}',
                    </c:forEach>
                    </c:when>
                    <c:otherwise>
                    <c:forEach var="device" items="${listManufacturer}">
                    '${device.key}',
                    </c:forEach>
                    </c:otherwise>
                    </c:choose>
                ]
            }
        ],
        yAxis: [
            {
                type: 'value',
                nameTextStyle : {
                    color: "#ced4da"
                }
            }
        ],
        series: [
            {
                name: '# of Issues',
                type: 'bar',
                data: [
                    <c:choose>
                    <c:when test="${pageContext.request.userPrincipal.name != 'admin123'}">
                    <c:forEach var="device" items="${listDevices}">
                    '${device.issueHashSet.size()}',
                    </c:forEach>
                    </c:when>
                    <c:otherwise>
                    <c:forEach var="device" items="${listManufacturer}">
                    '${device.value}',
                    </c:forEach>
                    </c:otherwise>
                    </c:choose>
                ],
                markPoint: {
                    data: [
                        {type: 'max', name: 'Max'},
                        {type: 'min', name: 'Min'}
                    ]
                },
                markLine: {
                    data: [
                        {type: 'average', name: 'Average'}
                    ]
                }
            }
        ]
    };


    // use configuration item and data specified to show chart
    myChart.setOption(option, true), $(function () {
        function resize() {
            setTimeout(function () {
                myChart.resize()
            }, 100)
        }

        $(window).on("resize", resize), $(".sidebartoggler").on("click", resize)
    });
</script>

</body>
</html>