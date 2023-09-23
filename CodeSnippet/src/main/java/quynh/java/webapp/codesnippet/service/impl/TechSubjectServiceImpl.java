package quynh.java.webapp.codesnippet.service.impl;

import java.util.List;

import quynh.java.webapp.codesnippet.dao.TechSubjectDao;
import quynh.java.webapp.codesnippet.dao.hql_impl.TechSubjectDaoImpl;
import quynh.java.webapp.codesnippet.model.TechSubject;
import quynh.java.webapp.codesnippet.service.TechSubjectService;


public class TechSubjectServiceImpl implements TechSubjectService {
    private TechSubjectDao techSubjectDao = new TechSubjectDaoImpl();

    @Override
    public List<TechSubject> getAll() {
        // TODO Auto-generated method stub
        return techSubjectDao.getAll();
    }

    @Override
    public TechSubject getById(int id) {
        return techSubjectDao.getById(id);
    }

    @Override
    public TechSubject add(String name) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public TechSubject delete(int id) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public TechSubject update(int id, String name) {
        // TODO Auto-generated method stub
        return null;
    }
    
   
}
