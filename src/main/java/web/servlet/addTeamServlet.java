package web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Session;

import web.beans.Team;
import web.beans.User;
import web.dao.TeamDao;
import web.dao.UserDao;
import web.security.UserDetails;
import web.utility.HibernateUtil;

/**
 * Servlet implementation class addTeamServlet
 */
public class addTeamServlet extends HttpServlet {

    private UserDao userDao;
    private TeamDao teamDao;
    
    @Override
    public void init() throws ServletException {
        userDao = new UserDao();
        teamDao = new TeamDao();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
		User user = userDao.getUserByUsername(userDetails.getUsername());
		
		Session session2 = HibernateUtil.getSessionFactory().openSession();
	    session2.beginTransaction();
	    
		Team team = new Team();
		team.setTitle(request.getParameter("teamTitle"));
		team.setDescription(request.getParameter("description"));
		team.setCode();
		user.addToOwnedTeams(team);
		
		user.addExp(40);
		
		session2.save(team);
		session2.update(user);
		session2.getTransaction().commit();
	    
		session2.close();
		response.sendRedirect("/planije2/app/teams");
		//this.getServletContext().getRequestDispatcher( "/planije2/app/teams" ).forward( request, response );
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
		User user = userDao.getUserByUsername(userDetails.getUsername());
		
		Session session2 = HibernateUtil.getSessionFactory().openSession();
	    session2.beginTransaction();
	    
		Team team = new Team();
		team.setTitle(request.getParameter("teamTitle"));
		team.setDescription(request.getParameter("description"));
		team.setCode();
		user.addToOwnedTeams(team);
		
		session2.save(team);
		session2.update(user);
		session2.getTransaction().commit();
	    
		session2.close();
		response.sendRedirect("/planije2/app/teams");
		//this.getServletContext().getRequestDispatcher( "/planije2/app/teams" ).forward( request, response );
		
	}

}
