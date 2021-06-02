package web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import web.beans.Team;
import web.beans.User;
import web.dao.TeamDao;
import web.security.UserDetails;
import web.utility.HibernateUtil;

@WebServlet("/app/kickUser")
public class KickUserTeamServlet extends HttpServlet {
	
	TeamDao teamDao;
	
	public void init() {
		teamDao = new TeamDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Session hSession = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = hSession.beginTransaction();
		UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
		User user = hSession.find(User.class, userDetails.getUserId());
		Team team = hSession.find(Team.class, Integer.parseInt(request.getParameter("teamId")));
		if(request.getParameter("method").equals("leave")) {
			
// current user on session wishes to leave the team with teamId
			teamDao.leaveTeam(user.getUserId(), team.getTeamId());
			
			
			//this.getServletContext().getRequestDispatcher( "/planije2/app/teams" ).forward( request, response );
			response.sendRedirect("/planije2/app/teams");
		}
		else {
			
// team owner wants to delete user with userId from team with teamId parameters
			teamDao.leaveTeam(Integer.parseInt(request.getParameter("userId")), team.getTeamId());
			
			response.sendRedirect("/planije2/app/team?teamId="+request.getParameter("teamId"));
			//this.getServletContext().getRequestDispatcher( "/planije2/app/team?teamId="+request.getParameter("teamId") ).forward( request, response );
		}
		transaction.commit();
		hSession.close();
		
	}


}
