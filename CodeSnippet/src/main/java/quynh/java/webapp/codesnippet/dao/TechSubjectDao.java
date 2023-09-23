package quynh.java.webapp.codesnippet.dao;

import java.util.List;

import quynh.java.webapp.codesnippet.model.TechSubject;

public interface TechSubjectDao {
    
    public List<TechSubject> getAll();
    public TechSubject getById(int id);
    public void add(TechSubject subjectType);
    public void delete(TechSubject subjectType);
    public void update(TechSubject subjectType);   
}
