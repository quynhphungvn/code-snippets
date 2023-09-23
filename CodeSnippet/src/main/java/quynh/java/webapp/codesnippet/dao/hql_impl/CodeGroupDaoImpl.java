package quynh.java.webapp.codesnippet.dao.hql_impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import quynh.java.webapp.codesnippet.dao.CodeGroupDao;
import quynh.java.webapp.codesnippet.model.CodeGroup;
import quynh.java.webapp.codesnippet.model.TechSubject;
import quynh.java.webapp.codesnippet.support.db.HibernateConnection;

public class CodeGroupDaoImpl implements CodeGroupDao {
    private SessionFactory sessionFactory = HibernateConnection.getSessionFactory();
    
    public List<CodeGroup> getAll(TechSubject techSubject) {
        Session session = sessionFactory.openSession();
        Query<CodeGroup> query = session.createQuery("FROM CodeGroup where techSubject=:techSubject");
        query.setParameter("techSubject", techSubject);
        List<CodeGroup> snippetGroups = query.list();
        session.close();
        return snippetGroups;
    }
    public CodeGroup getById(int id) {
        Session session = sessionFactory.openSession();
        CodeGroup snippetGroup = session.get(CodeGroup.class, id);
        session.close();
        return snippetGroup;
    }
    public void add(CodeGroup snippetGroup) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.save(snippetGroup);
        session.getTransaction().commit();
        session.close();
    }
    public void update(CodeGroup snippetGroup) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.update(snippetGroup);
        session.getTransaction().commit();
        session.close();
    }
    public void delete(CodeGroup snippetGroup) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.delete(snippetGroup);
        session.getTransaction().commit();
        session.close();   
    }
}
