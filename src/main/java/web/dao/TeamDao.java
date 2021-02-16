package web.dao;

import web.dao.repository.TeamRepository;
import web.beans.Task;
import web.beans.Team;
import web.beans.User;
import web.utility.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;

public class TeamDao implements TeamRepository {

    private UserDao userDao = new UserDao();

    public void addTeam(Team team) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(team);
        transaction.commit();
    }

    @Override
    public void updateTeam(int teamId, String title, String description) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Team team = (Team) session.find(Team.class, teamId);

        // Update user properties
        team.setTitle(title);
        team.setDescription(description);
        team.setCode();

        session.update(team);
        transaction.commit();
        session.close();
    }

    public void deleteTeam(Team team) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(team);
        transaction.commit();
        session.close();

    }

    @Override
    public Team getTeamById(int teamId) {
        Transaction transaction = null;
        Team team = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            team = (Team) session.load(Team.class, teamId);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return team;
    }

    
    public Team getTeamByCode(String code) {
        
            Transaction transaction = null;
            Team team = null;
            try (Session session = HibernateUtil.getSessionFactory().openSession()) {
                // start a transaction
                transaction = session.beginTransaction();
                // get a team object
                team = (Team) session.createQuery("FROM Team T WHERE T.code = :code").setParameter("code", code)
                        .uniqueResult();
                // commit transaction
                transaction.commit();
            } catch (Exception e) {
                if (transaction != null) {
                    transaction.rollback();
                }
                e.printStackTrace();
            }
            return team;
        
    }

    @Override
    public boolean joinTeam(int userId, String code) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Team team = getTeamByCode(code);
        User user = userDao.getUserById(userId);
        if (team != null){
            user.addToTeams(team);
            session.update(team);
            session.update(user);
            transaction.commit();
            return true;
        }
        return false;
    }

    @Override
    public void leaveTeam(int userId, int teamId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        ArrayList<User> members;
        User user = session.find(User.class, userId);
        Team team = session.find(Team.class, teamId);
        
        //if userId is owner of team then the first member to join the team would become the owner
        if (team.getTeamOwner().getUserId()==userId){
            if(team.getMembers().isEmpty()) {
            	session.delete(team);
            }
            else {
            	members = (ArrayList<User>) team.getMembers();
            	team.setTeamOwner(members.get(0));
            	session.update(team);
            }
        }
        //if userId is just a member then he leaves the team
        else{
        	team.getMembers().remove(user);
        	user.getTeams().remove(team);
        	session.update(team);
        }
        session.update(user);
    }
    
    public int[] teamTaskStats(int teamId) {
    	int[] stats = {0,0,0};
    	
    	Session session = HibernateUtil.getSessionFactory().openSession();
    	Team team = (Team) session.createQuery("FROM Team T WHERE T.teamId = :teamId").setParameter("teamId", teamId)
                .uniqueResult();
    	
    	for (Task task : team.getTasks() ) {
    		if (task.getState().equals("TODO")) {
    			stats[0]+=1;
    		}
    		if (task.getState().equals("DOING")) {
    			stats[1]+=1;
    		}
    		if (task.getState().equals("DONE")) {
    			stats[2]+=1;
    		}
    	}
    	
    	return stats;
    }
}
