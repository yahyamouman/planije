package web.servlet;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import web.beans.Task;
import web.beans.Team;
import web.beans.User;
import web.security.UserDetails;
import web.utility.HibernateUtil;

/**
 * Servlet implementation class AddTaskServlet
 */
public class AddTaskServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Session hSession = HibernateUtil.getSessionFactory().openSession();
		Transaction hTransaction = hSession.beginTransaction();
		UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
		User user = hSession.find(User.class,userDetails.getUserId());
		
		Task task = new Task();
		task.setTitle(request.getParameter("title"));
		task.setCategory(request.getParameter("category"));
		task.setDescription(request.getParameter("description"));
		task.setStartDate(Date.valueOf(request.getParameter("startDate")));
		task.setEndDate(Date.valueOf(request.getParameter("endDate")));
		task.setState("TODO");
		task.setTaskOwner(user);
		
		user.addExp(20);
		
		if(request.getParameter("teamId").equals("-1")) {
			
			task.setSourceTeam(null);
			
			this.getServletContext().getRequestDispatcher( "/todo.jsp" ).forward( request, response );
		}
		else if(!request.getParameter("teamId").equals("-1")) {
			
			Team team = hSession.find(Team.class, Integer.parseInt(request.getParameter("teamId")));
			task.setSourceTeam(team);

			response.sendRedirect("/planije2/app/team?teamId="+request.getParameter("teamId"));
		}
		hSession.save(task);
		hTransaction.commit();
		hSession.close();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Session hSession = HibernateUtil.getSessionFactory().openSession();
		Transaction hTransaction = hSession.beginTransaction();
		UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
		User user = hSession.find(User.class,userDetails.getUserId());
		
		Task task = new Task();
		task.setTitle(request.getParameter("title"));
		task.setCategory(request.getParameter("category"));
		task.setDescription(request.getParameter("description"));
		task.setTitle(request.getParameter("title"));
		task.setStartDate(Date.valueOf(request.getParameter("startDate")));
		task.setEndDate(Date.valueOf(request.getParameter("endDate")));
		task.setState("TODO");
		task.setTaskOwner(user);
		
		if(request.getParameter("teamId")=="-1") {
			
			task.setSourceTeam(null);
			
			hSession.save(task);
			hTransaction.commit();
			
			this.getServletContext().getRequestDispatcher( "/todo.jsp" ).forward( request, response );
		}
		else if(request.getParameter("teamId")!="-1") {
			
			Team team = hSession.find(Team.class, request.getParameter("teamId"));
			task.setSourceTeam(team);
			
			hSession.save(task);
			hTransaction.commit();
			
			response.sendRedirect("/planije2/app/teams");
		}
		hSession.close();
	}

}
