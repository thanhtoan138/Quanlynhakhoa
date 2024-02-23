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
import com.model.Appointment;

/**
 * @author Huynh Tan Dat last on 03-07-2020 09:29:53

 *
 */
@Transactional
@Repository
public class AppointmentDAOimpl implements IDAO<Appointment>{
	@Autowired
	SessionFactory factory;
	
	@Override
	public Appointment findById(Long id) {
		Session session = factory.getCurrentSession();
		return session.find(Appointment.class, id);
	}

	@Override
	public List<Appointment> findAll() {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM Appointment", Appointment.class).getResultList();
	}

	@Override
	public Appointment create(Appointment entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Appointment entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public Appointment delete(Long id) {
		Session session = factory.getCurrentSession();
		Appointment entity = this.findById(id);
		session.remove(entity);
		return entity;
	}
}
