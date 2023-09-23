package quynh.java.webapp.codesnippet.service;

import java.util.List;

import quynh.java.webapp.codesnippet.model.CodeGroup;

public interface CodeGroupService {
    
    public List<CodeGroup> getAll(int techSubjectId);
    public CodeGroup getById(int id);
    public CodeGroup add(String name, int techSubjectId);
    public CodeGroup delete(int id);
    public CodeGroup updateName(int id, String newName);
}
