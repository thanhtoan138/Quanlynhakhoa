/**
 * 
 */
package com.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

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
import com.model.AdminPageEnum;
import com.model.Appointment;
import com.model.MedicalRecord;
import com.model.Service;
import com.serviceimpl.AppointmentServiceimpl;
import com.serviceimpl.DoctorServiceimpl;
import com.serviceimpl.MedicalRecordServiceimpl;
import com.serviceimpl.PatientServiceimpl;
import com.serviceimpl.ServiceServiceimpl;

/**
 * @author Huynh Tan Dat last on 19-07-2020 18:39:37
 *
 * 
 */
@Controller
@RequestMapping("/doctor")
public class DoctorController {

	@Autowired
	DoctorServiceimpl service;

	@Autowired
	ServiceServiceimpl svService;

	@Autowired
	AppointmentServiceimpl appoService;

	@Autowired
	MedicalRecordServiceimpl mdSerivce;

	@Autowired
	PatientServiceimpl ptService;

	@Autowired
	HttpSession session;

	List<Appointment> getpantienListByStatusAndDateWork(Boolean status, String dateWork) {
		if (dateWork.equals("")) {
			dateWork = LocalDate.now().toString();
		}
		return appoService.getByDateCome(LocalDate.parse(dateWork)).stream().filter(e -> e.getStatus() == status)
				.sorted(Comparator.comparingInt(Appointment::getStt)).collect(Collectors.toList());
	}
	
	@GetMapping()
	String kham(Model model, @RequestParam(name = "dateWork", defaultValue = "") String dateWork) {
		Account doctor = (Account) session.getAttribute("user");
		model.addAttribute("pantienList",
				this.getpantienListByStatusAndDateWork(Boolean.FALSE, dateWork).stream()
						.filter(e -> e.getPatient() != null && e.getStt() != 0 && e.getMedicalRecord() != null && e.getDoctor().getAccount().getId()==doctor.getId())
						.collect(Collectors.toList()));
		return AdminPageEnum.phieukhamPage.toString();
	}
	
	@GetMapping("services")
	String services(Model model, @RequestParam(name = "dateWork", defaultValue = "") String dateWork) {
		try {
			model.addAttribute("services", svService.getAll());
			model.addAttribute("hidden", "hidden=''");
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
		}
		return AdminPageEnum.list_dichvuPage.toString();
	}

	

	@GetMapping("MedicalRecords")
	String MedicalRecords(Model model) {
		model.addAttribute("medicalRecords", mdSerivce.getAll());
		return AdminPageEnum.list_medicalPage.toString();
	}

	@PostMapping("getMedicalRecord")
	String getMedicalRecord(Model model, @RequestParam("id") Long id,
			@RequestParam(name = "dateWork", defaultValue = "") String dateWork) {
		try {
			model.addAttribute("appoSelete", appoService.get(id));
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
		}
		model.addAttribute("services", svService.getAll());
		model.addAttribute("pantienList",
				this.getpantienListByStatusAndDateWork(Boolean.FALSE, dateWork).stream()
						.filter(e -> e.getPatient() != null && e.getStt() != 0 && e.getMedicalRecord() != null)
						.collect(Collectors.toList()));
		return AdminPageEnum.phieukhamPage.toString();
	}

	@GetMapping("historyMedical")
	String history(Model model) {
		try {
			model.addAttribute("pantienList", ptService.getAll());
			return AdminPageEnum.history_medicalPage.toString();
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return AdminPageEnum.history_medicalPage.toString();
		}
	}
	
	@PostMapping("PatientHistoryMedical")
	String history(Model model, @RequestParam("patienId") Long id, @RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate) {
		try {
			model.addAttribute("services", svService.getAll());
			model.addAttribute("pantienList", ptService.getAll());
			model.addAttribute("appos", ptService.get(id).getAppos());
			return AdminPageEnum.history_medicalPage.toString();
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return AdminPageEnum.history_medicalPage.toString();
		}
	}
	
	@PostMapping("ReadMedicalRecord")
	String getMedicalRecord(Model model, @RequestParam("id") Long id) {
		try {
			model.addAttribute("services", appoService.get(id).getMedicalRecord().getServices());
			model.addAttribute("pantienList", ptService.getAll());
			model.addAttribute("appos", appoService.get(id).getPatient().getAppos());
			model.addAttribute("appoSelete", appoService.get(id));
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
		}
		return AdminPageEnum.history_medicalPage.toString();
	}

	@PostMapping("updateMedicalRecord")
	String updateMedicalRecord(Model model, @RequestParam("id") Long id, @RequestParam("fullname") String fullname,
			@RequestParam("examinationDate") String examinationDate,
			@RequestParam("reExaminationDate") String reExaminationDate, @RequestParam("diagnose") String diagnose,
			@RequestParam("doctorId") Long doctorId, @RequestParam("serviceIds") List<Long> serviceIds,
			@RequestParam(name = "dateWork", defaultValue = "") String dateWork) {
		try {
			Account user = (Account) session.getAttribute("user");	
			List<Service> services = new ArrayList<Service>();
			Appointment appo = appoService.get(id);
			MedicalRecord entity = appo.getMedicalRecord();
			entity.setcreateDate();
			entity.setExaminationDate(LocalDateTime.parse(examinationDate));
			entity.setReExaminationDate(LocalDateTime.parse(reExaminationDate).toLocalDate());
			entity.setDoctor(service.get(doctorId));
			entity.setCreateBy(user.getUsername());
			for (Long svid : serviceIds) {
				services.add(svService.get(svid));
			}
			entity.setServices(services);
			mdSerivce.update(entity);
			appo.setStatus(true);
			appoService.update(appo);
			return "redirect:/doctor/";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return AdminPageEnum.phieukhamPage.toString();
		}
	}

	@GetMapping("deleteMedicalRecord")
	String deleteMedicalRecord(Model model, @RequestParam("id") Long id,
			@RequestParam(name = "dateWork", defaultValue = "") String dateWork) {
		try {
			mdSerivce.delete(id);
			model.addAttribute("pantienList", this.getpantienListByStatusAndDateWork(Boolean.FALSE, dateWork));
			model.addAttribute("appoSelete", null);
			return AdminPageEnum.phieukhamPage.toString();
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return AdminPageEnum.phieukhamPage.toString();
		}

	}

}
