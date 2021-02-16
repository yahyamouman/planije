<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yahya
  Date: 1/9/2021
  Time: 12:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Planije - Login</title>
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
<header class="header-1"><nav class="navbar navbar-expand-lg bg-default navbar-absolute"><div class="container">
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
        </nav><div class="page-header">
        <div class="page-header-image" style="background-image: url('https://app.creative-tim.com/argon_placeholder/ill/p2.svg')"></div>
		<div class="container col-md-8 col-md-offset-3" style="overflow: auto">
		    <h1>Welcome back to Planije</h1>
		    <form action="login" method="post">
		        <div class="form-group">
		            <label for="username">Username:</label>
		            <input  type="text"
		                    class="form-control" id="username" placeholder="Username"
		                    name="username" required>
		        </div>
		        <div class="form-group">
		            <label for="username">Password:</label>
		            <input  type="password"
		                    class="form-control" id="password" placeholder="Password"
		                    name="password" required>
		        </div>
		        <button type="submit" class="btn btn-primary">login</button>
		    </form>
		</div>
		</div>
		</header>
</body>
</html>