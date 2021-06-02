<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/planije.png">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/planije.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>
        Planijé : Profile
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <!-- CSS Files -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="${pageContext.request.contextPath}/assets/demo/demo.css" rel="stylesheet" />
</head>

<body class="">


<!-- add task modal button -->
<div id="addTask" class="modal fade" role="form" aria-labelledby="addTaskHeader">
    <div class="modal-dialog modal-lg">

        <div class="modal-content card">
            <div class="modal-header">
                <h5 class="modal-title" id="addTaskHeader">New task</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">x</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/planije2/app/addTask" method="post">
                    <div class="form-group">
                        <label for="title" class="col-form-label">Title:</label>
                        <input type="text" class="form-control" id="title" name="title">
                    </div>
                    <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="startDate" class="col-form-label">From: </label>
                        <input type="date" id="startDate" name="startDate" />
                    </div>
                    <div class="form-group col-md-6">
                        <label for="endDate" class="col-form-label">To: </label>
                        <input type="date" id="endDate" name="endDate" value=""/>
                    </div>
                    </div>
                        <input type="hidden" class="form-control" id="teamId" name="teamId" value="<c:if test="${team==null}">-1</c:if><c:if test="${team!=null}">${team.teamId}</c:if>">
                        </input>
                    <div class="form-group">
                        <label for="category" class="col-form-label">Category:</label>
                        <input type="text" class="form-control" id="category" name="category">
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-form-label" name="description">Description:</label>
                        <textarea class="form-control" id="description"></textarea>
                    </div>
                    <div class="form-group">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        <input type="submit" class="btn btn-primary" value="Create"/>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>



<!-- logout button -->
<div id="logout" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content card">
            <div class="modal-header">
                <h5 class="modal-title">Logout</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to logout.</p>
            </div>
            <div class="modal-footer">
                <a href="/planije2/app/logout" type="button" class="btn btn-danger">Confirm</a>
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>



<div class="wrapper ">
    <div class="sidebar" data-color="white" data-active-color="danger">
        <div class="logo">
            <a href="/planije2/index.html" class="simple-text logo-mini">
                <div class="logo-image-small">
                    <img src="${pageContext.request.contextPath}/assets/img/planije.png">
                </div>
            </a>
            <a href="/planije2/" class="simple-text logo-normal">Planijé
            </a>
        </div>
        <div class="sidebar-wrapper">
            <ul class="nav">
                <li>
                    <a href="/planije2/app/home">
                        <i class="nc-icon nc-layout-11"></i>
                        <p>Home</p>
                    </a>
                </li>
                <hr>
                <li>
                    <a href="/planije2/app/todo">
                        <i class="nc-icon nc-paper"></i>
                        <p>Tasks : To do</p>
                    </a>
                </li>
                <li>
                    <a href="/planije2/app/doing">
                        <i class="nc-icon nc-single-copy-04"></i>
                        <p>Tasks : Doing</p>
                    </a>
                </li>
                <li>
                    <a href="/planije2/app/done">
                        <i class="nc-icon nc-check-2"></i>
                        <p>Tasks : Done</p>
                    </a>
                </li>
                <hr>
                <li>
                    <a href="/planije2/app/teams">
                        <i class="nc-icon nc-vector"></i>
                        <p>Teams</p>
                    </a>
                </li>
                <hr>
                <li class="active">
                    <a href="/planije2/app/profile">
                        <i class="nc-icon nc-badge"></i>
                        <p>Profile</p>
                    </a>
                </li>
                <li>
                    <a href="/planije2/app/achievements">
                        <i class="nc-icon nc-trophy"></i>
                        <p>Achievements</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="main-panel">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
            <div class="container-fluid">
                <div class="navbar-wrapper">

                    <!-- add task modal button -->
                    <a class="btn btn-warning btn-round btn-sm" data-toggle="modal" data-target="#addTask">
                        <i class="nc-icon nc-simple-add"></i> task
                    </a>

                </div>
                <div class="collapse navbar-collapse justify-content-end" id="navigation">


                    <!-- Search form -->
                    <form>
                        <div class="input-group no-border">
                            <input type="text" value="" class="form-control" placeholder="Search...">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <i class="nc-icon nc-zoom-split"></i>
                                </div>
                            </div>
                        </div>
                    </form>



                    <ul class="navbar-nav">
                        <li class="nav-item btn-rotate">
                            <a href="/planije2/app/profile" class="btn btn-outline-primary btn-round btn-sm">
                                <i class="nc-icon nc-circle-10"></i>
                            </a>
                        </li>
                        <li class="nav-item btn-rotate">
                            <a class="btn btn-outline-danger btn-round btn-sm" data-toggle="modal" data-target="#logout">
                                <i class="nc-icon nc-user-run"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- End Navbar -->
        <div class="content">
            <div class="row">
                <div class="col-md-4">
                    <div class="card card-user">
                        <div class="image">
                            <img src="${pageContext.request.contextPath}/assets/img/damir-bosnjak.jpg" alt="...">
                        </div>
                        <div class="card-body">
                            <div class="author">
                                <a href="#">
                                    <img class="avatar border-gray" src="${pageContext.request.contextPath}/assets/img/mike.jpg" alt="...">
                                    <h5 class="title">

                                        ${User.firstName} ${User.lastName}

                                    </h5>
                                </a>
                                <p class="description">


                                    @${User.username}

                                    <div>
                                        3.0
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>

                                    </div>

                                </p>
                            </div>
                            <hr>
							<div class="row">
                                <div class="col-md-6">
                                    <h6 class="badge badge-warning content-center">
                                        Level : ${level+1}
                                    </h6>
                                </div>
                                <div class="col-md-6 text-right">
                                    <h6 class="badge badge-info badge-primary">
                                        ${exp} / 100 XP
                                    </h6>
                                </div>
                                <div class="col-md-12">
                                        <div class="progress" >
                                            <div class="progress-bar bg-success" role="progressbar" style="width: ${exp}%" aria-valuenow="${exp}" aria-valuemin="0" aria-valuemax="100">${exp}%</div>
                                        </div>
                                </div>
                                <div class="col-md-12 text-center">
                                    <h6 class="badge badge-danger">
                                        Total : ${User.exp} XP
                                    </h6>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <hr>
                            <div class="button-container">
                                <div class="row">
                                    <div class="col-lg-3 col-md-6 col-6 ml-auto">
                                        <h5>

                                            12

                                            <br><small>

                                            Done

                                        </small></h5>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-6 ml-auto mr-auto">
                                        <h5>

                                            5

                                            <br><small>

                                            Badges

                                        </small></h5>
                                    </div>
                                    <div class="col-lg-3 mr-auto">
                                        <h5>

                                            12

                                            <br><small>

                                            Teams

                                        </small></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Recent achievements</h4>
                        </div>
                        <div class="card-body">
                            <ul class="list-unstyled team-members">



                                <li>
                                    <div class="row">
                                        <div class="col-md-2 col-2">
                                            <div class="avatar">


                                                <img src="${pageContext.request.contextPath}/assets/img/planije.png" alt="Circle Image" class="img-circle img-no-padding img-responsive">


                                            </div>
                                        </div>
                                        <div class="col-md-7 col-7">


                                            Achievement 1


                                            <br />
                                            <span class="text-muted"><small>


                                                date


                                            </small></span>
                                        </div>
                                    </div>
                                </li>
                                
                                
                                                                <li>
                                    <div class="row">
                                        <div class="col-md-2 col-2">
                                            <div class="avatar">


                                                <img src="${pageContext.request.contextPath}/assets/img/planije.png" alt="Circle Image" class="img-circle img-no-padding img-responsive">


                                            </div>
                                        </div>
                                        <div class="col-md-7 col-7">


                                            Achievement 1


                                            <br />
                                            <span class="text-muted"><small>


                                                date


                                            </small></span>
                                        </div>

                                    </div>
                                </li>
                                
                                
                                                                <li>
                                    <div class="row">
                                        <div class="col-md-2 col-2">
                                            <div class="avatar">


                                                <img src="${pageContext.request.contextPath}/assets/img/planije.png" alt="Circle Image" class="img-circle img-no-padding img-responsive">


                                            </div>
                                        </div>
                                        <div class="col-md-7 col-7">


                                            Achievement 1


                                            <br />
                                            <span class="text-muted"><small>


                                                date


                                            </small></span>
                                        </div>
                                    </div>
                                </li>



                              
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="card card-user">
                        <div class="card-header">
                            <h5 class="card-title">Edit Profile</h5>
                        </div>
                        <div class="card-body">
                            <form action="/planije2/app/editProfile" method=post>
                                <div class="row">
                                    <div class="col-md-4 pr-1">
                                        <div class="form-group">
                                            <label>Role (disabled)</label>
                                            <input type="text" class="form-control" disabled="" name="roles" placeholder="Role"


                                                   value="User"

                                            required>
                                        </div>
                                    </div>
                                    <div class="col-md-8 px-1">
                                        <div class="form-group">
                                            <label>Username</label>
                                            <input type="text" class="form-control" name="username" placeholder="Username"


                                                   value="${User.username}"


                                            required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Email address</label>
                                            <input type="email" class="form-control" name="email" placeholder="Email"


                                                   value="${User.email}"


                                            required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label>First Name</label>
                                            <input type="text" class="form-control" placeholder="first Name"  name="firstName"


                                                   value="${User.firstName}"


                                            required>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pl-1">
                                        <div class="form-group">
                                            <label>Last Name</label>
                                            <input type="text" class="form-control" placeholder="Last Name" name="lastName"


                                                   value="${User.lastName}"


                                            required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Phone</label>
                                            <input type="text" class="form-control" placeholder="Phone number" name="phone"


                                                   value="${User.phone}">


                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 pr-1">
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" class="form-control" placeholder="*******" name="password"


                                            value="${User.password}"


                                            required>
                                        </div>
                                    </div>
                                    <div class="col-md-8 px-1">
                                        <div class="form-group">
                                            <label>Confirm password ${error}</label>
                                            <input type="password" class="form-control" placeholder="" name="confirmPassword"


                                            value=""


                                            required>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="update ml-auto mr-auto">
                                        <button type="submit" class="btn btn-primary btn-round">Update Profile</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--   Core JS Files   -->
<script src="${pageContext.request.contextPath}/assets/js/core/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Chart JS -->
<script src="${pageContext.request.contextPath}/assets/js/plugins/chartjs.min.js"></script>
<!--  Notifications Plugin    -->
<script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
<script src="${pageContext.request.contextPath}/assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</body>

</html>
