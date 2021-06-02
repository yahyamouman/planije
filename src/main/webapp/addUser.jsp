<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
    <title>Planije : Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    <!-- Nucleo Icons -->
    <link href="css/nucleo-icons.css" rel="stylesheet" />
    <link href="css/nucleo-svg.css" rel="stylesheet" />
    <!-- Font Awesome Icons -->
    <link href="css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/creativetim/creativetim.min.css">
    <link rel="icon" sizes="16x16" href="/assets/img/planije.png">
</head>
<body>
<header class="header-1">
<nav class="navbar navbar-expand-lg bg-default navbar-absolute"><div class="container">
            <a class="navbar-brand text-white" href="javascript:;">Planij&eacute;</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-header-1" aria-controls="navbar-header-1" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbar-header-1">
              <div class="navbar-collapse-header">
                <div class="row">
                  <div class="col-6 collapse-brand"><a href="javascript:;"><img src="https://app.creative-tim.com/argon_placeholder/brand/blue.png"></a></div>
                  <div class="col-6 collapse-close">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-header-1" aria-controls="navbar-header-1" aria-expanded="false" aria-label="Toggle navigation"><span></span><span></span></button>
                  </div>
                </div>
              </div>
              <ul class="navbar-nav mx-auto"><li class="nav-item"><a class="nav-link text-white" href="/planije2/">Home</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="javascript:;">About Us</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="javascript:;">Contact Us</a></li>
              </div>
          </div>
        </nav>
        <br>
        <br>
        <br>
        <br>
        <br>
		<div class="container col-md-8 col-md-offset-3" style="overflow: auto">
		<h1>Register Form</h1>
		<br>
		<h3>Fill your data to proceed</h3>
		<form action="addUser" method="post">
    <div class="form-row">
    <div class="form-group col-md-6">
				<div class="form-group" data-validate="First name is Required*">
				          
                 <label for="firstName">First name :</label>
		         			<input type="text" class="form-control" id="firstName" placeholder="first name" name="firstName" required="">
				</div>
    </div>
	 <div class="form-group col-md-6">
				<div class="form-group" data-validate="Last name is Required*">
				            <label for="lastName">Last name :</label>
		         			<input type="text" class="form-control" id="lastName" placeholder="last name" name="lastName" required="">
				</div>
    </div>
    </div>
	<div class="form-row">
        		<div class="form-group col-md-12" data-validate="Valid email is required: ex@abc.xyz">
				            <label for="email">Email :</label>
		         			<input type="text" class="form-control" id="email" placeholder="user@mail.xyz" name="email" required="">
				</div>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
				<div class="form-group" data-validate="Username is Required*">
				            <label for="username">Username :</label>
		         			<input type="text" class="form-control" id="username" placeholder="username" name="username" required="">
				</div>
        </div>
		<div class="form-group col-md-6">
				<div class="form-group" data-validate="Password is required">
				            <label for="password">Password :</label>
		         			<input type="password" class="form-control" id="password" placeholder="password" name="password" required="">
                </div>
        	</div>
    	</div>
		
    	<div class="form-row">						
				<div class="form-group col-md-6">
				            <label for="phone">Phone :</label>
		         			<input type="text" class="form-control" id="phone" placeholder="Phone number" name="phone" required="">
				</div>
                <div class="form-group col-md-6" style="align-self: flex-end;">
					<input class="btn btn-primary" type="submit" value="Register" style="min-inline-size: -webkit-fill-available;">
				</div>
    	</div>
    	<div class="form-row">
				<div class="form-group col-md-12" style="padding-bottom: 100px;">
					Do you have an account? 
						<a href="http://localhost:8080/planije2/login.jsp">
							Login
						</a>
				</div>
    		</div>
		</form>
	</div>
	</header>
</body>
</html>