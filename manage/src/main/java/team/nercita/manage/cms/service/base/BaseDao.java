/*
 * BaseDao.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年6月17日 下午2:08:06
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.base;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 *
 * @author L
 * @date 2017年6月17日 下午2:08:06
 */
public interface BaseDao {
	/**
     * 删除对象(记录)
     * 
     * @param entity 要删除的对象(记录)
     */
    public void delete(Object entity);
    
    /**
     * 保存对象(记录)信息
     * 
     * @param entity  要保存的对象(记录)
     */
    public void save(Object entity);
    
    /**
     * 修改对象(记录)
     * 
     * @param entity 要修改的对象(记录)
     */
    public void update(Object entity);
    
    /**
     * 根据对象类型和记录编号查找记录(对象)详情.
     * 不查找lazy-load属性.
     * 
     * @param objectClass 对象类型
     * @param objectID 记录编号
     * @return 要查找的对象(记录),未找到时为null
     */
    public <T> T findObject(Class<T> objectClass, Serializable objectID);
    
    /**
     * 根据传入的sql和参数查询对象.
     * 
     * @param sql 要执行的sql语句
     * @param  paramMap 参数列表, key为参数名, value为参数值
     * @return 要查找的对象(记录),未找到时为null
     */
    public <T> T findObject(String sql, Map<String, Object> paramMap);
    
    /**
     * 根据传入的sql和参数查询对象信息列表.
     * 
     * @param sql 要执行的sql语句
     * @param paramMap 参数列表, key为参数名, value为参数值
     * @return 符合条件的信息列表
     */
    public List<?> findObjectList(String sql, Map<String, Object> paramMap);
    
    /**
     * 根据传入的SQL和参数查询信息列表
     * 
     * @param sql 要执行的SQL语句
     * @param paramMap 参数列表, key为参数名, value为参数值
     * @param firstResult 起始记录, 如果小于0则从0开始
     * @param maxResult 最大记录, 此值大于-1时有效
     * @return 符合条件的信息列表
     */
    public List<?> findObjectList(String sql, Map<String, Object> paramMap, int firstResult,
        int maxResult);
    
    /**
     * 根据传入的sql和参数查询符合条件的记录数量.
     * <p />
     * 一般用于执行只有一个结果的聚合查询.
     * 
     * @param sql 要执行的sql
     * @param paramMap 参数列表, key为参数名, value为参数值
     * @return 符合条件的记录数量
     */
    public int queryObjectCount(String sql, Map<String, Object> paramMap);
    
    public List<?> findObjectSqlQuery(String sql, Map<String, Object> paramMap);
}
