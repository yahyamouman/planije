<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<title>add Team</title>
</head>
<body>
<h1>Create Team</h1>
<div class="container col-md-8 col-md-offset-3" style="overflow: auto">
	<form action="/planije2/app/addTeam" method="post">
	  <div class="form-group">
            <label for="teamTitle">Team Title :</label>
            <input  type="text"
                    class="form-control" id="teamTitle" placeholder="Name your team"
                    name="teamTitle" required>
      </div>
	  <div class="form-group">
		<label for="description">Description :</label>
	    <textarea class="form-control" name="description" type="text" value="Empty" >No description</textarea>
	  </div>
	  <button type="submit" class="btn btn-primary">Add</button>
	</form>
</div>
</body>
</html>