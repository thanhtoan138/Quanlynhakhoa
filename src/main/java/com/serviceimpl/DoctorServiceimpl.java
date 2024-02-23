/**
 * 
 */
package com.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DAOimpl.DoctorDAOimpl;
import com.model.Doctor;
import com.service.ISERVICE;

/**
 * @author Huynh Tan Dat last on 03-07-2020 09:44:30

 *
 */
@Service
public class DoctorServiceimpl implements ISERVICE<Doctor>{
	@Autowired
	DoctorDAOimpl dao;

	public List<Doctor> getAll() {
		return dao.findAll();
	}

	@Override
	public Doctor get(Long id) throws Exception {
		return dao.findById(id);
	}

	@Override
	public Doctor create(Doctor entity) throws Exception {
		return dao.create(entity);
	}

	@Override
	public void update(Doctor entity) throws Exception {
		dao.update(entity);
	}

	@Override
	public Doctor delete(Long id) throws Exception {
		return dao.delete(id);
	}
}
