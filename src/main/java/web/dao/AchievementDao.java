package web.dao;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.Transaction;

import web.beans.Achievement;
import web.beans.Task;
import web.beans.User;
import web.utility.HibernateUtil;

public class AchievementDao {
	
	public void initAchievements() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        
        if(session.createQuery("FROM Achievement").getResultList().isEmpty()) {
        
        Achievement rookie = new Achievement("Rookie","Reach Level 2","014-reward.png");
        Achievement amateur = new Achievement("Amateur","Reach Level 5","015-reward-1.png");
        Achievement novice = new Achievement("Novice","Reach Level 10","016-reward-2.png");
        Achievement advanced = new Achievement("Advanced","Reach Level 20","018-reward-3.png");
        Achievement pro = new Achievement("Pro","Reach Level 30","020-badge.png");
        Achievement master = new Achievement("Master","Reach Level 40","025-badge-2.png");
        Achievement teamwork = new Achievement("Teamwork","Create 1st team","021-trophy-1.png");
        Achievement planije = new Achievement("Planije","Creat 1st Todo","000-planije.png");
        Achievement done = new Achievement("Done!","Complete 1st task","026-badge-3.png");
        
        session.save(rookie);
        session.save(amateur);
        session.save(novice);
        session.save(advanced);
        session.save(pro);
        session.save(master);
        session.save(teamwork);
        session.save(planije);
        session.save(done);
        
        }
        transaction.commit();
        session.close();
	}
	
	public void reloadAchievements(int userId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		User user = session.find(User.class, userId);
		
		int level = Math.round(user.getExp()/100);
		
		ArrayList<Achievement> achievements = new ArrayList<>();
		achievements = (ArrayList<Achievement>) session.createQuery("SELECT a FROM Achievement a").getResultList();
		
		for(Achievement a : achievements) {
			if(a.getTitle().equals("Rookie") && level+1>=2 && !user.getAchievements().contains(a)) {
				user.getAchievements().add(a);
				a.getHolders().add(user);
			}
			else if(a.getTitle().equals("Amateur") && level+1>=5 && !user.getAchievements().contains(a)) {
				user.getAchievements().add(a);
				a.getHolders().add(user);
			}
			else if(a.getTitle().equals("Novice") && level+1>=10 && !user.getAchievements().contains(a)) {
				user.getAchievements().add(a);
				a.getHolders().add(user);
			}
			else if(a.getTitle().equals("Advanced") && level+1>=20 && !user.getAchievements().contains(a)) {
				user.getAchievements().add(a);
				a.getHolders().add(user);
			}
			else if(a.getTitle().equals("Pro") && level+1>=30 && !user.getAchievements().contains(a)) {
				user.getAchievements().add(a);
				a.getHolders().add(user);
			}
			else if(a.getTitle().equals("Master") && level+1>=40 && !user.getAchievements().contains(a)) {
				user.getAchievements().add(a);
				a.getHolders().add(user);
			}
			else if(a.getTitle().equals("Teamwork") && !user.getOwnedTeams().isEmpty() && !user.getAchievements().contains(a)) {
				user.getAchievements().add(a);
				a.getHolders().add(user);
			}
			else if(a.getTitle().equals("Planije") && !user.getOwnedTasks().isEmpty() && !user.getAchievements().contains(a)) {
				user.getAchievements().add(a);
				a.getHolders().add(user);
			}
			else if(a.getTitle().equals("Done!") && !user.getOwnedTasks().isEmpty() && !user.getAchievements().contains(a)) {
				boolean b = false;
				for(Task t:user.getOwnedTasks()) {
					if(t.getState().equals("DONE")) {
						b = true;
					}
				}
				if(b) {
					user.getAchievements().add(a);
					a.getHolders().add(user);
				}
			}
		}
		
		transaction.commit();
		session.close();
	}

}
