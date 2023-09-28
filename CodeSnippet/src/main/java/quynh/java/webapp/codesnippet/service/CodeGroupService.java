package quynh.java.webapp.codesnippet.service;

import java.util.List;

import quynh.java.webapp.codesnippet.model.CodeGroup;
import quynh.java.webapp.codesnippet.model.Technology;

public interface CodeGroupService {
    
	public List<CodeGroup> getAll(Technology technology);
    public List<CodeGroup> getAll(int technologyId);
    public CodeGroup getById(int id);
    public CodeGroup add(String name, int technologyId);
    public CodeGroup delete(int id);
    public CodeGroup updateName(int id, String newName);
    public CodeGroup update(CodeGroup codeGroup);
}
