package quynh.java.webapp.codesnippet.service.impl;

import java.util.List;

import quynh.java.webapp.codesnippet.dao.CodeGroupDao;
import quynh.java.webapp.codesnippet.dao.TechnologyDao;
import quynh.java.webapp.codesnippet.dao.hql_impl.CodeGroupDaoImpl;
import quynh.java.webapp.codesnippet.dao.hql_impl.TechnologyDaoImpl;
import quynh.java.webapp.codesnippet.model.CodeGroup;
import quynh.java.webapp.codesnippet.model.Technology;
import quynh.java.webapp.codesnippet.service.CodeGroupService;

public class CodeGroupServiceImpl implements CodeGroupService {
    private TechnologyDao technologyDao = new TechnologyDaoImpl();
    private CodeGroupDao codeGroupDao = new CodeGroupDaoImpl();
    
    @Override
    public List<CodeGroup> getAll(Technology technology) {
        return codeGroupDao.getAll(technology);
    }
    @Override
    public List<CodeGroup> getAll(int technologyId) {
        Technology technology = technologyDao.getById(technologyId);
        return codeGroupDao.getAll(technology);
    }

    @Override
    public CodeGroup getById(int id) {
        return codeGroupDao.getById(id);
    }

    @Override
    public CodeGroup add(String name, int technologyId) {
        Technology technology = technologyDao.getById(technologyId);
        CodeGroup codeGroup = new CodeGroup();
        codeGroup.setName(name);
        codeGroup.setTechnology(technology);
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
	@Override
	public CodeGroup update(CodeGroup codeGroup) {
		codeGroupDao.update(codeGroup);
		return codeGroup;
	}

}
