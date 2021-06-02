package web.utility;

import web.beans.Achievement;
import web.utility.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class App {
    public static void main(String[] args){
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
        HibernateUtil.shutdown();
    }
}
