package web.utility;

import web.utility.HibernateUtil;
import org.hibernate.SessionFactory;

public class App {
    public static void main(String[] args){
        SessionFactory session = HibernateUtil.getSessionFactory();
        HibernateUtil.shutdown();
    }
}
