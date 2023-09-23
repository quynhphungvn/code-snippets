package quynh.java.webapp.codesnippet.service;

import java.util.List;

import quynh.java.webapp.codesnippet.model.TechSubject;

public interface TechSubjectService {

    public List<TechSubject> getAll();
    public TechSubject getById(int id);
    public TechSubject add(String name);
    public TechSubject delete(int id);
    public TechSubject update(int id, String name);
}
