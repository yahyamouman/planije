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
        Planijé : Task
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <!-- CSS Files -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="${pageContext.request.contextPath}/assets/demo/demo.css" rel="stylesheet" />
</head>

<body class="">



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
                <li class="active">
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
    <div class="main-panel" style="height: 100vh;">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
            <div class="container-fluid">
                <div class="navbar-wrapper">

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



                <div class="col-md-12">
                    <h3 class="description">Task Menu :</h3>
                </div>
                
                

			<div class="row">
			  <div class="col-md-4">
			    <div class="card card-user">
			      <div class="image">
			        <img src="/planije2/assets/img/damir-bosnjak.jpg" alt="...">
			      </div>
			      <div class="card-body">
			        <div class="author">
			          <a href="#">
			            <img class="avatar border-gray" src="/planije2/assets/img/mike.jpg" alt="...">
			            <h5 class="title">
			
						${user.firstName} ${user.lastName}
			
			            </h5>
			          </a>
			          <p class="description">
			
			
			            @${user.username}

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
                                        Total : ${user.exp} XP
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
			
			                ${done}
			
			                <br><small>
			
			                  Done
			
			                </small></h5>
			            </div>
			            <div class="col-lg-4 col-md-6 col-6 ml-auto mr-auto">
			              <h5>
			
			                ${badge}
			
			                <br><small>
			
			                  Badges
			
			                </small></h5>
			            </div>
			            <div class="col-lg-3 mr-auto">
			              <h5>
			
			                ${team}
			
			                <br><small>
			
			                  Teams
			
			                </small></h5>
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
			
			  </div>
			  <div class="col-md-8">
			    <div class="card card-user">
			      <div class="card-header">
			        <h5 class="card-title">${task.title}</h5>
			      </div>
			      <div class="card-body">
			        <form action="/planije2/app/editTask" method=post>
			
			          <div class="row">
			            <div class="col-md-6 pr-1">
			              <div class="form-group">
			             	<input type="hidden" name="taskId" value="${task.taskId}">
			                <label>Title</label>
			                <input type="text" class="form-control" placeholder="Company" name="title" value="${task.title}">
			              </div>
			            </div>
			            <div class="col-md-6 pl-1">
			              <div class="form-group">
			                <label>Category</label>
			                <input type="text" class="form-control" placeholder="Last Name" name="category" value="${task.category}">
			              </div>
			            </div>
			          </div>
			          <div class="row">
			            <div class="col-md-12">
			              <div class="form-group">
			                <label>Description</label>
			                
<!--  -->			        <textarea type="text" class="form-control" rows=5 name="description">${task.description}</textarea>

			              </div>
			            </div>
			          </div>
			          <div class="row">
			            <div class="col-md-12">
			              <div class="form-group">
			                <label>Team</label>
			                
			                <input type="text" class="form-control" placeholder="personal task" name="title" value="${task.sourceTeam.title}" disabled>
			
			              </div>
			            </div>
			          </div>
			          <div class="row">
			            <div class="col-md-6 pr-1">
			              <div class="form-group">
			                <label>Start date</label>
			                <input type="date" class="form-control" placeholder="Company" name="startDate" value="${task.startDate}">
			              </div>
			            </div>
			            <div class="col-md-6 pl-1">
			              <div class="form-group">
			                <label>End date</label>
			                <input type="date" class="form-control" placeholder="Last Name" name="endDate" value="${task.endDate}">
			              </div>
			            </div>
			          </div>
			          <div class="row">
			
			            <div class="col-md-12">
			              <hr>
			
				            <ul class="nav" style="justify-content: space-around;">
				               <li class="nav-item">
				                  <a class="btn btn-round btn-icon btn-<c:if test="${task.state!='TODO'}">outline-</c:if>danger" href="/planije2/app/taskState?team=false&state=TODO&taskId=${task.taskId}">
				                  <i class="nc-icon nc-paper">
				                  </i></a>
				               </li>
				               <li class="nav-item">
				                  <a class="btn btn-round btn-icon btn-<c:if test="${task.state!='DOING'}">outline-</c:if>warning" href="/planije2/app/taskState?team=false&state=DOING&taskId=${task.taskId}">
				                  <i class="nc-icon nc-single-copy-04">
				                  </i></a>
				               </li>
				               <li class="nav-item">
				                  <a class="btn btn-round btn-icon btn-<c:if test="${task.state!='DONE'}">outline-</c:if>primary" href="/planije2/app/taskState?team=false&state=DONE&taskId=${task.taskId}">
				                  <i class="nc-icon nc-check-2">
				                  </i></a>
				               </li>
				            </ul>
			            </div>
			          </div>
			
			          <div class="row">
			            <div class="col-md-12">
			              <hr>
			            </div>
			            <div class="col-md-4">
			              <div class="update ml-auto mr-auto " style="text-align: center;">
			                <button type="submit" class="btn btn-primary btn-round">Save changes</button>
			              </div>
			            </div>
			            
			            <c:if test="${task.sourceTeam!=null}">
			            <div class="col-md-4">
			            	<div class="update ml-auto mr-auto " style="text-align: center;">
			                	<a class="btn btn-info btn-round" href="/planije2/app/team?teamId=${task.sourceTeam.teamId}">View in team</a>
			              	</div>
			            </div>
			            </c:if>
			            
			            
			            <div class="col-md-4">
			            	<div class="update ml-auto mr-auto " style="text-align: center;">
			                	<a class="btn btn-danger btn-round" href="/planije2/app/deleteTask?taskId=${task.taskId}&team=false">Delete task</a>
			              	</div>
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
