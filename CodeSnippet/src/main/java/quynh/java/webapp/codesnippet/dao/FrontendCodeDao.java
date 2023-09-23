package quynh.java.webapp.codesnippet.dao;

import java.util.List;

import quynh.java.webapp.codesnippet.model.FrontendCode;
import quynh.java.webapp.codesnippet.model.CodeGroup;

public interface FrontendCodeDao {
    
    public List<FrontendCode> getAll(CodeGroup snippetGroup);
    public FrontendCode getById(int id);
    public void add(FrontendCode frontendSnippet);
    public void delete(FrontendCode frontendSnippet);
    public void update(FrontendCode frontendSnippet);
}
