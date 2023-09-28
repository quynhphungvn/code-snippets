package quynh.java.webapp.codesnippet.dao;

import java.util.List;

import quynh.java.webapp.codesnippet.model.CodeGroup;
import quynh.java.webapp.codesnippet.model.Technology;

public interface CodeGroupDao {
    
    public List<CodeGroup> getAll(Technology subjectType);
    public CodeGroup getById(int id);
    public void add(CodeGroup snippetGroup);
    public void delete(CodeGroup snippetGroup);
    public void update(CodeGroup snippetGroup);
}
