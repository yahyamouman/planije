package web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import web.beans.Task;
import web.beans.User;
import web.dao.UserDao;
import web.security.UserDetails;
import web.utility.HibernateUtil;

/**
 * Servlet implementation class TaskServlet
 */
public class TaskServlet extends HttpServlet {
	
	UserDao userDao;
	
	public void init() {
		userDao = new UserDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
        Session hSession = HibernateUtil.getSessionFactory().openSession();
        User user = userDao.getUserById(userDetails.getUserId());
        
        
        Task task = hSession.find(Task.class, Integer.parseInt(request.getParameter("taskId")));
        request.setAttribute("task", task);
        request.setAttribute("user",task.getTaskOwner());
        
        //number of tasks done
        request.setAttribute("done", 12);
        
        //number of tasks done
        request.setAttribute("badge", 3);
        
        //number of tasks done
        request.setAttribute("team", 5);
        
        //level
        request.setAttribute("level", Math.round(user.getExp()/100));
        //exp
        request.setAttribute("exp", user.getExp()%100);
        
        
        this.getServletContext().getRequestDispatcher( "/task.jsp" ).forward( request, response );
	}


}
