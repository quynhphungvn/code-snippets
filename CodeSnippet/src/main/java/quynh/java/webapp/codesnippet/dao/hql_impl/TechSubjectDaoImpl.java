package quynh.java.webapp.codesnippet.dao.hql_impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import quynh.java.webapp.codesnippet.dao.TechSubjectDao;
import quynh.java.webapp.codesnippet.model.TechSubject;
import quynh.java.webapp.codesnippet.support.db.HibernateConnection;

public class TechSubjectDaoImpl implements TechSubjectDao {
    private SessionFactory sessionFactory = HibernateConnection.getSessionFactory();
    
    public List<TechSubject> getAll() {
        Session session = sessionFactory.openSession();
        Query<TechSubject> query = session.createQuery("FROM TechSubject");
        List<TechSubject> subjectTypes = query.list();
        session.close();
        return subjectTypes;
    }
    public TechSubject getById(int id) {
        Session session = sessionFactory.openSession();
        TechSubject subjectType = session.get(TechSubject.class, id);
        session.close();
        return subjectType;
    }
    public void add(TechSubject subjectType) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.save(subjectType);
        session.getTransaction().commit();
        session.close();
    }
    public void update(TechSubject subjectType) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.update(subjectType);
        session.getTransaction().commit();
        session.close();
    }
    public void delete(TechSubject subjectType) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.delete(subjectType);
        session.getTransaction().commit();
        session.close();   
    }
}
