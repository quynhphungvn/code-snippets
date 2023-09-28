package quynh.java.webapp.codesnippet.service.impl;

import java.util.List;

import quynh.java.webapp.codesnippet.dao.CodeGroupDao;
import quynh.java.webapp.codesnippet.dao.CodeSnippetDao;
import quynh.java.webapp.codesnippet.dao.hql_impl.CodeGroupDaoImpl;
import quynh.java.webapp.codesnippet.dao.hql_impl.CodeSnippetDaoImpl;
import quynh.java.webapp.codesnippet.model.CodeGroup;
import quynh.java.webapp.codesnippet.model.CodeSnippet;
import quynh.java.webapp.codesnippet.service.CodeSnippetService;

public class CodeSnippetServiceImpl implements CodeSnippetService {
    private CodeGroupDao codeGroupDao = new CodeGroupDaoImpl();
    private CodeSnippetDao codeSnippetDao = new CodeSnippetDaoImpl();
    
    @Override
    public List<CodeSnippet> getAll(CodeGroup codeGroup) {
        return codeSnippetDao.getAll(codeGroup);
    }
    @Override
    public List<CodeSnippet> getAll(int groupId) {
        CodeGroup codeGroup = codeGroupDao.getById(groupId);
        return codeSnippetDao.getAll(codeGroup);
    }

    @Override
    public CodeSnippet getById(int id) {
        return codeSnippetDao.getById(id);
    }

  
    @Override
    public CodeSnippet delete(int id) {
        CodeSnippet cs = codeSnippetDao.getById(id);
        if (cs != null) {
            codeSnippetDao.delete(cs);
            CodeGroup codeGroup = cs.getCodeGroup();
            codeGroup.setItemCount(codeGroup.getItemCount() - 1);
            codeGroupDao.update(codeGroup);
        }
        return cs;
    }

    @Override
    public CodeSnippet updateContent(int id, String content, String syntax, String relevantInfo, String comment) {
        CodeSnippet cs = codeSnippetDao.getById(id);
        if (cs != null) {
        	cs.setContent(content);
        	cs.setSyntax(syntax);
        	cs.setRelevantInfo(relevantInfo);
            cs.setComment(comment);
            codeSnippetDao.update(cs);
        }
        return cs;
    }

    @Override
    public CodeSnippet updateName(int id, String newName) {
        CodeSnippet cs = codeSnippetDao.getById(id);
        if (cs != null) {
            cs.setName(newName);
            codeSnippetDao.update(cs);
        }
        return cs;
    }

    @Override
    public CodeSnippet add(String name, String content, int groupId) {
        CodeGroup codeGroup = codeGroupDao.getById(groupId);
        CodeSnippet cs = new CodeSnippet();
        cs.setName(name);
        cs.setContent(content);
        cs.setCodeGroup(codeGroup);
        codeSnippetDao.add(cs);
        codeGroup.setItemCount(codeGroup.getItemCount() + 1);
        codeGroupDao.update(codeGroup);
        return cs;
    }

}
