/**
 * 
 */
package com.serviceimpl;

import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DAOimpl.AppointmentDAOimpl;
import com.model.Appointment;
import com.service.ISERVICE;

/**
 * @author Huynh Tan Dat last on 03-07-2020 09:40:23
 *
 * 
 */
@Service
public class AppointmentServiceimpl implements ISERVICE<Appointment> {
	@Autowired
	AppointmentDAOimpl dao;

	public List<Appointment> getAll() {
		return dao.findAll();
	}

	@Override
	public Appointment get(Long id) throws Exception {
		return dao.findById(id);
	}

	@Override
	public Appointment create(Appointment entity) throws Exception {
		return dao.create(entity);
	}

	@Override
	public void update(Appointment entity) throws Exception {
		dao.update(entity);
	}

	@Override
	public Appointment delete(Long id) throws Exception {
		return dao.delete(id);
	}

	public List<Appointment> getByDateCome(LocalDate dateCome) {
		return dao.findAll().stream()
				.filter(e -> e.getDateCome().isEqual(dateCome))
				.collect(Collectors.toList());
	}
	
	public List<Appointment> getInPeriod(LocalDate dateStart,LocalDate dateEnd) {
		return dao.findAll().stream()
				.filter(e -> e.getDateCome().isAfter(dateStart)&&e.getDateCome().isBefore(dateStart))
				.collect(Collectors.toList());
	}
	
	public List<Appointment> getpantienListByStatusAndDateWork(Boolean status, String dateWork) {
		if (dateWork.equals("")) {
			dateWork = LocalDate.now().toString();
		}
		return this.getByDateCome(LocalDate.parse(dateWork)).stream().filter(e -> e.getStatus() == status)
				.sorted(Comparator.comparingInt(Appointment::getStt)).collect(Collectors.toList());
	}
}
