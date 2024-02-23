/**
 * 
 */
package com.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 * @author Huynh Tan Dat last on 30-06-2020 14:39:14

 *
 */
@Entity
@Table(name = "Services")
public class Service extends SuperModel{
	@Column(name = "service_name")
	private String serviceName;
	
	@Column(name = "unit")
	private String unit;
	
	@Column(name = "price")
	private Double price;
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(
	  name = "Ser_Rec", 
	  joinColumns = @JoinColumn(name = "service_id"), 
	  inverseJoinColumns = @JoinColumn(name = "medical_record_id"))
	private List<MedicalRecord> medicalRecords;

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public List<MedicalRecord> getMedicalRecords() {
		return medicalRecords;
	}

	public void setMedicalRecords(List<MedicalRecord> medicalRecords) {
		this.medicalRecords = medicalRecords;
	}
}
