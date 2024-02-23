package com;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.interceptor.AdminInterceptor;
import com.interceptor.DoctorInterceptor;
import com.interceptor.IndexInterceptor;
import com.interceptor.StaffInterceptor;

@Configuration
public class InterConfig implements WebMvcConfigurer {
	@Autowired
	IndexInterceptor auth;
	
	@Autowired
	AdminInterceptor adminAuth;
	
	@Autowired
	StaffInterceptor staffAuth;
	
	@Autowired
	DoctorInterceptor doctorAuth;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(auth)
			.addPathPatterns("/admin/**","/staff/**","/doctor/**");
		
		registry.addInterceptor(adminAuth)
		.addPathPatterns("/admin/**");
		
		registry.addInterceptor(staffAuth)
		.addPathPatterns("/staff/**");
		
		registry.addInterceptor(doctorAuth)
		.addPathPatterns("/doctor/**");
	}
}
