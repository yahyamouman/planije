package web.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import web.beans.Task;
import web.beans.Team;
import web.beans.User;
import web.dao.TaskDao;
import web.security.UserDetails;
import web.utility.HibernateUtil;


public class HomeServlet extends HttpServlet {
	
	TaskDao taskDao;
	
	public void init() {
		taskDao = new TaskDao();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Session sessionHibernate = HibernateUtil.getSessionFactory().openSession();
		UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
		User user = sessionHibernate.find(User.class, userDetails.getUserId());
		
		ArrayList<Task> tasks = new ArrayList<Task>();
		for(Task t : user.getOwnedTasks()){
			  tasks.add(t);
		}
		for(Team t : user.getOwnedTeams()) {
			tasks.addAll(t.getTasks());
		}
		for(Team t : user.getTeams()) {
			tasks.addAll(t.getTasks());
		}
		
		ArrayList<Task> dangerTasks = new ArrayList<>();
		ArrayList<Task> warningTasks = new ArrayList<>();
		ArrayList<Task> otherTasks = new ArrayList<>();
		
		if(!tasks.isEmpty()) {
		
		for(Task t : tasks) {
			t.setLeft(taskDao.daysLeft(t));
			if(0 <= t.getLeft() && t.getLeft() <= 3 && !t.getState().equals("DONE")) {
				dangerTasks.add(t);
			}
			else if(3 < t.getLeft() && t.getLeft() <= 7 && !t.getState().equals("DONE")) {
				warningTasks.add(t);
			}
			else if(!t.getState().equals("DONE")){
				otherTasks.add(t);
			}
		}
		
		}
		
		request.setAttribute("dangerTasks", dangerTasks);
		request.setAttribute("warningTasks", warningTasks);
		request.setAttribute("otherTasks", otherTasks);
		
		
		
		this.getServletContext().getRequestDispatcher( "/home.jsp" ).forward( request, response );
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher( "/home.jsp" ).forward( request, response );
	}

}
