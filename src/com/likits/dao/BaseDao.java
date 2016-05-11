package com.likits.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

public abstract class BaseDao<T, PK extends Serializable> extends
    HibernateDaoSupport implements Dao<T, PK> {
  // protected SessionFactory sessionFactory;
  private Class<T> entityClass;

  @SuppressWarnings("unchecked")
  public BaseDao() {
    //Get Class of Object
    this.entityClass = (Class<T>) ((ParameterizedType) getClass()
        .getGenericSuperclass()).getActualTypeArguments()[0];
  }

  // Save object into database
  public void save(T entity) {
    getHibernateTemplate().save(entity);
  }

  // Update object
  public void update(T entity) {
    getHibernateTemplate().update(entity);
  }

  // Delete object
  public void delete(T entity) {
    getHibernateTemplate().delete(entity);
  }

  // Save or update object
  public void saveOrUpdate(T entity) {
    getHibernateTemplate().saveOrUpdate(entity);
  }
  
  public T findById(PK id) {
    return (T) getHibernateTemplate().get(entityClass, id);
  }
  
  
  //Return all persistent instances of the given entity class.
  public List<T> findAll(){
    return getHibernateTemplate().loadAll(entityClass);
  }
  
  @SuppressWarnings("unchecked")
  public List<T> find(String queryString){
    return (List<T>) getHibernateTemplate().find(queryString);
  }
  
  @SuppressWarnings("unchecked")
  public List<T> find(String queryString, Object[] values){
    return (List<T>) getHibernateTemplate().find(queryString,values);
  }
  
  public void refresh(T entity){
	getHibernateTemplate().refresh(entity);
  }
  
  @SuppressWarnings("unchecked")
  public int count(String queryString) {
	  List<Integer> counts = (List<Integer>)getHibernateTemplate().find(queryString);
	  return counts.get(0);
  }
  
  public List<T> findBylimit(String queryString, int limit) {
	  int defaultmaxResults = getHibernateTemplate().getMaxResults();  
	  getHibernateTemplate().setMaxResults(limit);  
	  List<T> result = (List<T>) getHibernateTemplate().find(queryString);
	  getHibernateTemplate().setMaxResults(defaultmaxResults);
	  return result;
  }
}
