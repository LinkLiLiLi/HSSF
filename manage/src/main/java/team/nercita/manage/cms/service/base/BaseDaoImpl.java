/*
 * BaseDaoImpl.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年6月17日 下午2:14:12
 * 创业小团队-后台
 */
package team.nercita.manage.cms.service.base;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

/**
 *
 * @author L
 * @date 2017年6月17日 下午2:14:12
 */
public class BaseDaoImpl implements BaseDao {
	
    private SessionFactory sessionFactory;
    
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void delete(Object entity) {
		sessionFactory.getCurrentSession().delete(entity);

	}

	@Override
	public void save(Object entity) {
		try {
			Method method = entity.getClass().getMethod("setCreator", String.class);
			method.invoke(entity, "api");
			method = entity.getClass().getMethod("setCreateTime", Date.class);
			method.invoke(entity, new Date());
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		sessionFactory.getCurrentSession().save(entity);
	}

	@Override
	public void update(Object entity) {
		try {
			Method method = entity.getClass().getMethod("setModifier", String.class);
			method.invoke(entity, "api");
			
			method = entity.getClass().getMethod("setModifyTime", Date.class);
			method.invoke(entity, new Date());
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		sessionFactory.getCurrentSession().update(entity);
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> T findObject(Class<T> objectClass, Serializable objectID) {
		return (T) sessionFactory.getCurrentSession().get(objectClass, objectID);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public <T> T findObject(String sql, Map<String, Object> paramMap) {
		List<?> list = findObjectList(sql, paramMap);
		if (list == null || list.isEmpty())
			return null;
		else
			return (T) list.get(0);
	}
	
	@Override
	public List<?> findObjectList(String sql, Map<String, Object> paramMap) {
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		
		if (paramMap != null) {
            Iterator<String> keySetIterator = paramMap.keySet().iterator();

            while (keySetIterator.hasNext()) {
                String paramName = keySetIterator.next();
                query.setParameter(paramName, paramMap.get(paramName));
            }
        }
		
		return query.list();
	}

	@Override
	public List<?> findObjectList(String sql, Map<String, Object> paramMap, int firstResult, int maxResult) {
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		
		if (paramMap != null) {
            Iterator<String> keySetIterator = paramMap.keySet().iterator();

            while (keySetIterator.hasNext()) {
                String paramName = keySetIterator.next();
                query.setParameter(paramName, paramMap.get(paramName));
            }
        }
		
		query.setFirstResult(firstResult < 0 ? 0 : firstResult);

        if (maxResult > -1) {
            query.setMaxResults(maxResult);
        }
        
		return query.list();
	}

	@Override
	public int queryObjectCount(String sql, Map<String, Object> paramMap) {
		Query query = sessionFactory.getCurrentSession().createQuery(sql);

		if (paramMap != null) {
            Iterator<String> keySetIterator = paramMap.keySet().iterator();

            while (keySetIterator.hasNext()) {
                String paramName = keySetIterator.next();
                query.setParameter(paramName, paramMap.get(paramName));
            }
        }
		
		return query.list() == null ? 0 : Integer.parseInt(String.valueOf(query.list().get(0)));
	}
	
	@Override
	public List<?> findObjectSqlQuery(String sql, Map<String, Object> paramMap) {
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		
		if (paramMap != null) {
            Iterator<String> keySetIterator = paramMap.keySet().iterator();

            while (keySetIterator.hasNext()) {
                String paramName = keySetIterator.next();
                query.setParameter(paramName, paramMap.get(paramName));
            }
        }
		
		return query.list();
	}
	
}
