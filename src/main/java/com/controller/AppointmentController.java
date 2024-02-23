/**
 * 
 */
package com.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.DuAn2Application;
import com.model.Appointment;
import com.serviceimpl.AppointmentServiceimpl;
import com.serviceimpl.DoctorServiceimpl;
import com.serviceimpl.UserDetailServiceimlp;

/**
 * @author Huynh Tan Dat last on 03-07-2020 16:07:44
 *
 * 
 */
@Controller
@RequestMapping("/appoin/")
public class AppointmentController {
	@Autowired
	AppointmentServiceimpl service;

	@Autowired
	DoctorServiceimpl dtService;
	
	@Autowired
	UserDetailServiceimlp udService;

	@Autowired
	HttpSession session;

	@PostMapping("create")
	String create(Model model, @RequestParam("patientName") String patientName, @RequestParam("phone") String phone,
			@RequestParam("email") String email, @RequestParam("dateCome") String dateCome,
			@RequestParam("timeCome") String timeCome, @RequestParam("doctorId") Long doctorId,
			@RequestParam("symptom") String symptom) {
		try {
			Appointment entity = new Appointment();
			entity.setcreateDate();
			entity.setCreateBy(patientName);
			entity.setDateBook(LocalDateTime.now());
			entity.setDateCome(LocalDate.parse(dateCome));
			entity.setDoctor(dtService.get(doctorId));
			entity.setEmail(email);
			entity.setPatientName(patientName);
			entity.setPhone(phone);
			entity.setSymptom(symptom);
			entity.setStatus(false);
			service.create(entity);
			model.addAttribute(DuAn2Application.reportName, "Thành Công");	
			model.addAttribute("doctors", dtService.getAll());
			return "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("doctors", dtService.getAll());
			model.addAttribute(DuAn2Application.reportName, e.getMessage());	
			return "user/index";
		}
	}	
}
