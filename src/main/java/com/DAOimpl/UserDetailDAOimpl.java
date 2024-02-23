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
import com.model.UserDetail;

/**
 * @author Huynh Tan Dat last on 03-07-2020 09:32:29
 *
 * 
 */
@Transactional
@Repository
public class UserDetailDAOimpl implements IDAO<UserDetail> {
	@Autowired
	SessionFactory factory;

	@Override
	public UserDetail findById(Long id) {
		Session session = factory.getCurrentSession();
		return session.find(UserDetail.class, id);
	}

	@Override
	public List<UserDetail> findAll() {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM UserDetail", UserDetail.class).getResultList();
	}

	@Override
	public UserDetail create(UserDetail entity) throws Exception {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(UserDetail entity) throws Exception {
		Session session = factory.getCurrentSession();
		session.update(entity);

	}

	@Override
	public UserDetail delete(Long id) {
		Session session = factory.getCurrentSession();
		UserDetail entity = this.findById(id);
		session.remove(entity);
		return entity;
	}
}
