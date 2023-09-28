package quynh.java.webapp.codesnippet.dao.hql_impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import quynh.java.webapp.codesnippet.dao.CodeGroupDao;
import quynh.java.webapp.codesnippet.model.CodeGroup;
import quynh.java.webapp.codesnippet.model.Technology;
import quynh.java.webapp.codesnippet.support.db.HibernateConnection;

public class CodeGroupDaoImpl implements CodeGroupDao {
    private SessionFactory sessionFactory = HibernateConnection.getSessionFactory();
    
    public List<CodeGroup> getAll(Technology technology) {
        Session session = sessionFactory.openSession();
        Query<CodeGroup> query = session.createQuery("FROM CodeGroup where technology=:technology");
        query.setParameter("technology", technology);
        List<CodeGroup> codeGroups = query.list();
        session.close();
        return codeGroups;
    }
    public CodeGroup getById(int id) {
        Session session = sessionFactory.openSession();
        CodeGroup codeGroup = session.get(CodeGroup.class, id);
        session.close();
        return codeGroup;
    }
    public void add(CodeGroup codeGroup) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.save(codeGroup);
        session.getTransaction().commit();
        session.close();
    }
    public void update(CodeGroup codeGroup) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.update(codeGroup);
        session.getTransaction().commit();
        session.close();
    }
    public void delete(CodeGroup codeGroup) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.delete(codeGroup);
        session.getTransaction().commit();
        session.close();   
    }
}
