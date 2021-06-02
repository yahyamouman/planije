package web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import web.beans.Task;
import web.security.UserDetails;
import web.utility.HibernateUtil;

/**
 * Servlet implementation class DeleteTaskServlet
 */
public class DeleteTaskServlet extends HttpServlet {
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
		Session hSession = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = hSession.beginTransaction();
		Task task = (Task) hSession.find(Task.class, Integer.parseInt(request.getParameter("taskId")));
		String oldState = task.getState();
		hSession.delete(task);
		transaction.commit();
		hSession.close();
		
		if (request.getParameter("team").equals("true")) {
			response.sendRedirect("/planije2/app/team?teamId="+request.getParameter("teamId"));
		}
		else {
		response.sendRedirect("/planije2/app/"+oldState.toLowerCase());
		}
	}


}
