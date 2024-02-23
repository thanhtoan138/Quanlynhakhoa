/**
 * 
 */
package com.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DAOimpl.MedicalRecordDAOimpl;
import com.model.MedicalRecord;
import com.service.ISERVICE;

/**
 * @author Huynh Tan Dat last on 03-07-2020 22:18:34
 *
 * 
 */
@Service
public class MedicalRecordServiceimpl implements ISERVICE<MedicalRecord> {
	@Autowired
	MedicalRecordDAOimpl dao;

	public List<MedicalRecord> getAll() {
		return dao.findAll();
	}

	@Override
	public MedicalRecord get(Long id) throws Exception {
		return dao.findById(id);
	}

	@Override
	public MedicalRecord create(MedicalRecord entity) throws Exception {
		return dao.create(entity);
	}

	@Override
	public void update(MedicalRecord entity) throws Exception {
		dao.update(entity);
	}

	@Override
	public MedicalRecord delete(Long id) throws Exception {
		return dao.delete(id);
	}
}
