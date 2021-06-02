package web.dao;

import web.dao.repository.UserRepository;
import web.beans.Team;
import web.beans.User;
import web.utility.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class UserDao implements UserRepository {

    @Override
    public int addUser(User user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        int id = (int) session.save(user);
        transaction.commit();
        session.close();
        return id;
    }

    @Override
    public void updateUser(int id, String username, String firstName, String lastName, String email, String phone, String password) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        User u = (User) session.load(User.class, Integer.valueOf(id));

        // Update user properties
        u.setUsername(username); //Update HttpSession
        u.setFirstName(firstName);
        u.setLastName(lastName);
        u.setEmail(email);
        u.setPhone(phone);
        u.setPassword(password);

        session.update(u);
        transaction.commit();
        session.close();
    }

    public void deleteUser(User user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(user);
        transaction.commit();
        session.close();
    }
    
    public User getUserById(int userId) {
        Transaction transaction = null;
        User user = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            user = session.load(User.class, Integer.valueOf(userId));
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return user;
    }

    /*
    public User getUserById2(int userId) {
        Transaction transaction = null;
        User user = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            user = (User) session.createQuery("FROM User U WHERE U.userId = :userId").setParameter("userId", userId)
                    .uniqueResult();
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return user;
    }
    */

    @Override
    public User getUserByUsername(String username) {
        Transaction transaction = null;
        User user = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            user = (User) session.createQuery("FROM User U WHERE U.username = :username").setParameter("username", username)
                    .uniqueResult();
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return user;
    }
    
    public List<Team> getTeams(User user){
        List<Team> teams = new ArrayList<>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        teams = (List<Team>) session.createQuery("SELECT U.teams FROM User U WHERE U.userId = :userId")
        		.setParameter("userId", user.getUserId())
        		.getResultList();
        transaction.commit();
        return teams;
    }
    
    public List<Team> addToTeams(String userId, Team team){
        List<Team> teams = new ArrayList<>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        teams = (List<Team>) session.createQuery("SELECT U.teams FROM User U WHERE U.userId = :userId")
        		.setParameter("userId", userId)
        		.getResultList();
        teams.add(team);
        transaction.commit();
        return teams;
    }
    
    public List<Team> getOwnedTeams(User user){
        List<Team> ownedTeams = new ArrayList<>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        ownedTeams = (List<Team>) session.createQuery("SELECT U.ownedTeams FROM User U WHERE U.userId = :userId")
        		.setParameter("userId", user.getUserId())
        		.getResultList();
        transaction.commit();
        return ownedTeams;
    }

    public List<User> getUsers(){
        List<User> users = new ArrayList<>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        String qr = "FROM User"; //Entity name
        Query query = session.createQuery(qr);
        users = query.list();
        transaction.commit();
        return users;
    }

}
