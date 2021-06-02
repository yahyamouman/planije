package web.security;

import web.dao.AchievementDao;
import web.dao.TaskDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AuthenticationServlet extends HttpServlet {
    private UserDetailsDao loginDao;
    private HttpSession session;
    private TaskDao taskDao;
    private AchievementDao achievementDao;

    public void init() {
        loginDao = new UserDetailsDao();
        achievementDao = new AchievementDao();
        achievementDao.initAchievements();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        session = request.getSession();
        if (loginDao.validate(username, password)) {
            //set session
            session.setAttribute("userDetails",loginDao.loadUserDetailsByUsername(username));
            response.sendRedirect("/planije2/app/home");
        } else {
            //reset session
            session.setAttribute("userDetails",null);
            response.sendRedirect("login.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	if(session.getAttribute("userDetails")==null) {
    		response.sendRedirect("login.jsp");
    	}
    	else {
    		response.sendRedirect("/planije2/app/home");
    	}
    }

    private void authenticate(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

    }
}
