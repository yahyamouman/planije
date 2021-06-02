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
import web.dao.UserDao;
import web.security.UserDetails;
import web.utility.HibernateUtil;

/**
 * Servlet implementation class EditProfileServlet
 */
public class EditProfileServlet extends HttpServlet {
	
    private UserDao userDao;
    @Override
    public void init() throws ServletException {
        userDao = new UserDao();
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
        
        
        //update user
        
        if(request.getParameter("password").equals(request.getParameter("confirmPassword"))) {
        
		Session hSession = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = hSession.beginTransaction();
		
		User user = (User) hSession.find(User.class, userDetails.getUserId());
		
		userDao.updateUser(userDetails.getUserId(), request.getParameter("username"), request.getParameter("firstName"), request.getParameter("lastName"), request.getParameter("email"), request.getParameter("phone"), request.getParameter("password"));
		
		hSession.update(user);
		transaction.commit();
		hSession.close();
		
        }
        else {
        	request.setAttribute("error", "password mismatch");
        }
        response.sendRedirect("/planije2/app/profile");
        //this.getServletContext().getRequestDispatcher( "/planije2/app/profile" ).forward( request, response );
    }
}
