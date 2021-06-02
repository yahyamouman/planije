package web.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import web.beans.Team;
import web.beans.User;
import web.dao.TeamDao;
import web.dao.UserDao;
import web.security.UserDetails;
import web.utility.HibernateUtil;


public class TeamsServlet extends HttpServlet {
       
	UserDao userDao;
	TeamDao teamDao;

    public void init() {
    	userDao = new UserDao();
    	teamDao = new TeamDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Session sessionHibernate = HibernateUtil.getSessionFactory().openSession();
		UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
		User user = sessionHibernate.find(User.class, userDetails.getUserId());
		
		
		ArrayList<Team> ownedTeams = new ArrayList<>();
		for (Team team : user.getOwnedTeams()) {
			int[] stats = teamDao.teamTaskStats(team.getTeamId());
			team.setTodoTask(stats[0]);
			team.setDoingTask(stats[1]);
			team.setDoneTask(stats[2]);
			ownedTeams.add(team);
		}
		
		
		ArrayList<Team> joinedTeams = new ArrayList<>();
		for (Team team : user.getTeams()) {
			int[] stats = teamDao.teamTaskStats(team.getTeamId());
			team.setTodoTask(stats[0]);
			team.setDoingTask(stats[1]);
			team.setDoneTask(stats[2]);
			joinedTeams.add(team);
		}
		
		request.setAttribute("ownedTeams", ownedTeams);
		request.setAttribute("joinedTeams", joinedTeams);
		
			//Add Tasks stats to jsp and here
			
		this.getServletContext().getRequestDispatcher( "/teams.jsp" ).forward( request, response );
		sessionHibernate.close();
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Session sessionHibernate = HibernateUtil.getSessionFactory().openSession();
		UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
		User user = sessionHibernate.find(User.class, userDetails.getUserId());
			request.setAttribute("ownedTeams", (List<Team>) user.getOwnedTeams());
			request.setAttribute("joinedTeams", (List<Team>) user.getTeams());

			//Add Tasks stats to jsp and here
			
		this.getServletContext().getRequestDispatcher( "/teams.jsp" ).forward( request, response );
	}

}
