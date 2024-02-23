/**
 * 
 */
package com.DAO;

import com.model.Account;

/**
 * @author Huynh Tan Dat last on 26-06-2020 17:32:53

 *
 */
public interface IACCOUNTDAO {
	Account getByUserName_Password(String username,String password);
}
