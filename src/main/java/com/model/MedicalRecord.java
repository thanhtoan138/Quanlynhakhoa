/**
 * 
 */
package com.model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * @author Huynh Tan Dat last on 30-06-2020 14:38:38

 *
 */
@Entity
@Table(name = "MedicalRecords")
public class MedicalRecord extends SuperModel{
	@Column(name = "examination_date")
	private LocalDateTime examinationDate;
	
	@Column(name = "re_examination_date")
	private LocalDate reExaminationDate;
	
	@ManyToOne(targetEntity = Patient.class)
	@JoinColumn(name = "patient_id")
	private Patient patient;
	
	@ManyToOne(targetEntity = Doctor.class)
	@JoinColumn(name = "doctor_id")
	private Doctor doctor;
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(
	  name = "Ser_Rec", 
	  joinColumns = @JoinColumn(name = "medical_record_id"), 
	  inverseJoinColumns = @JoinColumn(name = "service_id"))
	private List<Service> services;
	
	@OneToOne(mappedBy = "medicalRecord", targetEntity = Bill.class)
	private Bill bill;
	
	@OneToOne(mappedBy = "medicalRecord", targetEntity = Appointment.class)
	private Appointment appointment;
	
	public LocalDateTime getExaminationDate() {
		return examinationDate;
	}

	public void setExaminationDate(LocalDateTime examinationDate) {
		this.examinationDate = examinationDate;
	}

	public LocalDate getReExaminationDate() {
		return reExaminationDate;
	}

	public void setReExaminationDate(LocalDate reExaminationDate) {
		this.reExaminationDate = reExaminationDate;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	public List<Service> getServices() {
		return services;
	}

	public void setServices(List<Service> services) {
		this.services = services;
	}

	public Bill getBill() {
		return bill;
	}

	public void setBill(Bill bill) {
		this.bill = bill;
	}

	public Appointment getAppointment() {
		return appointment;
	}

	public void setAppointment(Appointment appointment) {
		this.appointment = appointment;
	}
	
	
}
