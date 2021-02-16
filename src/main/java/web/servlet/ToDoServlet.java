package web.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import web.beans.Task;
import web.beans.User;
import web.dao.TaskDao;
import web.security.UserDetails;
import web.utility.HibernateUtil;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/app/todo")
public class ToDoServlet extends HttpServlet {
	
	TaskDao taskDao;
	
	public void init() {
		taskDao = new TaskDao();
	}
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	this.getServletContext().getRequestDispatcher( "/todo.jsp" ).forward( request, response );
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	Session hSession = HibernateUtil.getSessionFactory().openSession();
    	UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
    	request.setAttribute("tasks", taskDao.filterTasksByState((ArrayList<Task>) taskDao.getPersonalTasks(userDetails.getUserId()),"TODO"));
    	hSession.close();
    	this.getServletContext().getRequestDispatcher( "/todo.jsp" ).forward( request, response );
    }
}
