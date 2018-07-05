/*
 * AttendanceStatService.java
 * 创建者：L
 * 创建日期：2018年1月9日 下午5:31:15
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.quartz;

import team.nercita.manage.cms.service.stat.StatService;

/**
 * 
 * @author L 
 * @date： 2018年1月9日 下午5:31:15
 */
public class AttendanceStatTask {
	private StatService statService;

	public void execute() {
		statService.doTransSaveStat();
	}

	public StatService getStatService() {
		return statService;
	}

	public void setStatService(StatService statService) {
		this.statService = statService;
	}

}
