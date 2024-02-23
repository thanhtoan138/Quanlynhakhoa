/**
 * 
 */
package com.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.DAOimpl.ServiceDAOimpl;
import com.model.Service;
import com.service.ISERVICE;

/**
 * @author Huynh Tan Dat last on 03-07-2020 22:20:28

 *
 */
@org.springframework.stereotype.Service
public class ServiceServiceimpl implements ISERVICE<Service>{
	@Autowired
	ServiceDAOimpl dao;

	public List<Service> getAll() {
		return dao.findAll();
	}

	@Override
	public Service get(Long id) throws Exception {
		return dao.findById(id);
	}

	@Override
	public Service create(Service entity) throws Exception {
		return dao.create(entity);
	}

	@Override
	public void update(Service entity) throws Exception {
		dao.update(entity);
	}

	@Override
	public Service delete(Long id) throws Exception {
		return dao.delete(id);
	}
}
