<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/planije.png">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/planije.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>
        Planijé : ${team.title}
    </title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no" name="viewport">
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <!-- CSS Files -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet">
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="${pageContext.request.contextPath}/assets/demo/demo.css" rel="stylesheet">
<style type="text/css">/* Chart.js */
@-webkit-keyframes chartjs-render-animation{from{opacity:0.99}to{opacity:1}}@keyframes chartjs-render-animation{from{opacity:0.99}to{opacity:1}}.chartjs-render-monitor{-webkit-animation:chartjs-render-animation 0.001s;animation:chartjs-render-animation 0.001s;}</style><script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/43/8/common.js"></script><script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/43/8/util.js"></script>
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
                        <input type="text" class="form-control" id="title" name="title" required>
                    </div>
                    <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="startDate" class="col-form-label">From: </label>
                        <input type="date" id="startDate" name="startDate" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="endDate" class="col-form-label">To: </label>
                        <input type="date" id="endDate" name="endDate" value="" required>
                    </div>
                    </div>
                        <input type="hidden" class="form-control" id="teamId" name="teamId" value="<c:if test="${team==null}">-1</c:if><c:if test="${team!=null}">${team.teamId}</c:if>">
                    <div class="form-group">
                        <label for="category" class="col-form-label">Category:</label>
                        <input type="text" class="form-control" id="category" name="category" required>
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-form-label" >Description:</label>
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

<!-- editTeam modal -->
<div id="editTeam" class="modal fade" role="form" aria-labelledby="editTeamHeader">
    <div class="modal-dialog modal-lg">

        <div class="modal-content card">
            <div class="modal-header">
                <h5 class="modal-title" id="editTeamHeader">Update Team</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">x</span>
                </button>
            </div>
            <div class="modal-body">
                Update your team's informations
                <form action="/planije2/app/editTeam" method="post">
                    <div class="form-group">
                        <label for="teamTitle" class="col-form-label">Team title:</label>
                        <input  type="text"
                    class="form-control" id="teamTitle" placeholder="Name your team"
                    name="teamTitle" value="${team.title}" required>
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-form-label">Description:</label>
                        <textarea class="form-control" name="description" type="text" >${team.description}</textarea>
                    </div>
                    <input type="hidden" name="teamId" value="${team.teamId}">
                    <div class="form-group">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                        <input type="submit" class="btn btn-primary" value="Save changes"/>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>



<!-- TeamCode modal button -->
<div id="teamCode" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content card">
            <div class="modal-header">
                <h5 class="modal-title">Join Code</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">x—</span>
                </button>
            </div>
            <div class="modal-body">
                <p>The code to join this team is :</p>
                <br>
                <h3>${team.code}</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>



<!-- teamMembers modal button -->

<div id="teamMembers" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog">
   <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
      <div class="modal-content card">
         <div class="modal-header">
            <h5 class="modal-title">Team members</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">x—</span>
            </button>
         </div>
         <div class="modal-body">
            <div class="table-responsive">
               <table class="table">
                  <thead class=" text-primary">
                     <tr>
                        <th>Username</th>
                        <th>Full Name</th>
                        <th class="text-right"></th>
                        <th class="text-right"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>
                           <div class="row">
                              <div class="col-md-2 col-2">
                                 <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/assets/img/faces/ayo-ogunseinde-2.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
                                 </div>
                              </div>
                              <div class="col-md-7 col-7">
                                 ${team.teamOwner.username}
                                 <br>
                                 <span class="text-muted">
                                 <small>
                                 Team Owner
                                 </small>
                                 </span>
                              </div>
                           </div>
                        </td>
                        <td>
                           ${team.teamOwner.firstName} ${team.teamOwner.lastName}
                        </td>
                        <td class="text-right">
                           <a class="btn btn-outline-primary btn-round btn-icon btn-outline">
                           <i class="nc-icon nc-single-02"></i>
                           </a>
                        </td>
                     </tr>
                     <c:forEach items="${team.members}" var="member">
	                     <tr>
	                        <td>
	                           <div class="row">
	                              <div class="col-md-2 col-2">
	                                 <div class="avatar">
	                                    <img src="${pageContext.request.contextPath}/assets/img/faces/ayo-ogunseinde-2.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
	                                 </div>
	                              </div>
	                              <div class="col-md-7 col-7">
	                                 ${member.username}
	                                 <br>
	                                 <span class="text-muted">
	                                 <small>
	                                 Member
	                                 </small>
	                                 </span>
	                              </div>
	                           </div>
	                        </td>
	                        <td>
	                           ${member.firstName} ${member.lastName}
	                        </td>
	                        <c:if test="${member.userId != sessionScope.userDetails.userId}">
	                        <td class="text-right">
	                           <a class="btn btn-outline-primary btn-round btn-icon btn-outline" href="/planije2/app/publicProfile?&userId=${member.userId}">
	                           <i class="nc-icon nc-single-02"></i>
	                           </a>
	                        </td>
	                        </c:if>
	                        <c:if test="${member.userId == sessionScope.userDetails.userId}">
	                        <td class="text-right">
	                           <a class="btn btn-outline-primary btn-round btn-icon btn-outline" href="/planije2/app/profile?&userId=${member.userId}">
	                           <i class="nc-icon nc-single-02"></i>
	                           </a>
	                        </td>
	                        </c:if>
	                        <c:if test="${sessionScope.userDetails.userId == team.teamOwner.userId}">
	                        <td class="text-right">
	                           <a class="btn btn-outline-danger btn-icon" href="/planije2/app/kickUser?method=kick&teamId=${team.teamId}&userId=${member.userId}">
	                           <i class="nc-icon nc-simple-delete"></i>
	                           </a>
	                        </td>
	                        </c:if>
	                     </tr>
                     </c:forEach>
                  </tbody>
               </table>
            </div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
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



<!-- leave team modal button -->
<div id="leaveTeam" class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
        <div class="modal-content card">
            <div class="modal-header">
                <h5 class="modal-title">Logout</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">x—</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to leave the team ?</p>
            </div>
            <div class="modal-footer">
                <a 
                
                
                href="/planije2/app/kickUser?method=leave&teamId=${team.teamId}"
                
                
                 type="button" class="btn btn-danger">Leave</a>
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
                <li class="active">
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
                <div class="col-md-12">
                    <div class="card card-user">
                        <div class="image">
                            <img src="${pageContext.request.contextPath}/assets/img/damir-bosnjak.jpg" alt="...">
                        </div>
                        <div class="card-body">
                            <div class="author" style="margin-top: 10px;">
                                <h5 class="title">

                                    ${team.title}


									<c:if test="${sessionScope.userDetails.userId == team.teamOwner.userId}">
																		
                                    <a class="badge badge-secondary" data-toggle="modal" data-target="#editTeam">
										<i class="nc-icon nc-settings-gear-65"></i> EDIT
									</a>
									
									</c:if>
								</h5>
                                <p class="description">


                                    @${team.teamOwner.username}


                                </p>
                            </div>
                            
                            <p class="description text-center">
                            
                            
                            	${team.description}
                            
                            
                            </p>
	                        <hr>
	                        <div style="text-align-last: center;">
	                        
	                        
							    <button class="btn btn-warning" data-toggle="modal" data-target="#teamCode">
							   		Get Code
							   		<i class="nc-icon nc-lock-circle-open"></i>
							   	</button>
							   	
							   	
							    <button class="btn btn-primary" data-toggle="modal" data-target="#teamMembers">
							    	<i class="nc-icon nc-circle-10"></i>
							    	<br>
							    	Members 
								    <span class="badge badge-light">
								    
								    
<!-- Number of members -->
								       ${team.members.size()+1}
								    
								    
								    </span>
								</button>
								
								
							    <button class="btn btn-danger" data-toggle="modal" data-target="#leaveTeam">
							     Leave Team
							     <i class="nc-icon nc-user-run"></i>
							     </button>
							     
							     
							</div>
						</div>

                        <div class="card-footer">
                            <hr>
                            <div class="button-container">
                                <div class="row">
                                    <div class="col-lg-3 col-md-6 col-6 ml-auto">
                                        <h5>

<!-- number of Todo tasks -->
                                            ${todo.size()}

                                            <br>
                                            <small>

                                            To do

                                        	</small>
                                        </h5>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-6 ml-auto mr-auto">
                                        <h5>

<!-- number of doing tasks -->
                                            ${doing.size()}

                                            <br><small>

                                            Doing

                                        </small></h5>
                                    </div>
                                    <div class="col-lg-3 mr-auto">
                                        <h5>

<!-- number of done tasks -->
                                            ${done.size()}

                                            <br><small>

                                            Done

                                        </small></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header text-white bg-danger text-center">
                            <h5 class="card-title">To do</h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                            
<!-- Task Cards -->
                <c:forEach items="${todo}" var="task">
				<div class="col-lg-3 col-md-6 col-sm-6">
				   <div class="card card-stats border-danger">
				      <div class="card-header">
				         <div class="row">
				            <div class="col-md-5">
				               <span class="badge badge-secondary">
				               <i class=" nc-icon nc-time-alarm "></i> 
				               <br>
							               <c:if test="${task.left < 0}"> Expired </c:if>
							               <c:if test="${task.left >= 0}"> ${task.left} days left </c:if>
				               </span>
				            </div>
				            <div class="col-md-5">
				               <p class="card-category">
				                  ${task.category}
				               </p>
				            </div>
				       		<div class="col-md-2">
				               <a class="badge badge-danger" href="/planije2/app/deleteTask?team=true&teamId=${task.sourceTeam.teamId}&taskId=${task.taskId}">
				                  x
				               </a>
				            </div>
				         </div>
				         <div class="card-body ">
				            <div class="row">
				               <div class="align-self-center justify-content-center col-5 col-md-4">
				                  <div class="icon-big text-center icon-warning ">
				                     <i class="align-self-center nc-icon <c:if test="${task.state=='TODO'}">nc-paper text-danger</c:if><c:if test="${task.state=='DOING'}">nc-single-copy-04 text-warning</c:if><c:if test="${task.state=='DONE'}">nc-check-2 text-primary</c:if>"></i>
				                  </div>
				               </div>
				               <div class="col-7 col-md-8">
				                  <div>
 										<a class="text-center  card-title text-info" href="/planije2/app/task?taskId=${task.taskId}">${task.title}</a>
				                  </div>
				               </div>
				            </div>
				         </div>
				         <div class="card-footer ">
				            <hr>
				            <ul class="nav" style="justify-content: space-around;">
				               <li class="nav-item">
				                  <a class="btn btn-round btn-icon btn-<c:if test="${task.state!='TODO'}">outline-</c:if>danger" href="/planije2/app/taskState?team=true&state=TODO&taskId=${task.taskId}&teamId=${team.teamId}">
				                  <i class="nc-icon nc-paper">
				                  </i></a>
				               </li>
				               <li class="nav-item">
				                  <a class="btn btn-round btn-icon btn-<c:if test="${task.state!='DOING'}">outline-</c:if>warning" href="/planije2/app/taskState?team=true&state=DOING&taskId=${task.taskId}&teamId=${team.teamId}">
				                  <i class="nc-icon nc-single-copy-04">
				                  </i></a>
				               </li>
				               <li class="nav-item">
				                  <a class="btn btn-round btn-icon btn-<c:if test="${task.state!='DONE'}">outline-</c:if>primary" href="/planije2/app/taskState?team=true&state=DONE&taskId=${task.taskId}&teamId=${team.teamId}">
				                  <i class="nc-icon nc-check-2">
				                  </i></a>
				               </li>
				            </ul>
				         </div>
				      </div>
				   </div>
				</div>
				</c:forEach>

                    </div>        
                            
                        </div>
                    </div>
                </div><div class="col-md-12">
                <div class="card">
                    <div class="card-header text-white bg-warning text-center">
                        <h5 class="card-title">Doing</h5>
                    </div>
                    <div class="card-body">
                    <div class="row">
                    
                    
<!-- Task Cards -->
                <c:forEach items="${doing}" var="task">
				<div class="col-lg-3 col-md-6 col-sm-6">
				   <div class="card card-stats border-danger">
				      <div class="card-header">
				         <div class="row">
				            <div class="col-md-5">
				               <span class="badge badge-secondary">
				               <i class=" nc-icon nc-time-alarm "></i> 
				               <br>
							               <c:if test="${task.left < 0}"> Expired </c:if>
							               <c:if test="${task.left >= 0}"> ${task.left} days left </c:if>
				               </span>
				            </div>
				            <div class="col-md-5">
				               <p class="card-category">
				                  ${task.category}
				               </p>
				            </div>
				       		<div class="col-md-2">
				               <a class="badge badge-danger" href="/planije2/app/deleteTask?team=true&teamId=${task.sourceTeam.teamId}&taskId=${task.taskId}">
				                  x
				               </a>
				            </div>
				         </div>
				         <div class="card-body ">
				            <div class="row">
				               <div class="align-self-center justify-content-center col-5 col-md-4">
				                  <div class="icon-big text-center icon-warning ">
				                     <i class="align-self-center nc-icon <c:if test="${task.state=='TODO'}">nc-paper text-danger</c:if><c:if test="${task.state=='DOING'}">nc-single-copy-04 text-warning</c:if><c:if test="${task.state=='DONE'}">nc-check-2 text-primary</c:if>"></i>
				                  </div>
				               </div>
				               <div class="col-7 col-md-8">
				                  <div>
				                      <a class="text-center  card-title text-info" href="/planije2/app/task?taskId=${task.taskId}">${task.title}</a>
				                  </div>
				               </div>
				            </div>
				         </div>
				         <div class="card-footer ">
				            <hr>
				            <ul class="nav" style="justify-content: space-around;">
				               <li class="nav-item">
				                  <a class="btn btn-round btn-icon btn-<c:if test="${task.state!='TODO'}">outline-</c:if>danger" href="/planije2/app/taskState?team=true&state=TODO&taskId=${task.taskId}&teamId=${team.teamId}">
				                  <i class="nc-icon nc-paper">
				                  </i></a>
				               </li>
				               <li class="nav-item">
				                  <a class="btn btn-round btn-icon btn-<c:if test="${task.state!='DOING'}">outline-</c:if>warning" href="/planije2/app/taskState?team=true&state=DOING&taskId=${task.taskId}&teamId=${team.teamId}">
				                  <i class="nc-icon nc-single-copy-04">
				                  </i></a>
				               </li>
				               <li class="nav-item">
				                  <a class="btn btn-round btn-icon btn-<c:if test="${task.state!='DONE'}">outline-</c:if>primary" href="/planije2/app/taskState?team=true&state=DONE&taskId=${task.taskId}&teamId=${team.teamId}">
				                  <i class="nc-icon nc-check-2">
				                  </i></a>
				               </li>
				            </ul>
				         </div>
				      </div>
				   </div>
				</div>
				</c:forEach>
                    
                    
                          </div>       
                    </div>
                </div>
            </div><div class="col-md-12">
                <div class="card">
                    <div class="card-header text-white bg-primary text-center">
                        <h4 class="card-title">Done</h4>
                    </div>
                    <div class="card-body">
                    <div class="row"> 
                        
                        
<!-- Task Cards -->
                <c:forEach items="${done}" var="task">
				<div class="col-lg-3 col-md-6 col-sm-6">
				   <div class="card card-stats border-danger">
				      <div class="card-header">
				         <div class="row">
				            <div class="col-md-5">
				               <span class="badge badge-secondary">
				               <i class=" nc-icon nc-time-alarm "></i> 
				               <br>
							               <c:if test="${task.left < 0}"> Expired </c:if>
							               <c:if test="${task.left >= 0}"> ${task.left} days left </c:if>
				               </span>
				            </div>
				            <div class="col-md-5">
				               <p class="card-category">
				                  ${task.category}
				               </p>
				            </div>
				       		<div class="col-md-2">
				               <a class="badge badge-danger" href="/planije2/app/deleteTask?team=true&teamId=${task.sourceTeam.teamId}&taskId=${task.taskId}">
				                  x
				               </a>
				            </div>
				         </div>
				         <div class="card-body ">
				            <div class="row">
				               <div class="align-self-center justify-content-center col-5 col-md-4">
				                  <div class="icon-big text-center icon-warning ">
				                     <i class="align-self-center nc-icon <c:if test="${task.state=='TODO'}">nc-paper text-danger</c:if><c:if test="${task.state=='DOING'}">nc-single-copy-04 text-warning</c:if><c:if test="${task.state=='DONE'}">nc-check-2 text-primary</c:if>"></i>
				                  </div>
				               </div>
				               <div class="col-7 col-md-8">
				                  <div>
				                      <a class="text-center  card-title text-info" href="/planije2/app/task?taskId=${task.taskId}">${task.title}</a>
				                  </div>
				               </div>
				            </div>
				         </div>
				         <div class="card-footer ">
				            <hr>
				            <ul class="nav" style="justify-content: space-around;">
				               <li class="nav-item">
				                  <a class="btn btn-round btn-icon btn-<c:if test="${task.state!='TODO'}">outline-</c:if>danger" href="/planije2/app/taskState?team=true&state=TODO&taskId=${task.taskId}&teamId=${team.teamId}">
				                  <i class="nc-icon nc-paper">
				                  </i></a>
				               </li>
				               <li class="nav-item">
				                  <a class="btn btn-round btn-icon btn-<c:if test="${task.state!='DOING'}">outline-</c:if>warning" href="/planije2/app/taskState?team=true&state=DOING&taskId=${task.taskId}&teamId=${team.teamId}">
				                  <i class="nc-icon nc-single-copy-04">
				                  </i></a>
				               </li>
				               <li class="nav-item">
				                  <a class="btn btn-round btn-icon btn-<c:if test="${task.state!='DONE'}">outline-</c:if>primary" href="/planije2/app/taskState?team=true&state=DONE&taskId=${task.taskId}&teamId=${team.teamId}">
				                  <i class="nc-icon nc-check-2">
				                  </i></a>
				               </li>
				            </ul>
				         </div>
				      </div>
				   </div>
				</div>
				</c:forEach>
                    
                    
                    
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

<script src="${pageContext.request.contextPath}/assets/js/editTaskModal.js"></script>
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
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css">





</body></html>