package web.servlet;

import web.dao.UserDao;
import web.beans.Task;
import web.beans.User;
import web.security.UserDetails;
import web.utility.HibernateUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/app/profile")
public class ProfileServlet extends HttpServlet {
    private UserDao userDao;
    @Override
    public void init() throws ServletException {
        userDao = new UserDao();
    }

    //To be edited
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
        User user = userDao.getUserById(userDetails.getUserId());
        request.setAttribute("User",user);
        request.setAttribute("Teams", user.getOwnedTeams());
        request.setAttribute("Achievements", user.getAchievements());
        
        
        
        //number of tasks done
        request.setAttribute("done", 12);
        //number of Badges
        request.setAttribute("Badges", 5);
        //number of Teams
        request.setAttribute("Teams", 4);
        
        //level
        request.setAttribute("level", Math.round(user.getExp()/100));
        //exp
        request.setAttribute("exp", user.getExp()%100);
        
        
        
        this.getServletContext().getRequestDispatcher( "/profile.jsp" ).forward( request, response );
    }



}
