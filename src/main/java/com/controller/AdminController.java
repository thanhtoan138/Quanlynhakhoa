/**
 * 
 */
package com.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
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
import com.model.Doctor;
import com.model.EnumRole;
import com.model.Service;
import com.model.UserDetail;
import com.serviceimpl.AccountServiceimpl;
import com.serviceimpl.AppointmentServiceimpl;
import com.serviceimpl.BillServiceimpl;
import com.serviceimpl.DoctorServiceimpl;
import com.serviceimpl.RoleServiceimpl;
import com.serviceimpl.ServiceServiceimpl;
import com.serviceimpl.UserDetailServiceimlp;

/**
 * @author Huynh Tan Dat last on 04-07-2020 22:51:02
 *
 * 
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AccountServiceimpl service;

	@Autowired
	RoleServiceimpl roleService;

	@Autowired
	UserDetailServiceimlp udService;

	@Autowired
	AppointmentServiceimpl appoService;

	@Autowired
	DoctorServiceimpl dtService;

	@Autowired
	ServiceServiceimpl svService;

	@Autowired
	BillServiceimpl billService;

	@Autowired
	RoleServiceimpl rSerivce;

	@Autowired
	HttpSession session;

	@GetMapping
	String index(Model model, @RequestParam(name = "year", defaultValue = "0") int year,
			@RequestParam(name = "dateStart", defaultValue = "") String dateStart,
			@RequestParam(name = "dateEnd", defaultValue = "") String dateEnd,
			@RequestParam(name = "month", defaultValue = "0") int month2, @RequestParam(name = "year", defaultValue = "0") int year2) {
		if (year == 0) {
			year = LocalDate.now().getYear();
		}
		if (dateStart.isEmpty()) {
			dateStart = LocalDate.now().withDayOfMonth(1).toString();
		}
		if (dateEnd.isEmpty()) {
			dateEnd = LocalDate.now().withDayOfMonth(LocalDate.now().getMonth().maxLength()).toString();
		}
		if (month2 == 0) {
			month2 = LocalDate.now().getMonthValue();
		}
		if (year2 == 0) {
			year2 = LocalDate.now().getYear();
		}
		session.setAttribute("role", 0);
		Double doanhThuQuy1 = 0.0;
		Double doanhThuQuy2 = 0.0;
		Double doanhThuQuy3 = 0.0;
		Double doanhThuQuy4 = 0.0;
		for (Bill e : billService.getDataBy2Data(LocalDate.of(year, 1, 1), LocalDate.of(year, 3, 31))) {
			Double local = 0.0;
			for (Service ee : e.getMedicalRecord().getServices()) {
				local += ee.getPrice();
			}
			doanhThuQuy1 += local;
		}
		for (Bill e : billService.getDataBy2Data(LocalDate.of(year, 1, 4), LocalDate.of(year, 6, 30))) {
			Double local = 0.0;
			for (Service ee : e.getMedicalRecord().getServices()) {
				local += ee.getPrice();
			}
			doanhThuQuy2 += local;
		}
		for (Bill e : billService.getDataBy2Data(LocalDate.of(year, 1, 7), LocalDate.of(year, 9, 30))) {
			Double local = 0.0;
			for (Service ee : e.getMedicalRecord().getServices()) {
				local += ee.getPrice();
			}
			doanhThuQuy3 += local;
		}
		for (Bill e : billService.getDataBy2Data(LocalDate.of(year, 10, 1), LocalDate.of(year, 12, 31))) {
			Double local = 0.0;
			for (Service ee : e.getMedicalRecord().getServices()) {
				local += ee.getPrice();
			}
			doanhThuQuy4 += local;
		}
		

		List<Appointment> listInPeriod = appoService.getInPeriod(LocalDate.parse(dateStart), LocalDate.parse(dateEnd));
		Set<Integer> years = new HashSet<Integer>();
		billService.getAll().forEach(e->years.add(e.getPayDate().getYear()));
		List<Bill> billInMonth = billService.getDataBy2Data(LocalDate.of(year2, month2, 1), LocalDate.of(year2, month2, LocalDate.of(year2, month2, 1).withDayOfMonth(LocalDate.of(year2, month2, 1).getMonth().maxLength()).getDayOfMonth()));
		List<Double> monneyInMonth= new ArrayList<Double>();
		for (int i=1; i <= LocalDate.of(year2, month2, 1).getMonth().maxLength();i++ ) {
			LocalDate date = LocalDate.of(year2, month2, i); 
			List<Bill> data = billInMonth.stream().filter(e->e.getPayDate() == date).collect(Collectors.toList());
			Double local = 0.0;
			for (Bill e : data) {
				Double local1 = 0.0;
				for (Service ee : e.getMedicalRecord().getServices()) {
					local1 += ee.getPrice();
				}
				local += local1;
			}
			monneyInMonth.add(local);
		}
		monneyInMonth.forEach(e->System.out.println(e.toString()));
		model.addAttribute("years", years);
		model.addAttribute("Q1", doanhThuQuy1);
		model.addAttribute("Q2", doanhThuQuy2);
		model.addAttribute("Q3", doanhThuQuy3);
		model.addAttribute("Q4", doanhThuQuy4);
		model.addAttribute("appoTrue", listInPeriod.stream().filter(e -> e.getMedicalRecord().getBill()!=null).count());
		model.addAttribute("appoFalse", listInPeriod.stream().filter(e -> e.getMedicalRecord().getBill()==null).count());
		model.addAttribute("year", year);
		model.addAttribute("dateStart", dateStart);
		model.addAttribute("dateEnd", dateEnd);
		model.addAttribute("moneyInMonth", monneyInMonth);
		return AdminPageEnum.indexPage.toString();
	}

	@GetMapping("users")
	String accounts(Model model) {
		model.addAttribute("users", service.getAll());
		model.addAttribute("roles", roleService.getAll());
		return AdminPageEnum.list_accountPage.toString();
	}

	@PostMapping("createUser")
	String createUser(Model model, @RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("roleId") Long roleId) {
		Account user = (Account) session.getAttribute("user");
		Account entity = new Account();
		try {
			entity.setUsername(username);
			entity.setPassword(password);
			entity.setRole(rSerivce.get(roleId));
			entity.setCreateBy(user.getUsername());
			entity.setcreateDate();
			service.create(entity);
			return "redirect:/admin/users";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return accounts(model);
		}

	}

	@PostMapping("updateUser")
	String updateUser(Model model, @RequestParam("id") Long id, @RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("roleId") Long roleId) {

		try {
			Account entity = service.get(id);
			entity.setUsername(username);
			entity.setPassword(password);
			entity.setRole(rSerivce.get(roleId));
			service.update(entity);
			return "redirect:/admin/users";
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return accounts(model);
		}

	}

	@PostMapping("deleteUser")
	String deleteUser(Model model, @RequestParam("id") Long id) {
		try {
			service.delete(id);
			return "redirect:/admin/users";
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return accounts(model);
		}
	}

	@GetMapping("doctors")
	String doctors(Model model) {
		model.addAttribute("doctors", dtService.getAll());
		model.addAttribute("accountDoctors",
				service.getAll().parallelStream().filter(
						e -> e.getRole().getRoleName().equals(EnumRole.doctor.toString()) && e.getDoctor() == null)
						.collect(Collectors.toList()));
		return AdminPageEnum.list_bacsiPage.toString();
	}

	@PostMapping("createDoctor")
	String createDoctor(HttpServletRequest request, Model model, @RequestParam("avatar") MultipartFile avartar,
			@RequestParam("accountId") Long accountId, @RequestParam("fullname") String fullname,
			@RequestParam("gender") Boolean gender, @RequestParam("age") Long age, @RequestParam("phone") String phone,
			@RequestParam("email") String email, @RequestParam("address") String address,
			@RequestParam("degree") String degree) {
		Account user = (Account) session.getAttribute("user");
		Doctor entity = new Doctor();
		try {
			UserDetail detail = new UserDetail();
			detail.setAddress(address);
			detail.setAge(age);
			detail.setAvartar("no img");
			detail.setCreateBy(user.getUsername());
			detail.setcreateDate();
			detail.setEmail(email);
			detail.setFullname(fullname);
			detail.setGender(gender);
			detail.setPhone(phone);
			udService.create(detail);
			entity.setAccount(service.get(accountId));
			entity.setDegree(degree);
			entity.setUserDetail(detail);
			detail.setAvartar(helpers.SaveFile(request, entity.getUserDetail().getId()));
			udService.update(detail);
			entity.setcreateDate();
			entity.setCreateBy(user.getUsername());
			dtService.create(entity);

			return "redirect:/admin/doctors";
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			e.printStackTrace();
			return doctors(model);
		}

	}

	@PostMapping("updateDoctor")
	String updateDoctor(HttpServletRequest request, Model model, @RequestParam("id") Long id,
			@RequestParam("avatar") MultipartFile avartar, @RequestParam("accountId") Long accountId,
			@RequestParam("fullname") String fullname, @RequestParam("gender") Boolean gender,
			@RequestParam("age") Long age, @RequestParam("phone") String phone, @RequestParam("email") String email,
			@RequestParam("address") String address, @RequestParam("degree") String degree) {
		try {
			Account user = (Account) session.getAttribute("user");
			Doctor entity = dtService.get(id);
			entity.setAccount(service.get(accountId));
			entity.setDegree(degree);
			UserDetail detail = entity.getUserDetail();
			detail.setAddress(address);
			detail.setAge(age);
			detail.setAvartar(helpers.SaveFile(request, detail.getId()));
			detail.setCreateBy(user.getUsername());
			detail.setcreateDate();
			detail.setEmail(email);
			detail.setFullname(fullname);
			detail.setGender(gender);
			detail.setPhone(phone);
			dtService.update(entity);
			return "redirect:/admin/doctors";
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return doctors(model);
		}

	}

	@PostMapping("deleteDoctor")
	String deleteDoctor(Model model, @RequestParam("id") Long id) {
		try {
			dtService.delete(id);
			return "redirect:/admin/doctors";
		} catch (Exception e) {
			model.addAttribute(DuAn2Application.reportName, e.getMessage());
			return doctors(model);
		}
	}

	@GetMapping("services")
	String services(Model model) {
		model.addAttribute("services", svService.getAll());
		model.addAttribute("hidden", "style=\"display: none\"");
		return AdminPageEnum.list_dichvuPage.toString();
	}

	@GetMapping("bills")
	String bills(Model model) {
		model.addAttribute("bills", billService.getAll());
		model.addAttribute("hidden", "style=\"display: none\"");
		return AdminPageEnum.list_hoadonPage.toString();
	}

	@GetMapping("appos")
	String appos(Model model) {
		model.addAttribute("appos", appoService.getAll());
		model.addAttribute("hidden", "style=\"display: none\"");
		return AdminPageEnum.list_lichhenPage.toString();
	}

}
