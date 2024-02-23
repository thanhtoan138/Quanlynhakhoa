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
import com.model.Role;

/**
 * @author Huynh Tan Dat last on 26-06-2020 19:35:31

 *
 */
@Transactional
@Repository
public class RoleDAOimpl implements IDAO<Role>{

	@Autowired
	SessionFactory factory;
	
	@Override
	public Role findById(Long id) {
		Session session = factory.getCurrentSession();
		return session.find(Role.class, id);
	}

	@Override
	public List<Role> findAll() {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM Role", Role.class).getResultList();
	}

	@Override
	public Role create(Role entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Role entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public Role delete(Long id) {
		Session session = factory.getCurrentSession();
		Role entity = this.findById(id);
		session.remove(entity);
		return entity;
	}

}
