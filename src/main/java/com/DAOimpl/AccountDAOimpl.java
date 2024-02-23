/**
 * 
 */
package com.DAOimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.DAO.IACCOUNTDAO;
import com.DAO.IDAO;
import com.model.Account;

/**
 * @author Huynh Tan Dat last on 15-06-2020 11:27:57

 *
 */
@Transactional
@Repository
public class AccountDAOimpl implements IDAO<Account>, IACCOUNTDAO{
	@Autowired
	SessionFactory factory;
	
	@Override
	public Account findById(Long id) {
		Session session = factory.getCurrentSession();
		return session.find(Account.class, id);
	}

	@Override
	public List<Account> findAll() {
		Session session = factory.getCurrentSession();
		return session.createQuery("FROM Account", Account.class).getResultList();
	}

	@Override
	public Account create(Account entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Account entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public Account delete(Long id) {
		Session session = factory.getCurrentSession();
		Account entity = this.findById(id);
		session.remove(entity);
		return entity;
	}

	@Override
	public Account getByUserName_Password(String username,String password) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Account WHERE username = :user and password = :pass";
		return session.createQuery(hql, Account.class).setParameter("user", username).setParameter("pass", password).getSingleResult();
	}
}
