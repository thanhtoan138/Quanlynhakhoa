/**
 * 
 */
package com.serviceimpl;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DAOimpl.BillDAOimpl;
import com.model.Bill;
import com.service.ISERVICE;

/**
 * @author Huynh Tan Dat last on 03-07-2020 22:17:02

 *
 */
@Service
public class BillServiceimpl implements ISERVICE<Bill>{
	@Autowired
	BillDAOimpl dao;

	public List<Bill> getAll() {
		return dao.findAll();
	}

	@Override
	public Bill get(Long id) throws Exception {
		return dao.findById(id);
	}

	@Override
	public Bill create(Bill entity) throws Exception {
		if (this.getAll().stream().filter(e->e.getMedicalRecord().getId()==entity.getMedicalRecord().getId()).count()>0) {
			throw new Exception("Phiếu Khám Đã Được Thanh Toán");
		}
		return dao.create(entity);
	}

	@Override
	public void update(Bill entity) throws Exception {
		dao.update(entity);
	}

	@Override
	public Bill delete(Long id) throws Exception {
		return dao.delete(id);
	}
	
	public List<Bill> getDataBy2Data(LocalDate dateStart, LocalDate dateEnd){
		return this.getAll().stream().filter(e->e.getPayDate().isAfter(dateStart)&&
				e.getPayDate().isBefore(dateEnd)).collect(Collectors.toList());
	}
}
