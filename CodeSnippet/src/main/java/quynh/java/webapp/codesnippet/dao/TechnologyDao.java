package quynh.java.webapp.codesnippet.dao;

import java.util.List;

import quynh.java.webapp.codesnippet.model.Technology;

public interface TechnologyDao {
    
    public List<Technology> getAll();
    public Technology getById(int id);
    public void add(Technology subjectType);
    public void delete(Technology subjectType);
    public void update(Technology subjectType);   
}
