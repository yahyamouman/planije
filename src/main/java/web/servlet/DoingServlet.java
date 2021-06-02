package web.servlet;


import web.beans.Task;
import web.beans.User;
import web.dao.TaskDao;
import web.dao.UserDao;
import web.security.UserDetails;
import web.utility.HibernateUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/app/doing")
public class DoingServlet extends HttpServlet {

	TaskDao taskDao;
	
	public void init() {
		taskDao = new TaskDao();
	}
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher( "/doing.jsp" ).forward( request, response );
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	Session hSession = HibernateUtil.getSessionFactory().openSession();
    	UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
    	User user = hSession.find(User.class, userDetails.getUserId());
    	
		ArrayList<Task> tasks = new ArrayList<Task>();
		for(Task t : user.getOwnedTasks()){
			  t.setLeft(taskDao.daysLeft(t));
			  tasks.add(t);
		}
		
    	request.setAttribute("tasks", taskDao.filterTasksByState((ArrayList<Task>) tasks,"DOING"));
    	hSession.close();
    	this.getServletContext().getRequestDispatcher( "/doing.jsp" ).forward( request, response );
    }
}
