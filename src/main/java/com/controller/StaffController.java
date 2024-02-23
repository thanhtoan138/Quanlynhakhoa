/**
 * 
 */
package com.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.DuAn2Application;
import com.helper.helpers;
import com.model.Account;
import com.model.AdminPageEnum;
import com.model.Appointment;
import com.model.Bill;
import com.model.MedicalRecord;
import com.model.Patient;
import com.model.Service;
import com.model.UserDetail;
import com.serviceimpl.AppointmentServiceimpl;
import com.serviceimpl.BillServiceimpl;
import com.serviceimpl.DoctorServiceimpl;
import com.serviceimpl.MedicalRecordServiceimpl;
import com.serviceimpl.PatientServiceimpl;
import com.serviceimpl.ServiceServiceimpl;
import com.serviceimpl.UserDetailServiceimlp;

/**
 * @author Huynh Tan Dat last on 08-07-2020 09:09:17
 *
 * 
 */
@Controller
@RequestMapping("/staff")
public class StaffController {

	@Autowired
	AppointmentServiceimpl service;

	@Autowired
	DoctorServiceimpl dtService;

	@Autowired
	ServiceServiceimpl svService;

	@Autowired
	PatientServiceimpl ptService;

	@Autowired
	UserDetailServiceimlp udService;

	@Autowired
	MedicalRecordServiceimpl mdSerivce;

	@Autowired
	BillServiceimpl billSerivce;

	@Autowired
	HttpSession session;

	@GetMapping
	String index(Model model, @RequestParam(name = "dateWork", defaultValue = "") String dateWork) {
		session.setAttribute("role", 1);
		List<Appointment> list = service.getpantienListByStatusAndDateWork(Boolean.FALSE, dateWork);
		List<Appointment> apposHaveData = list.stream()
				.filter(e -> e.getPatient() != null && e.getStt() == 0 && e.getMedicalRecord() == null)
				.collect(Collectors.toList());
		List<Appointment> appoHaveMR = list.stream()
				.filter(e -> e.getPatient() != null && e.getStt() != 0 && e.getMedicalRecord() != null)
				.collect(Collectors.toList());
		List<Appointment> apposNotHaveData = list.stream().filter(e -> e.getPatient() == null)
				.collect(Collectors.toList());
		List<Appointment> apposGetBill = service.getpantienListByStatusAndDateWork(Boolean.TRUE, dateWork).stream()
				.filter(e -> e.getPatient() != null && e.getStt() != 0 && e.getMedicalRecord() != null && e.getMedicalRecord().getBill()==null)
				.collect(Collectors.toList());
		model.addAttribute("appoHaveSTT", appoHaveMR);
		model.addAttribute("appos", apposNotHaveData);
		model.addAttribute("apposHaveData", apposHaveData);
		model.addAttribute("apposGetBill", apposGetBill);
		return AdminPageEnum.staffPage.toString();
	}

	@GetMapping("services")
	String services(Model model, @RequestParam(name = "dateWork", defaultValue = "") String dateWork) {
		try {
			model.addAttribute("services", svService.getAll());
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
		}
		return AdminPageEnum.list_dichvuPage.toString();
	}

	@PostMapping("createService")
	String createService(Model model, @RequestParam("price") Double price,
			@RequestParam("serviceName") String serviceName, @RequestParam("unit") String unit) {
		try {
			Account user = (Account) session.getAttribute("user");
			Service service = new Service();
			service.setPrice(price);
			service.setServiceName(serviceName);
			service.setUnit(unit);
			service.setCreateBy(user.getUsername());
			service.setcreateDate();
			svService.create(service);
			return "redirect:/staff/services";
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return services(model, "");
		}
	}

	@PostMapping("updateService")
	String updateService(Model model, @RequestParam("id") Long id, @RequestParam("price") Double price,
			@RequestParam("serviceName") String serviceName, @RequestParam("unit") String unit) {
		try {
			Account user = (Account) session.getAttribute("user");
			Service service = svService.get(id);
			service.setPrice(price);
			service.setServiceName(serviceName);
			service.setUnit(unit);
			service.setCreateBy(user.getUsername());
			service.setcreateDate();
			svService.update(service);
			return "redirect:/staff/services";
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return services(model, "");
		}
	}

	@PostMapping("deleteService")
	String deleteService(Model model, @RequestParam("price") Long id) {
		try {
			svService.delete(id);
			return "redirect:/staff/services";
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return services(model, "");
		}
	}

	@GetMapping("appos")
	String appos(Model model, @RequestParam(name = "dateWork", defaultValue = "") String dateWork) {
		try {
			model.addAttribute("appos", service.getAll());
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
		}
		return AdminPageEnum.staffPage.toString();
	}

	@PostMapping("createAppos")
	String createAppos(Model model, @RequestParam("patientName") String patientName,
			@RequestParam("phone") String phone, @RequestParam("email") String email,
			@RequestParam("dateCome") String dateCome, @RequestParam("timeCome") String timeCome,
			@RequestParam("doctorId") Long doctorId, @RequestParam("symptom") String symptom) {
		try {
			Account user = (Account) session.getAttribute("user");
			Appointment entity = new Appointment();
			entity.setcreateDate();
			entity.setCreateBy(user.getUsername());
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
			return "redirect:/staff/";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("doctors", dtService.getAll());
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return AdminPageEnum.staffPage.toString();
		}
	}

	@PostMapping("updateAppos")
	String updateAppos(Model model, @RequestParam("id") Long id, @RequestParam("patientName") String patientName,
			@RequestParam("phone") String phone, @RequestParam("email") String email,
			@RequestParam("dateCome") String dateCome, @RequestParam("timeCome") String timeCome,
			@RequestParam("doctorId") Long doctorId, @RequestParam("symptom") String symptom) {
		try {
			Account user = (Account) session.getAttribute("user");
			Appointment entity = service.get(id);
			entity.setcreateDate();
			entity.setCreateBy(user.getUsername());
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
			return "redirect:/staff/";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("doctors", dtService.getAll());
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return AdminPageEnum.staffPage.toString();
		}
	}

	@PostMapping("deleteAppos")
	String deleteAppos(Model model, @RequestParam("price") Long id) {
		try {
			svService.delete(id);
			return "redirect:/staff/appos";
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return services(model, "");
		}
	}

	@GetMapping("bills")
	String bills(Model model, @RequestParam(name = "dateWork", defaultValue = "") String dateWork) {
		try {
			model.addAttribute("bills", service.getAll());
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
		}
		return AdminPageEnum.list_hoadonPage.toString();
	}

	@GetMapping("createBill")
	String createbill(Model model, @RequestParam("id") Long id) {
		try {
			Account user = (Account) session.getAttribute("user");
			Appointment entity = service.get(id);
			Bill bill = new Bill();
			bill.setCreateBy(user.getUsername());
			bill.setcreateDate();
			bill.setMedicalRecord(entity.getMedicalRecord());
			bill.setPayDate(LocalDate.now());
			billSerivce.create(bill);
			model.addAttribute("bill", bill);
			return AdminPageEnum.billPage.toString();
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return index(model, "");
		}

	}

	@PostMapping("updateBill")
	String updateBill(Model model, @RequestParam("id") Long id) {
		try {
			Bill bill = billSerivce.get(id);
			billSerivce.update(bill);
			return "redirect:/staff/bills";
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return bills(model, "");
		}

	}

	@PostMapping("deleteBill")
	String deleteBill(Model model, @RequestParam("id") Long id) {
		try {
			billSerivce.delete(id);
			return "redirect:/staff/bills";
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return bills(model, "");
		}
	}

	@GetMapping("patients")
	String patients(Model model) {
		try {
			model.addAttribute("patients", ptService.getAll());
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
		}
		return AdminPageEnum.list_benhnhanPage.toString();
	}

	@GetMapping("createPatient")
	String createPatientPage(Model model, @RequestParam("id") Long id) {
		try {
			Appointment entity = service.get(id);
			UserDetail use = udService.getEntityByPhoneNumBer(entity.getPhone());
			if (udService.getEntityByPhoneNumBer(entity.getPhone()) == null) {
				model.addAttribute("appoItem", entity);
				return AdminPageEnum.createPatientPage.toString();
			} else {
				entity.setPatient(udService.getEntityByPhoneNumBer(entity.getPhone()).getPatient());
				service.update(entity);
				return "redirect:/staff";
			}
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return index(model, "");
		}
	}

	@PostMapping("createPatient")
	String createPatient(HttpServletRequest request, Model model, @RequestParam("address") String address,
			@RequestParam("age") Long age, @RequestParam("avatar") MultipartFile avatar,
			@RequestParam("email") String email, @RequestParam("fullname") String fullname,
			@RequestParam("gender") Boolean gender, @RequestParam("phone") String phone,
			@RequestParam("appoId") Long appoId) {
		Account user = (Account) session.getAttribute("user");
		UserDetail detailForEntity = new UserDetail();
		Patient entity = new Patient();
		Appointment appo = new Appointment();
		detailForEntity.setAddress(address);
		detailForEntity.setAge(age);
		detailForEntity.setAvartar("default.jpg");
		detailForEntity.setCreateBy(user.getUsername());
		detailForEntity.setcreateDate();
		detailForEntity.setEmail(email);
		detailForEntity.setFullname(fullname);
		detailForEntity.setGender(gender);
		detailForEntity.setPhone(phone);
		try {

			detailForEntity = udService.create(detailForEntity);
			entity.setCreateBy(user.getUsername());
			entity.setcreateDate();
			entity.setUserDetail(detailForEntity);
			entity = ptService.create(entity);
			detailForEntity = entity.getUserDetail();
			detailForEntity.setAvartar(helpers.SaveFile(request, entity.getUserDetail().getId()));
			udService.update(detailForEntity);
			appo = service.get(appoId);
			appo.setPatient(entity);
			service.update(appo);
			return "redirect:/staff";
		} catch (Exception e) {
			try {
				model.addAttribute("appoItem", service.get(appoId));
				if (udService.getEntityByPhoneNumBer(phone) != null) {
					udService.delete(udService.getEntityByPhoneNumBer(phone).getId());
				}
				if (ptService.get(entity.getId()) != null) {
					ptService.delete(entity.getId());
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return AdminPageEnum.createPatientPage.toString();
		}
	}

	@PostMapping("updatePatient")
	String updatePatient(HttpServletRequest request, Model model, @RequestParam("address") String address,
			@RequestParam("age") Long age, @RequestParam("avartar") String avartar, @RequestParam("email") String email,
			@RequestParam("fullname") String fullname, @RequestParam("gender") Boolean gender,
			@RequestParam("phone") String phone) {
		try {
			Account user = (Account) session.getAttribute("user");
			UserDetail detailForEntity = new UserDetail();
			detailForEntity.setAddress(address);
			detailForEntity.setAge(age);
			detailForEntity.setAvartar(avartar);
			detailForEntity.setCreateBy(user.getUsername());
			detailForEntity.setcreateDate();
			detailForEntity.setEmail(email);
			detailForEntity.setFullname(fullname);
			detailForEntity.setGender(gender);
			detailForEntity.setPhone(phone);
			udService.update(detailForEntity);
			Patient entity = new Patient();
			entity.setCreateBy(user.getUsername());
			entity.setcreateDate();
			ptService.update(entity);
			helpers.SaveFile(request, entity.getUserDetail().getId());
			return "redirect:/staff";
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return AdminPageEnum.createPatientPage.toString();
		}
	}

	@GetMapping("deletePatient")
	String updatePatient(Model model, @RequestParam("id") Long id) {
		try {
			ptService.delete(id);
			udService.delete(ptService.get(id).getUserDetail().getId());
			return "redirect:/staff";
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return AdminPageEnum.createPatientPage.toString();
		}
	}

	@GetMapping("getMedicalRecord")
	String getMedicalRecord(Model model, @RequestParam("id") Long id,
			@RequestParam(name = "dateWork", defaultValue = "") String dateWork) {
		try {
			Appointment entity = service.get(id);
			model.addAttribute("appoSelete", entity);
			model.addAttribute("doctors", dtService.getAll());
			model.addAttribute("DateNow", LocalDateTime.now());
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
		}
		return AdminPageEnum.createPhieuKhamPage.toString();
	}

	@PostMapping("createMedicalRecord")
	String createMedicalRecord(Model model, @RequestParam("fullname") String fullname,
			@RequestParam("examinationDate") String examinationDate, @RequestParam("doctorId") Long doctorId,
			@RequestParam("patientId") Long patientId, @RequestParam("appoId") Long appoId,
			@RequestParam(name = "dateWork", defaultValue = "") String dateWork) {
		try {
			Account user = (Account) session.getAttribute("user");
			MedicalRecord entity = new MedicalRecord();
			entity.setcreateDate();
			entity.setExaminationDate(LocalDateTime.parse(examinationDate));
			entity.setReExaminationDate(LocalDate.now());
			entity.setServices(null);
			entity.setPatient(service.get(appoId).getPatient());
			entity.setDoctor(dtService.get(doctorId));
			entity.setCreateBy(user.getUsername());
			mdSerivce.create(entity);
			model.addAttribute("pantienList", service.getpantienListByStatusAndDateWork(Boolean.FALSE, dateWork));
			model.addAttribute("appoSelete", null);

			Appointment appoEntity = service.get(appoId);
			List<Appointment> list = service.getpantienListByStatusAndDateWork(Boolean.FALSE, dateWork);
			appoEntity.setStt(list.stream().filter(e -> e.getPatient() != null && e.getStt() != 0)
					.collect(Collectors.toList()).size() + 1);
			appoEntity.setMedicalRecord(entity);
			service.update(appoEntity);

			return "redirect:/staff";
		} catch (Exception e) {

			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return AdminPageEnum.createPhieuKhamPage.toString();
		}
	}

}
