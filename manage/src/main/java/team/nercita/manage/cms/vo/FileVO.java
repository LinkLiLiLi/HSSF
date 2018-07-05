/*
 * FileVO.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年11月19日 上午9:49:47
 * 创业小团队-后台
 */
package team.nercita.manage.cms.vo;

import java.util.List;

import team.nercita.manage.cms.po.project.ProjectFile;

/**
 *
 * @author L
 * @date 2017年11月19日 上午9:49:47
 */
public class FileVO {
	List<ProjectFile> fileList;

	public List<ProjectFile> getFileList() {
		return fileList;
	}

	public void setFileList(List<ProjectFile> fileList) {
		this.fileList = fileList;
	}
}
