package web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import web.beans.User;
import web.security.UserDetails;
import web.utility.HibernateUtil;

/**
 * Servlet implementation class AddExp
 */
public class AddExp extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
		Session hSession = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = hSession.beginTransaction();
		User user = hSession.find(User.class, userDetails.getUserId());
		
		user.addExp(90);
		
		transaction.commit();
		hSession.close();
		
		response.sendRedirect("/planije2/app/achievements");
		
	}


}
