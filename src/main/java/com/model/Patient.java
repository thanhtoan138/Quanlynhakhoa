/**
 * 
 */
package com.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

/**
 * @author Huynh Tan Dat last on 30-06-2020 14:38:50

 *
 */
@Entity
@Table(name = "Patients")
public class Patient extends SuperModel{
	@OneToOne(targetEntity = UserDetail.class)
	@NotNull(message = "Thiếu thông tin chi tiết")
	@JoinColumn(name = "detail_id")
	private UserDetail userDetail;
	
	@LazyCollection(LazyCollectionOption.FALSE)
	@OneToMany(mappedBy = "patient", targetEntity = MedicalRecord.class)
	private List<MedicalRecord> medicalRecords;
	
	@LazyCollection(LazyCollectionOption.FALSE)
	@OneToMany(mappedBy = "patient", targetEntity = Appointment.class)
	private List<Appointment> appos;

	public UserDetail getUserDetail() {
		return userDetail;
	}

	public void setUserDetail(UserDetail userDetail) {
		this.userDetail = userDetail;
	}

	public List<MedicalRecord> getMedicalRecords() {
		return medicalRecords;
	}

	public void setMedicalRecords(List<MedicalRecord> medicalRecords) {
		this.medicalRecords = medicalRecords;
	}

	public List<Appointment> getAppos() {
		return appos;
	}

	public void setAppos(List<Appointment> appos) {
		this.appos = appos;
	}
	
	
}
