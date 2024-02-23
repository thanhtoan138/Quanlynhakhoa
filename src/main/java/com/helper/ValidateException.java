/**
 * 
 */
package com.helper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.serviceimpl.UserDetailServiceimlp;

/**
 * @author Huynh Tan Dat last on 26-07-2020 22:10:17

 *
 */
@Component
public class ValidateException {
	
	@Autowired
	UserDetailServiceimlp service;
	
	public void phoneUserDetail(String phone) throws Exception {
		try {
			if (!service.getEntityByPhoneNumBer(phone).getPhone().isEmpty()) {
				throw new Exception("Số diện thoại không được trùng");
			}
		} catch (NullPointerException e) {
			
		}
		
	}
}
