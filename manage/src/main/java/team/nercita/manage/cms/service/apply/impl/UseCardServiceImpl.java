/*
 * UseCardServiceImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年8月6日 下午12:15:55
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.apply.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import team.nercita.manage.cms.po.form.ApplyUseCar;
import team.nercita.manage.cms.service.apply.UseCardService;
import team.nercita.manage.cms.service.base.BaseService;
import team.nercita.manage.cms.util.Generator;
import team.nercita.manage.cms.util.Page;

/**
 *
 * @author L
 * @date 2017年8月6日 下午12:15:55
 */
@Component
public class UseCardServiceImpl extends BaseService implements UseCardService {

	@Override
	public Map<String, Object> doJoinTransFindUseCarList(Integer goPage, Map<String, Object> paramMap) {
		String userName = MapUtils.getString(paramMap, "userName");
		
		String sql = "select a from ApplyUseCar a left join fetch a.user where 1=1 ";
		String countSql = "select count(a) from ApplyUseCar a where 1=1";
		
		Map<String, Object> queryMap = new HashMap<String, Object>();
		
		if(StringUtils.isNotBlank(userName)){
			sql += " and a.user.name like :USERNAME";
			countSql += " and a.user.name like :USERNAME";
			queryMap.put("USERNAME", "%" + userName + "%");
		}
		
		sql += " order by a.createTime desc";
		
		paramMap.clear();
		paramMap.put("page", new Page(baseDao.queryObjectCount(countSql, queryMap), goPage));
		paramMap.put("usecarList", baseDao.findObjectList(sql, queryMap, Page.getStartIndex(goPage), Page.getMaxResult()));
		return paramMap;
	}

	@Override
	public void doTransSaveUseCar(ApplyUseCar applyUseCar) {
		applyUseCar.setId(Generator.getUUID());

		baseDao.save(applyUseCar);
	}

	@Override
	public ApplyUseCar doJoinTransFindApplyUseCar(String id) {
		ApplyUseCar applyUseCar = baseDao.findObject(ApplyUseCar.class, id);
		applyUseCar.getUser().getName();
		return applyUseCar;
	}

	@Override
	public void doTransUpdateApplyUseCar(ApplyUseCar applyUseCar) {
		ApplyUseCar oldApplyUseCar = baseDao.findObject(ApplyUseCar.class, applyUseCar.getId());
		
		oldApplyUseCar.setApplyDept(applyUseCar.getApplyDept());
		oldApplyUseCar.setApplyTime(applyUseCar.getApplyTime());
		oldApplyUseCar.setSpecialInfo(applyUseCar.getSpecialInfo());
		oldApplyUseCar.setReason(applyUseCar.getReason());
		oldApplyUseCar.setDestination(applyUseCar.getDestination());
		oldApplyUseCar.setCarNumber(applyUseCar.getCarNumber());
		oldApplyUseCar.setExceptionRecord(applyUseCar.getExceptionRecord());
		oldApplyUseCar.setBeginTime(applyUseCar.getBeginTime());
		oldApplyUseCar.setEndTime(applyUseCar.getEndTime());
		oldApplyUseCar.setStopCarPrice(applyUseCar.getStopCarPrice());
		oldApplyUseCar.setDriver(applyUseCar.getDriver());
		
		baseDao.update(oldApplyUseCar);
		
	}

}
