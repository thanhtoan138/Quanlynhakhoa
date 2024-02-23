/**
 * 
 */
package com.DAOimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DAO.IDAO;
import com.model.Doctor;

/**
 * @author Huynh Tan Dat last on 03-07-2020 09:29:53

 *
 */
@Transactional
@Repository
public class DoctorDAOimpl implements IDAO<Doctor>{
	@Autowired
	SessionFactory factory;
	
	@Override
	public Doctor findById(Long id) {
		Session session = factory.getCurrentSession();
		return session.find(Doctor.class, id);
	}

	@Override
	public List<Doctor> findAll() {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM Doctor", Doctor.class).getResultList();
	}

	@Override
	public Doctor create(Doctor entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Doctor entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public Doctor delete(Long id) {
		Session session = factory.getCurrentSession();
		Doctor entity = this.findById(id);
		session.remove(entity);
		return entity;
	}
}
