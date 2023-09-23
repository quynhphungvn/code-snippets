package quynh.java.webapp.codesnippet.service.impl;

import java.util.List;

import quynh.java.webapp.codesnippet.dao.CodeGroupDao;
import quynh.java.webapp.codesnippet.dao.FrontendCodeDao;
import quynh.java.webapp.codesnippet.dao.hql_impl.CodeGroupDaoImpl;
import quynh.java.webapp.codesnippet.dao.hql_impl.FrontendCodeDaoImpl;
import quynh.java.webapp.codesnippet.model.CodeGroup;
import quynh.java.webapp.codesnippet.model.FrontendCode;
import quynh.java.webapp.codesnippet.service.FrontendCodeService;

public class FrontendCodeServiceImpl implements FrontendCodeService {
    private CodeGroupDao codeGroupDao = new CodeGroupDaoImpl();
    private FrontendCodeDao frontendCodeDao = new FrontendCodeDaoImpl();
    @Override
    public List<FrontendCode> getAll(int groupId) {
        CodeGroup codeGroup = codeGroupDao.getById(groupId);
        return frontendCodeDao.getAll(codeGroup);
    }

    @Override
    public FrontendCode getById(int id) {
        return frontendCodeDao.getById(id);
    }

  
    @Override
    public FrontendCode delete(int id) {
        FrontendCode fc = frontendCodeDao.getById(id);
        if (fc != null) {
            frontendCodeDao.delete(fc);
            CodeGroup codeGroup = fc.getCodeGroup();
            codeGroup.setItemCount(codeGroup.getItemCount() - 1);
            codeGroupDao.update(codeGroup);
        }
        return fc;
    }

    @Override
    public FrontendCode updateSnippetContent(int id, String htmlContent, String cssContent, String jsContent,
            String comment) {
        FrontendCode fc = frontendCodeDao.getById(id);
        if (fc != null) {
            fc.setHtmlContent(htmlContent);
            fc.setCssContent(cssContent);
            fc.setJsContent(jsContent);
            fc.setComment(comment);
            frontendCodeDao.update(fc);
        }
        return fc;
    }

    @Override
    public FrontendCode updateSnippetInfo(int id, String name, String description) {
        FrontendCode fc = frontendCodeDao.getById(id);
        if (fc != null) {
            fc.setName(name);
            fc.setDescription(description);
            frontendCodeDao.update(fc);
        }
        return fc;
    }

    @Override
    public FrontendCode add(String name, String description, String htmlContent, String cssContent, String jsContent,
            String comment, int groupId) {
        CodeGroup codeGroup = codeGroupDao.getById(groupId);
        FrontendCode fc = new FrontendCode();
        fc.setName(name);
        fc.setDescription(description);
        fc.setHtmlContent(htmlContent);
        fc.setCssContent(cssContent);
        fc.setJsContent(jsContent);
        fc.setComment(comment);
        fc.setCodeGroup(codeGroup);
        frontendCodeDao.add(fc);
        codeGroup.setItemCount(codeGroup.getItemCount() + 1);
        codeGroupDao.update(codeGroup);
        return fc;
    }

}
