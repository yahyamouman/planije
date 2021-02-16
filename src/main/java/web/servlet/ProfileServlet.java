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
        
        
        
        this.getServletContext().getRequestDispatcher( "/profile.jsp" ).forward( request, response );
    }


    //Incomplete
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
        User user = userDao.getUserById(userDetails.getUserId());
        
        
        //update user
        
        
        this.getServletContext().getRequestDispatcher( "/planije2/app/profile" ).forward( request, response );
    }
}
