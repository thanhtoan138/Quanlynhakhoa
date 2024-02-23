/**
 * 
 */
package com.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DAOimpl.PatientDAOimpl;
import com.model.Patient;
import com.service.ISERVICE;

/**
 * @author Huynh Tan Dat last on 03-07-2020 22:19:25
 *
 * 
 */
@Service
public class PatientServiceimpl implements ISERVICE<Patient> {
	@Autowired
	PatientDAOimpl dao;

	public List<Patient> getAll() {
		return dao.findAll();	
	}

	@Override
	public Patient get(Long id) throws Exception {
		return dao.findById(id);
	}

	@Override
	public Patient create(Patient entity) throws Exception {
		return dao.create(entity);
	}

	@Override
	public void update(Patient entity) throws Exception {
		dao.update(entity);
	}

	@Override
	public Patient delete(Long id) throws Exception {
		return dao.delete(id);
	}
}
