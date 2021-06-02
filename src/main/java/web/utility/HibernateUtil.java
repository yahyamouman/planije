package web.utility;

import java.io.File;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
public class HibernateUtil {

    private static StandardServiceRegistry registry;
    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            try {
                // Create registry
            	//registry = new StandardServiceRegistryBuilder().configure(new File("bin/target/m2e-wtp/web-resources/hibernate.cfg.xml")).build();
                registry = new StandardServiceRegistryBuilder().configure(new File("planije2/bin/target/m2e-wtp/web-resources/hibernate.cfg.xml")).build();
                //registry = new StandardServiceRegistryBuilder().configure(new File("C:/Users/yahya/OneDrive/Desktop/planije2/bin/target/m2e-wtp/web-resources/hibernate.cfg.xml")).build();
                // Create MetadataSources
                MetadataSources sources = new MetadataSources(registry);
                // Create Metadata
                Metadata metadata = sources.getMetadataBuilder().build();
                // Create SessionFactory
                sessionFactory = metadata.getSessionFactoryBuilder().build();
            } catch (Exception e) {
                e.printStackTrace();
                if (registry != null) {
                    StandardServiceRegistryBuilder.destroy(registry);
                }
            }
        }
        return sessionFactory;
    }

    public static void shutdown(){
        if (registry != null){
            StandardServiceRegistryBuilder.destroy(registry);
        }
    }
}
