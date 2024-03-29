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
        Planij� : Teams
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
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
                        <textarea class="form-control" id="description" name="description"></textarea>
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
                    <span aria-hidden="true">x</span>
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


<!-- addTeam modal -->
<div id="addTeam" class="modal fade" role="form" aria-labelledby="addTeamHeader">
    <div class="modal-dialog modal-lg">

        <div class="modal-content card">
            <div class="modal-header">
                <h5 class="modal-title" id="addTeamHeader">New Team</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">x</span>
                </button>
            </div>
            <div class="modal-body">
                Create a team, invite your friends, collaborate
                <form action="/planije2/app/addTeam" method="post">
                    <div class="form-group">
                        <label for="teamTitle" class="col-form-label">Team title:</label>
                        <input  type="text"
                    class="form-control" id="teamTitle" placeholder="Name your team"
                    name="teamTitle" required>
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-form-label">Description:</label>
                        <textarea class="form-control" name="description" type="text" value="Empty" >No description</textarea>
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


<!-- joinTeam modal -->
<div id="joinTeam" class="modal fade" role="form" aria-labelledby="joinTeamHeader">
    <div class="modal-dialog modal-lg">

        <div class="modal-content card">
            <div class="modal-header">
                <h5 class="modal-title" id="joinTeamHeader">Join Team</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Enter a team code here to join it : <c:if test="${not empty joinTeamResponse}">${joinTeamResponse}</c:if>
                <form action="/planije2/app/joinTeam" method="post">
                    <div class="input-group no-border">
                        <input type="text" value="" class="form-control" name="teamCode" placeholder="Code...">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <i class="nc-icon nc-zoom-split"></i>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        <input type="submit" class="btn btn-primary" value="Join"/>
                    </div>
                </form>
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
            <a href="/planije2/" class="simple-text logo-normal">Planij�
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
                <li class="active ">
                    <a href="/planije2/app/teams">
                        <i class="nc-icon nc-vector"></i>
                        <p>Teams</p>
                    </a>
                </li>
                <hr>
                <li>
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
    <div class="main-panel" >
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
            <div class="container-fluid">
            
                <div class="navbar-wrapper">
			        <div class="navbar-toggle">
			              <button type="button" class="navbar-toggler">
			                <span class="navbar-toggler-bar bar1"></span>
			                <span class="navbar-toggler-bar bar2"></span>
			                <span class="navbar-toggler-bar bar3"></span>
			              </button>
			            </div>
                    <!-- add team modal button -->
                    <a class="btn btn-primary btn-round btn-sm" data-toggle="modal" data-target="#addTeam">
                        <i class="nc-icon nc-simple-add"></i>


                        Team


                    </a>
                    <!-- join team modal button -->
                    <a class="btn btn-outline-warning btn-round btn-sm" data-toggle="modal" data-target="#joinTeam">
                        <i class="nc-icon nc-key-25"></i>


                        Join


                    </a>

                </div>
                <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
		            <span class="navbar-toggler-bar navbar-kebab"></span>
		            <span class="navbar-toggler-bar navbar-kebab"></span>
		            <span class="navbar-toggler-bar navbar-kebab"></span>
		          </button>
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



                <div class="col-md-12">
                    <div class="col-md-12">
                        <h5 class="">
                            <i class="nc-icon nc-chat-33"></i>
                            <small class="text-muted">Owned Teams :</small></h5>
                    </div>

                </div>
				
                <!-- Owned Cards -->
                <c:if test="${ownedTeams.isEmpty()}">
					You still haven't created any teams
				</c:if>
                
                <c:forEach items="${ownedTeams}" var="t">
                <div class="col-lg-3 col-md-6 col-sm-6" >
                    <div class="card card-stats">
                        <div class="card-body ">
                            <div class="row">
                                <div class="col-5 col-md-4">
                                    <div class="icon-big text-center icon-warning">
                                        <i class="nc-icon nc-globe text-primary"></i>
                                    </div>
                                </div>
                                <div class="col-7 col-md-8">
                                    <div>
                                        <p class="card-category">


                                            ${t.teamOwner.username}


                                        </p>
                                        <a class="card-title" 
                                        
                                        
                                        href="/planije2/app/team?teamId=${t.teamId}"


                                        >


                                            ${t.title}


                                        </a><p>
                                    </p></div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer ">
                            <hr>
                            <ul class="nav justify-content-center">
                                <li class="nav-item">
                                    <a class="nav-link disabled" href="#">
                                        <i class="nc-icon nc-paper">

                                            ${t.todoTask}

                                        </i></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link disabled" href="#">
                                        <i class="nc-icon nc-single-copy-04">

                                            ${t.doingTask}

                                        </i></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link disabled" href="#">
                                        <i class="nc-icon nc-check-2">

                                            ${t.doneTask}

                                        </i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
				</c:forEach>

            </div>
            <hr>
            <div class="row">
                <div class="col-md-12">
                    <h5 class="">
                        <i class="nc-icon nc-globe"></i>
                        <small class="text-muted">Joined Teams :</small></h5>
                </div>


                <!-- Joined Cards -->
				<c:if test="${joinedTeams.isEmpty()}">
					You still haven't joined any teams
				</c:if>      
				          
                <c:forEach items="${joinedTeams}" var="t">
                <div class="col-lg-3 col-md-6 col-sm-6" >
                    <div class="card card-stats">
                        <div class="card-body ">
                            <div class="row">
                                <div class="col-5 col-md-4">
                                    <div class="icon-big text-center icon-warning">
                                        <i class="nc-icon nc-globe text-warning"></i>
                                    </div>
                                </div>
                                <div class="col-7 col-md-8">
                                    <div>
                                        <p class="card-category">

                                            ${t.teamOwner.username}

                                        </p>
                                        <a class="card-title" style="color: orange" 
                                        
                                        
                                        
                                        href="/planije2/app/team?teamId=${t.teamId}"


                                        >


                                            ${t.title}


                                        </a><p>
                                    </p></div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer ">
                            <hr>
                            <ul class="nav justify-content-center">
                                <li class="nav-item">
                                    <a class="nav-link disabled" href="#">
                                        <i class="nc-icon nc-paper">

                                            ${t.todoTask}

                                        </i></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link disabled" href="#">
                                        <i class="nc-icon nc-single-copy-04">

                                            ${t.doingTask}

                                        </i></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link disabled" href="#">
                                        <i class="nc-icon nc-check-2">

                                            ${t.doneTask}

                                        </i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
				</c:forEach>


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
