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
import com.model.Bill;

/**
 * @author Huynh Tan Dat last on 15-06-2020 11:27:57

 *
 */
@Transactional
@Repository
public class BillDAOimpl implements IDAO<Bill>{
	@Autowired
	SessionFactory factory;
	
	@Override
	public Bill findById(Long id) {
		Session session = factory.getCurrentSession();
		return session.find(Bill.class, id);
	}

	@Override
	public List<Bill> findAll() {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM Bill", Bill.class).getResultList();
	}

	@Override
	public Bill create(Bill entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Bill entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public Bill delete(Long id) {
		Session session = factory.getCurrentSession();
		Bill entity = this.findById(id);
		session.remove(entity);
		return entity;
	}
}
