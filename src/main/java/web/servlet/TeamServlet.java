package web.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;


import web.beans.Task;
import web.beans.Team;
import web.dao.TaskDao;
import web.security.UserDetails;
import web.utility.HibernateUtil;


public class TeamServlet extends HttpServlet {
	
	TaskDao taskDao;
	
	public void init() {
		taskDao = new TaskDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Session sessionHibernate = HibernateUtil.getSessionFactory().openSession();
		UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
		int teamId = Integer.parseInt(request.getParameter("teamId"));
		Team team = sessionHibernate.find(Team.class, teamId);
		ArrayList<Task> tasks = new ArrayList<Task>();
		for(Task t : team.getTasks()){
			t.setLeft(taskDao.daysLeft(t));
			tasks.add(t);
		}
		
		request.setAttribute("team", team);
		if(!tasks.isEmpty()) {
		request.setAttribute("todo", taskDao.filterTasksByState( tasks, "TODO"));
		request.setAttribute("doing", taskDao.filterTasksByState( tasks, "DOING"));
		request.setAttribute("done", taskDao.filterTasksByState( tasks, "DONE"));
		}
		request.setAttribute("members", team.getMembers());
		
		sessionHibernate.close();
		this.getServletContext().getRequestDispatcher( "/team.jsp" ).forward( request, response );
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
