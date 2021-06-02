<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Planije - Teams</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>
<form action="/planije2/app/doing" method="get">
        <input type="submit" class="btn btn-primary" value="Doing">
</form>
<form action="/planije2/app/addTeam" method="get">
        <input type="submit" class="btn btn-primary" value="Create new Team">
</form>
<a href="addTeam.jsp">
   <button class="btn btn-primary">Create new Team</button>
</a>
<form action="/planije2/app/joinTeam" method="post">
            <label for="teamCode">Team Code:</label>
            <input  type="text"
                    class="form-control" placeholder="Enter Team code to join"
                    name="teamCode" required>
        <input type="submit" class="btn btn-primary" value="Join">
</form>

<c:if test="${not empty joinTeamResponse}">
	${joinTeamResponse}
</c:if>

<h1>Owned Teams</h1>
<c:if test="${joinedTeams.isEmpty()}">
You still haven't created any teams
</c:if>
    <c:forEach items="${ownedTeams}" var="t">
      <div>
      ${t.title}: ${t.description} code : ${t.code}
      	<a href="/planije2/app/team?teamId=${t.teamId}">
   			<button class="btn btn-primary">Enter Team</button>
		</a>
      <br /></div>
    </c:forEach>

<h1>Joined Teams</h1>
<c:if test="${joinedTeams.isEmpty()}">
You still haven't joined any teams
</c:if>
    <c:forEach items="${joinedTeams}" var="t">
      <div>
      ${t.title}: ${t.description} <br /></div>
    </c:forEach>

</body>
</html>