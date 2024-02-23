/**
 * 
 */
package com.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * @author Huynh Tan Dat last on 30-06-2020 14:37:52

 *
 */
@Entity
@Table(name = "Bills")
public class Bill extends SuperModel{
	@Column(name = "pay_date")
	private LocalDate payDate;
	
	@OneToOne( mappedBy = "",targetEntity = MedicalRecord.class)
	@JoinColumn(name = "medical_record_id")
	private MedicalRecord medicalRecord;

	public LocalDate getPayDate() {
		return payDate;
	}

	public void setPayDate(LocalDate payDate) {
		this.payDate = payDate;
	}

	public MedicalRecord getMedicalRecord() {
		return medicalRecord;
	}

	public void setMedicalRecord(MedicalRecord medicalRecord) {
		this.medicalRecord = medicalRecord;
	}
}
