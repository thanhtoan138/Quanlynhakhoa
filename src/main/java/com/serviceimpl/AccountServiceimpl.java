/**
 * 
 */
package com.serviceimpl;

import java.util.List;

import javax.validation.ConstraintViolationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DAOimpl.AccountDAOimpl;
import com.model.Account;
import com.service.ISERVICE;

/**
 * @author Huynh Tan Dat last on 15-06-2020 11:28:20
 *
 * 
 */
@Service
public class AccountServiceimpl implements ISERVICE<Account> {
	@Autowired
	AccountDAOimpl dao;

	public List<Account> getAll() {
		return dao.findAll();
	}

	@Override
	public Account get(Long id) throws Exception {
		return dao.findById(id);
	}

	@Override
	public Account create(Account entity) throws Exception {
		try {
			return dao.create(entity);
		} catch (ConstraintViolationException e) {
			throw new Exception("Username đã có người sử dụng");
		}

	}

	@Override
	public void update(Account entity) throws Exception {
		try {
			dao.update(entity);
		} catch (ConstraintViolationException e) {
			throw new Exception("Username đã có người sử dụng");
		}
	}

	@Override
	public Account delete(Long id) throws Exception {
		return dao.delete(id);
	}

	public Account login(String username, String password) throws Exception {
		Account entity = dao.getByUserName_Password(username, password);
		if (entity != null) {
			return entity;
		} else {
			throw new Exception("Tài khoản này không tồn tại");
		}
	}
}
