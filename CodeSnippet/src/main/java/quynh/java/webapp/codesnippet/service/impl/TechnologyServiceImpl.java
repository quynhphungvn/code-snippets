package quynh.java.webapp.codesnippet.service.impl;

import java.util.List;

import quynh.java.webapp.codesnippet.dao.TechnologyDao;
import quynh.java.webapp.codesnippet.dao.hql_impl.TechnologyDaoImpl;
import quynh.java.webapp.codesnippet.model.Technology;
import quynh.java.webapp.codesnippet.service.TechnologyService;


public class TechnologyServiceImpl implements TechnologyService {
    private TechnologyDao technologyDao = new TechnologyDaoImpl();

    @Override
    public List<Technology> getAll() {
        // TODO Auto-generated method stub
        return technologyDao.getAll();
    }

    @Override
    public Technology getById(int id) {
        return technologyDao.getById(id);
    }

    @Override
    public Technology add(String name) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Technology delete(int id) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Technology updateName(int id, String name) {
        // TODO Auto-generated method stub
        return null;
    }
    
   
}
