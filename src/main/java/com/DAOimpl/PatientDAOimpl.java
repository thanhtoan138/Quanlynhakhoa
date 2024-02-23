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
import com.model.Patient;

/**
 * @author Huynh Tan Dat last on 03-07-2020 09:32:29

 *
 */
@Repository
@Transactional
public class PatientDAOimpl implements IDAO<Patient>{
	@Autowired
	SessionFactory factory;
	
	@Override
	public Patient findById(Long id) {
		Session session = factory.getCurrentSession();
		return session.find(Patient.class, id);
	}

	@Override
	public List<Patient> findAll() {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM Patient", Patient.class).getResultList();
	}

	@Override
	public Patient create(Patient entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Patient entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public Patient delete(Long id) {
		Session session = factory.getCurrentSession();
		Patient entity = this.findById(id);
		session.remove(entity);
		return entity;
	}
}
