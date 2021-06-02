package web.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import web.beans.Achievement;
import web.beans.Team;
import web.beans.User;
import web.dao.AchievementDao;
import web.dao.UserDao;
import web.security.UserDetails;
import web.utility.HibernateUtil;

public class AchievementsServlet extends HttpServlet {
	
    private UserDao userDao;
    private AchievementDao achievementDao;
    
    @Override
    public void init() throws ServletException {
        userDao = new UserDao();
        achievementDao = new AchievementDao();
        
    }

    //To be edited
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Session hSession = HibernateUtil.getSessionFactory().openSession();
        
        UserDetails userDetails = (UserDetails) session.getAttribute("userDetails");
        
        achievementDao.reloadAchievements(userDetails.getUserId());
        
        User user = hSession.find(User.class, userDetails.getUserId());
        
        ArrayList<Achievement> achievements = new ArrayList<>();
        ArrayList<Achievement> activeAchievements = new ArrayList<>();
        ArrayList<Achievement> passiveAchievements = new ArrayList<>();
        achievements = (ArrayList<Achievement>) hSession.createQuery("SELECT a FROM Achievement a").getResultList();
        
        for(Achievement a : achievements) {
        	if(a.getHolders().contains(user)) {
        		activeAchievements.add(a);
        	}
        	else {
        		passiveAchievements.add(a);
        	}
        }
        
        request.setAttribute("user",user);
        request.setAttribute("achievements", achievements);
        request.setAttribute("activeAchievements", user.getAchievements());
        request.setAttribute("passiveAchievements", passiveAchievements);
        
        float progress = ((float)user.getAchievements().size()/(float)achievements.size())*100;
        progress = Math.round(progress);
        request.setAttribute("progress", progress);
        
        
        
        //level
        request.setAttribute("level", Math.round(user.getExp()/100));
        //exp
        request.setAttribute("exp", user.getExp()%100);
        
        
        
        this.getServletContext().getRequestDispatcher( "/achievements.jsp" ).forward( request, response );
    }
}
