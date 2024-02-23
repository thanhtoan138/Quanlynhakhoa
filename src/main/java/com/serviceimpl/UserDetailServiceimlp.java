/**
 * 
 */
package com.serviceimpl;

import java.util.List;
import java.util.NoSuchElementException;

import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DAOimpl.UserDetailDAOimpl;
import com.model.UserDetail;
import com.service.ISERVICE;

/**
 * @author Huynh Tan Dat last on 03-07-2020 22:17:46
 *
 * 
 */
@Service
public class UserDetailServiceimlp implements ISERVICE<UserDetail> {
	@Autowired
	UserDetailDAOimpl dao;

	public List<UserDetail> getAll() {
		return dao.findAll();
	}

	@Override
	public UserDetail get(Long id) throws Exception {
		return dao.findById(id);
	}

	@Override
	public UserDetail create(UserDetail entity) throws Exception {
		try {
			return dao.create(entity);
		} catch (ConstraintViolationException e) {
			throw new Exception("Đã có bệnh nhân dùng số điện thoại này");
		}
	}

	@Override
	public void update(UserDetail entity) throws Exception {
		try {
			dao.update(entity);
		} catch (ConstraintViolationException e) {
			throw new Exception("Đã có bệnh nhân dùng số điện thoại này");
		}
	}

	@Override
	public UserDetail delete(Long id) throws Exception {
		return dao.delete(id);
	}

	public UserDetail getEntityByPhoneNumBer(String phone) {
		try {
			return dao.findAll().stream().filter(e -> e.getPhone().equals(phone)).findFirst().get();
		} catch (NullPointerException e2) {
			return null;
		}
		catch (NoSuchElementException e2) {
			return null;
		}
	}
}
