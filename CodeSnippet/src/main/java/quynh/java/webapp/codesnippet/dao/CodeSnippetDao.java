package quynh.java.webapp.codesnippet.dao;

import java.util.List;

import quynh.java.webapp.codesnippet.model.CodeSnippet;
import quynh.java.webapp.codesnippet.model.CodeGroup;

public interface CodeSnippetDao {
    
    public List<CodeSnippet> getAll(CodeGroup snippetGroup);
    public CodeSnippet getById(int id);
    public void add(CodeSnippet frontendSnippet);
    public void delete(CodeSnippet frontendSnippet);
    public void update(CodeSnippet frontendSnippet);
}
