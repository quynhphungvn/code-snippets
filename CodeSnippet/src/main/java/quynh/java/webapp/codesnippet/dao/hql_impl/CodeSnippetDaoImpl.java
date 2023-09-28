package quynh.java.webapp.codesnippet.dao.hql_impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import quynh.java.webapp.codesnippet.dao.CodeSnippetDao;
import quynh.java.webapp.codesnippet.model.CodeSnippet;
import quynh.java.webapp.codesnippet.model.CodeGroup;
import quynh.java.webapp.codesnippet.support.db.HibernateConnection;

public class CodeSnippetDaoImpl implements CodeSnippetDao {
private SessionFactory sessionFactory = HibernateConnection.getSessionFactory();
    
    public List<CodeSnippet> getAll(CodeGroup codeGroup) {
        Session session = sessionFactory.openSession();
        Query<CodeSnippet> query = session.createQuery("FROM CodeSnippet where codeGroup=:codeGroup");
        query.setParameter("codeGroup", codeGroup);
        List<CodeSnippet> codeSnippets = query.list();
        session.close();
        return codeSnippets;
    }
    public CodeSnippet getById(int id) {
        Session session = sessionFactory.openSession();
        CodeSnippet codeSnippet = session.get(CodeSnippet.class, id);
        session.close();
        return codeSnippet;
    }
    public void add(CodeSnippet codeSnippet) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.save(codeSnippet);
        session.getTransaction().commit();
        session.close();
    }
    public void update(CodeSnippet codeSnippet) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.update(codeSnippet);
        session.getTransaction().commit();
        session.close();
    }
    public void delete(CodeSnippet codeSnippet) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.delete(codeSnippet);
        session.getTransaction().commit();
        session.close();   
    }
}
