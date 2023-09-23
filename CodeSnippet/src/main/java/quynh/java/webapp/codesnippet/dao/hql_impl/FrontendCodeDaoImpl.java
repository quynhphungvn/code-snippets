package quynh.java.webapp.codesnippet.dao.hql_impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import quynh.java.webapp.codesnippet.dao.FrontendCodeDao;
import quynh.java.webapp.codesnippet.model.FrontendCode;
import quynh.java.webapp.codesnippet.model.CodeGroup;
import quynh.java.webapp.codesnippet.support.db.HibernateConnection;

public class FrontendCodeDaoImpl implements FrontendCodeDao {
private SessionFactory sessionFactory = HibernateConnection.getSessionFactory();
    
    public List<FrontendCode> getAll(CodeGroup codeGroup) {
        Session session = sessionFactory.openSession();
        Query<FrontendCode> query = session.createQuery("FROM FrontendCode where codeGroup=:codeGroup");
        query.setParameter("codeGroup", codeGroup);
        List<FrontendCode> frontendCodes = query.list();
        session.close();
        return frontendCodes;
    }
    public FrontendCode getById(int id) {
        Session session = sessionFactory.openSession();
        FrontendCode frontendCode = session.get(FrontendCode.class, id);
        session.close();
        return frontendCode;
    }
    public void add(FrontendCode frontendCode) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.save(frontendCode);
        session.getTransaction().commit();
        session.close();
    }
    public void update(FrontendCode frontendCode) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.update(frontendCode);
        session.getTransaction().commit();
        session.close();
    }
    public void delete(FrontendCode frontendCode) {
        Session session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.delete(frontendCode);
        session.getTransaction().commit();
        session.close();   
    }
}
