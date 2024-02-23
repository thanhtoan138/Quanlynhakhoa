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

/**
 * @author Huynh Tan Dat last on 15-06-2020 10:19:59
 *
 * 
 */
@Component
public class IndexInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	HttpSession session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (session.getAttribute("user")==null) {
			session.setAttribute("back-url", request.getRequestURI());
			response.sendRedirect("/login");
			return false;
		}		
		return true;
	}
}
