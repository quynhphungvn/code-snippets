package quynh.java.webapp.codesnippet.service;

import java.util.List;

import quynh.java.webapp.codesnippet.model.FrontendCode;

public interface FrontendCodeService {
    
    public List<FrontendCode> getAll(int groupId);
    public FrontendCode getById(int id);
    public FrontendCode add(String name, String description, String htmlContent, String cssContent, String jsContent, String comment, int groupId);
    public FrontendCode delete(int id);
    public FrontendCode updateSnippetContent(int id, String htmlContent, String cssContent, String jsContent, String comment);
    public FrontendCode updateSnippetInfo(int id, String name, String description);
}
