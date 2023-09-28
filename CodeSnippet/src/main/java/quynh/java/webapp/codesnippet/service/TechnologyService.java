package quynh.java.webapp.codesnippet.service;

import java.util.List;

import quynh.java.webapp.codesnippet.model.Technology;

public interface TechnologyService {

    public List<Technology> getAll();
    public Technology getById(int id);
    public Technology add(String name);
    public Technology delete(int id);
    public Technology updateName(int id, String newName);
}
