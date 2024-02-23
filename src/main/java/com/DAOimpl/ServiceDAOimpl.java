/**
 * 
 */
package com.DAOimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.DAO.IDAO;
import com.model.Service;

/**
 * @author Huynh Tan Dat last on 03-07-2020 09:32:29

 *
 */
@Repository
@Transactional
public class ServiceDAOimpl implements IDAO<Service>{
	@Autowired
	SessionFactory factory;
	
	@Override
	public Service findById(Long id) {
		Session session = factory.getCurrentSession();
		return session.find(Service.class, id);
	}

	@Override
	public List<Service> findAll() {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM Service", Service.class).getResultList();
	}

	@Override
	public Service create(Service entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Service entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public Service delete(Long id) {
		Session session = factory.getCurrentSession();
		Service entity = this.findById(id);
		session.remove(entity);
		return entity;
	}
}
