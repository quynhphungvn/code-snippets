package quynh.java.webapp.codesnippet.service;

import java.util.List;

import quynh.java.webapp.codesnippet.model.CodeGroup;
import quynh.java.webapp.codesnippet.model.CodeSnippet;

public interface CodeSnippetService {
    public List<CodeSnippet> getAll(CodeGroup group);
    public List<CodeSnippet> getAll(int groupId);
    public CodeSnippet getById(int id);
    public CodeSnippet add(String name, String content, int groupId);
    public CodeSnippet delete(int id);
    public CodeSnippet updateContent(int id, String content, String syntax, String relevantInfo, String comment);
    public CodeSnippet updateName(int id, String name);
}
