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
import com.model.MedicalRecord;

/**
 * @author Huynh Tan Dat last on 03-07-2020 09:32:29

 *
 */
@Repository
@Transactional
public class MedicalRecordDAOimpl implements IDAO<MedicalRecord>{
	@Autowired
	SessionFactory factory;
	
	@Override
	public MedicalRecord findById(Long id) {
		Session session = factory.getCurrentSession();
		return session.find(MedicalRecord.class, id);
	}

	@Override
	public List<MedicalRecord> findAll() {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM MedicalRecord", MedicalRecord.class).getResultList();
	}

	@Override
	public MedicalRecord create(MedicalRecord entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(MedicalRecord entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public MedicalRecord delete(Long id) {
		Session session = factory.getCurrentSession();
		MedicalRecord entity = this.findById(id);
		session.remove(entity);
		return entity;
	}
}
