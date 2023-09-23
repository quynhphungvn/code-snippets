package quynh.java.webapp.codesnippet.service.impl;

import java.util.List;

import quynh.java.webapp.codesnippet.dao.CodeGroupDao;
import quynh.java.webapp.codesnippet.dao.TechSubjectDao;
import quynh.java.webapp.codesnippet.dao.hql_impl.CodeGroupDaoImpl;
import quynh.java.webapp.codesnippet.dao.hql_impl.TechSubjectDaoImpl;
import quynh.java.webapp.codesnippet.model.CodeGroup;
import quynh.java.webapp.codesnippet.model.TechSubject;
import quynh.java.webapp.codesnippet.service.CodeGroupService;

public class CodeGroupServiceImpl implements CodeGroupService {
    private TechSubjectDao techSubjectDao = new TechSubjectDaoImpl();
    private CodeGroupDao codeGroupDao = new CodeGroupDaoImpl();
    
    @Override
    public List<CodeGroup> getAll(int techSubjectId) {
        TechSubject techSubject = techSubjectDao.getById(techSubjectId);
        return codeGroupDao.getAll(techSubject);
    }

    @Override
    public CodeGroup getById(int id) {
        return codeGroupDao.getById(id);
    }

    @Override
    public CodeGroup add(String name, int techSubjectId) {
        TechSubject techSubject = techSubjectDao.getById(techSubjectId);
        CodeGroup codeGroup = new CodeGroup();
        codeGroup.setName(name);
        codeGroup.setTechSubject(techSubject);
        codeGroupDao.add(codeGroup);
        return codeGroup;
    }

    @Override
    public CodeGroup delete(int id) {
        CodeGroup codeGroup = codeGroupDao.getById(id);
        if (codeGroup != null)
            codeGroupDao.delete(codeGroup);
        return codeGroup;
    }

    @Override
    public CodeGroup updateName(int id, String newName) {
        CodeGroup codeGroup = codeGroupDao.getById(id);
        codeGroup.setName(newName);
        codeGroupDao.update(codeGroup);
        return codeGroup;
    }

}
