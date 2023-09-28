package quynh.java.webapp.codesnippet.dao.hql_impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import quynh.java.webapp.codesnippet.dao.TechnologyDao;
import quynh.java.webapp.codesnippet.model.Technology;
import quynh.java.webapp.codesnippet.support.db.HibernateConnection;

public class TechnologyDaoImpl implements TechnologyDao {
    private SessionFactory sessionFactory = HibernateConnection.getSessionFactory();
    
    public List<Technology> getAll() {
        Session session = sessionFactory.openSession();
        Query<Technology> query = session.createQuery("FROM Technology");
        List<Technology> technologys = query.list();
        session.close();
        return technologys;
    }
    public Technology getById(int id) {
        Session session = sessionFactory.openSession();
        Technology technology = session.get(Technology.class, id);
        session.close();
        return technology;
    }
    public void add(Technology technology) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.save(technology);
        session.getTransaction().commit();
        session.close();
    }
    public void update(Technology technology) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.update(technology);
        session.getTransaction().commit();
        session.close();
    }
    public void delete(Technology technology) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.delete(technology);
        session.getTransaction().commit();
        session.close();   
    }
}
