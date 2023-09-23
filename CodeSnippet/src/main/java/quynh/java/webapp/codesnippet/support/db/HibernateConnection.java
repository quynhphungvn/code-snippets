package quynh.java.webapp.codesnippet.support.db;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import quynh.java.webapp.codesnippet.model.FrontendCode;
import quynh.java.webapp.codesnippet.model.CodeGroup;
import quynh.java.webapp.codesnippet.model.TechSubject;

public class HibernateConnection {
    private final static SessionFactory FACTORY;

    static {
        Configuration conf = new Configuration();
        Properties props = new Properties();
        try {
            props.load(HibernateConnection.class.getClassLoader().getResourceAsStream("db-info.properties"));
        } catch (IOException e) {

            e.printStackTrace();
        }
        conf.setProperty(Environment.DIALECT, props.getProperty("DIALECT"));
        conf.setProperty(Environment.DRIVER, props.getProperty("DRIVER"));
        conf.setProperty(Environment.URL, props.getProperty("URL"));
        conf.setProperty(Environment.USER, props.getProperty("USER"));
        conf.setProperty(Environment.PASS, props.getProperty("PASSWORD"));
        conf.setProperty(Environment.SHOW_SQL, "true");

        // knowledge
        conf.addAnnotatedClass(FrontendCode.class);
        conf.addAnnotatedClass(TechSubject.class);
        conf.addAnnotatedClass(CodeGroup.class);
        ServiceRegistry registry = new StandardServiceRegistryBuilder().applySettings(conf.getProperties()).build();
        FACTORY = conf.buildSessionFactory(registry);
    }

    public static SessionFactory getSessionFactory() {
        return FACTORY;
    }
}
