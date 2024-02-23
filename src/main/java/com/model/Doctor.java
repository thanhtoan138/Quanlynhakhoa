/**
 * 
 */
package com.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * @author Huynh Tan Dat last on 30-06-2020 14:38:25

 *
 */
@Entity
@Table(name = "Doctors")
public class Doctor extends SuperModel{
	@Column(name = "degree")
	private String degree;
	
	@OneToOne(targetEntity = UserDetail.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "detail_id")
	private UserDetail userDetail;
	
	@OneToOne(targetEntity = Account.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "account_id")
	private Account account;
	
	@OneToMany(targetEntity = Appointment.class, mappedBy = "doctor")
	private List<Appointment> appointments;
	
	@OneToMany(targetEntity = MedicalRecord.class, mappedBy = "doctor")
	private List<MedicalRecord> medicalRecords;

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	

	public UserDetail getUserDetail() {
		return userDetail;
	}

	public void setUserDetail(UserDetail userDetail) {
		this.userDetail = userDetail;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public List<Appointment> getAppointments() {
		return appointments;
	}

	public void setAppointments(List<Appointment> appointments) {
		this.appointments = appointments;
	}

	public List<MedicalRecord> getMedicalRecords() {
		return medicalRecords;
	}

	public void setMedicalRecords(List<MedicalRecord> medicalRecords) {
		this.medicalRecords = medicalRecords;
	}

	
}
