package web.servlet;

import web.dao.UserDao;
import web.beans.User;
import web.security.UserDetails;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/app/publicProfile")
public class PublicProfileServlet extends HttpServlet {
    private UserDao userDao;
    @Override
    public void init() throws ServletException {
        userDao = new UserDao();
    }

    //To be edited
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
        User user = userDao.getUserById( Integer.parseInt( request.getParameter("userId")));
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
        
        
        
        
        this.getServletContext().getRequestDispatcher( "/publicProfile.jsp" ).forward( request, response );
    }




}
