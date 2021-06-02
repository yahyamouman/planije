package web.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import web.beans.Task;
import web.beans.Team;
import web.dao.TeamDao;
import web.security.UserDetails;
import web.utility.HibernateUtil;

/**
 * Servlet implementation class EditTeamServlet
 */
public class EditTeamServlet extends HttpServlet {
	
	TeamDao teamDao;
	
	public void init() {
		teamDao = new TeamDao();
	}
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
		Session hSession = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = hSession.beginTransaction();
		
		Team team = (Team) hSession.find(Team.class, Integer.parseInt(request.getParameter("teamId")));
		
		teamDao.updateTeam(Integer.parseInt(request.getParameter("teamId")), request.getParameter("teamTitle"), request.getParameter("description"));
		
		hSession.update(team);
		transaction.commit();
		hSession.close();
		
		response.sendRedirect("/planije2/app/team?teamId="+request.getParameter("teamId"));
		//this.getServletContext().getRequestDispatcher( "/planije2/app/team?teamId="+request.getParameter("teamId") ).forward( request, response );
	}

}
