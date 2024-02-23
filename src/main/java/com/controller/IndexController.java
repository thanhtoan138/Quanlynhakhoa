/**
 * 
 */
package com.controller;

import java.time.LocalDate;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.DuAn2Application;
import com.model.Account;
import com.model.EnumRole;
import com.serviceimpl.AccountServiceimpl;
import com.serviceimpl.DoctorServiceimpl;
import com.serviceimpl.ServiceServiceimpl;

/**
 * @author Huynh Tan Dat last on 15-06-2020 11:27:41
 *
 * 
 */
@Controller
@RequestMapping("/")
public class IndexController {

	@Autowired
	DoctorServiceimpl service;
	
	@Autowired
	ServiceServiceimpl svSerivice;

	@Autowired
	AccountServiceimpl Acservice;

	@Autowired
	HttpSession session;

	@GetMapping("login")
	public String loginPage() {
		return "login/login";
	}
	
	@GetMapping("logout")
	public String logout() {
		session.setAttribute("user", null);
		return "redirect:/login";
	}
	
	@GetMapping("test")
	public String test() {		
		return "admin/history_medical";
	}

	@GetMapping
	public String index(Model model) {
		try {
			model.addAttribute("doctors", service.getAll());
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
		}

		return "user/index";
	}
	
	@GetMapping("BangGia")
	String service(Model model){		
		try {
			model.addAttribute("services", svSerivice.getAll());
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
		}
		return "user/list_price";

	}

	@PostMapping("login")
	String login(Model model, @RequestParam("username") String username, @RequestParam("password") String password) {
		try {
			Account entity = Acservice.login(username, password);
			session.setAttribute("user", entity);
			session.setAttribute("today", LocalDate.now());
			model.addAttribute("list", service.getAll());
			if (entity.getRole().getRoleName().equals(EnumRole.admin.toString())) {
				return "redirect:/admin/";
			} else if (entity.getRole().getRoleName().equals(EnumRole.staff.toString())) {
				return "redirect:/staff/";
			} else if (entity.getRole().getRoleName().equals(EnumRole.doctor.toString())) {
				return "redirect:/doctor/";
			} else {
				// xem thử trong file EnumRole đã có role này chưa
				// nếu có thì đối chiếu tại hàm toString vs role_Name trong database
				throw new Exception("Không tìm thấy role này");
			}
		}
		catch (NoResultException e) {
			model.addAttribute(DuAn2Application.reportName, "User này không tồn tại");
			return "login/login";
		}
		catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return "login/login";
		}
	}
}
