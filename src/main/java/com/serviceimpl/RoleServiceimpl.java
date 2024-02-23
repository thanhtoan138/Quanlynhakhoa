/**
 * 
 */
package com.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DAOimpl.RoleDAOimpl;
import com.model.Role;
import com.service.ISERVICE;

/**
 * @author Huynh Tan Dat last on 29-06-2020 17:07:22

 *
 */
@Service
public class RoleServiceimpl implements ISERVICE<Role>{
	@Autowired
	RoleDAOimpl dao;

	public List<Role> getAll() {
		return dao.findAll();
	}

	@Override
	public Role get(Long id) throws Exception {
		return dao.findById(id);
	}

	@Override
	public Role create(Role entity) throws Exception {
		return dao.create(entity);
	}

	@Override
	public void update(Role entity) throws Exception {
		dao.update(entity);
	}

	@Override
	public Role delete(Long id) throws Exception {
		return dao.delete(id);
	}
}
