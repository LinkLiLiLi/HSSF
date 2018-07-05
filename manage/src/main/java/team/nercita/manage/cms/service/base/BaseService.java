package team.nercita.manage.cms.service.base;

import org.springframework.beans.factory.annotation.Autowired;

/**
 * BaseService
 * @author L
 */
public class BaseService {
	@Autowired
    public BaseDao baseDao;

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
}
