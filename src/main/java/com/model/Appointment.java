/**
 * 
 */
package com.model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author Huynh Tan Dat last on 30-06-2020 14:37:39

 *
 */
@Entity
@Table(name = "Appointments")
public class Appointment extends SuperModel{
	@Column(name = "patient_name")
	private String patientName;
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "stt")
	private Integer stt = 0;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "date_book")
	@DateTimeFormat(pattern = "HH:mm dd/MM/yyyy")
	private LocalDateTime dateBook;
	
	@Column(name = "symptom")
	private String symptom;
	
	@Column(name = "date_come")
	private LocalDate dateCome;
	
	@Column(name = "status")
	private Boolean status;
	
	@ManyToOne(targetEntity = Doctor.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "doctor_id")
	private Doctor doctor;

	@ManyToOne(targetEntity = Patient.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "patient_id")
	private Patient patient;
	
	@OneToOne(targetEntity = MedicalRecord.class, fetch = FetchType.EAGER)
	@JoinColumn(name = "medicalRecord_Id")
	private MedicalRecord medicalRecord;

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public LocalDateTime getDateBook() {
		return dateBook;
	}

	public void setDateBook(LocalDateTime dateBook) {
		this.dateBook = dateBook;
	}

	public String getSymptom() {
		return symptom;
	}

	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}

	public LocalDate getDateCome() {
		return dateCome;
	}

	public void setDateCome(LocalDate dateCome) {
		this.dateCome = dateCome;
	}

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public Integer getStt() {
		return stt;
	}

	public void setStt(Integer stt, List<Appointment> listAppIndateWork) throws Exception {
		if(!listAppIndateWork.stream().anyMatch(e->e.getStt() == stt)) {
			this.stt = stt;
		}
		else {
			throw new Exception("Số thứ tự này đã được sử dụng bởi bệnh nhân"+ listAppIndateWork.stream().findFirst().get().getPatientName());
		}
		
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public void setStt(Integer stt) {
		this.stt = stt;
	}

	public MedicalRecord getMedicalRecord() {
		return medicalRecord;
	}

	public void setMedicalRecord(MedicalRecord medicalRecord) {
		this.medicalRecord = medicalRecord;
	}
}
