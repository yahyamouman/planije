<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>${team.title}</h1>

<h3>${team.description}</h3>

<p>${team.code}</p>

<form action="/planije2/app/teams" method="get">
        <input type="submit" class="btn btn-primary" value="Teams">
</form>
<form action="/planije2/app/doing" method="get">
        <input type="submit" class="btn btn-primary" value="Doing">
</form>

</body>
</html>