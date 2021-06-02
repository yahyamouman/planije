package web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import web.beans.Team;
import web.beans.User;
import web.dao.TeamDao;
import web.dao.UserDao;
import web.security.UserDetails;

@WebServlet("/app/joinTeam")
public class JoinTeamServlet extends HttpServlet {
	
	TeamDao teamDao;
	UserDao userDao;
	
	public void init() {
		teamDao = new TeamDao();
		userDao = new UserDao();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
		User user = userDao.getUserByUsername(userDetails.getUsername());
		String code = (String) request.getParameter("teamCode");
		if(teamDao.joinTeam(user.getUserId(), code)) {
			Team team = teamDao.getTeamByCode(code);
			
			user.addExp(40);
			
			request.setAttribute("joinTeamResponse", "you joined "+team.getTitle()+" successfully");
		}
		else {
			request.setAttribute("joinTeamResponse", "invalid code");
		}
		
		this.getServletContext().getRequestDispatcher( "/planije2/app/teams" ).forward( request, response );
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
		String code = (String) request.getParameter("teamCode");
		if(teamDao.joinTeam(userDetails.getUserId(), code)) {
			Team team = teamDao.getTeamByCode(code);
			request.setAttribute("joinTeamResponse", "you joined "+team.getTitle()+" successfully");
		}
		else {
			request.setAttribute("joinTeamResponse", "invalid code");
		}
		response.sendRedirect("/planije2/app/teams");
		//this.getServletContext().getRequestDispatcher( "/planije2/app/teams" ).forward( request, response );
	}
}
