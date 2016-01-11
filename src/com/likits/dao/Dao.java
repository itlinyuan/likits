package com.likits.dao;

import java.io.Serializable;
import java.util.List;

public interface Dao<T, PK extends Serializable> {

  // Save object into database
  public abstract void save(T entity);

  // Update object
  public abstract void update(T entity);

  // Delete object
  public abstract void delete(T entity);

  // Save or update object
  public abstract void saveOrUpdate(T entity);

  public abstract T findById(PK id);

  public abstract List<T> findAll();

  public abstract void refresh(T entity);

}