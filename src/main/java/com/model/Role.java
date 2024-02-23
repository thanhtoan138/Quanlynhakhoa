/**
 * 
 */
package com.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author Huynh Tan Dat last on 29-06-2020 16:16:35

 *
 */
@Entity
@Table(name = "roles")
public class Role extends SuperModel{
	@Column(name = "role_name")
	private String roleName;
	
	@OneToMany(mappedBy = "role")
	private transient List<Account> listAccount;

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public List<Account> getListAccount() {
		return listAccount;
	}

	public void setListAccount(List<Account> listAccount) {
		this.listAccount = listAccount;
	}
	
	
}
