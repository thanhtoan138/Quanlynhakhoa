/**
 * 
 */
package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.model.Account;
import com.model.EnumRole;

/**
 * @author Huynh Tan Dat last on 19-08-2020 13:55:20
 *
 * 
 */
@Component
public class DoctorInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	HttpSession session;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (session.getAttribute("user") != null) {
			Account entity = (Account) session.getAttribute("user");
			session.setAttribute("back-url", request.getRequestURI());
			if (EnumRole.doctor.toString().equals(entity.getRole().getRoleName())) {
				return true;
			}
		}
		response.sendRedirect("/login");
		return false;
	}
}
