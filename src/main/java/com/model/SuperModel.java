/**
 * 
 */
package com.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

/**
 * @author Huynh Tan Dat last on 22-06-2020 15:48:10
 *
 * 
 */
@MappedSuperclass
public abstract class SuperModel {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty
	@Column(name = "created_by")
	private String createBy;

	@NotNull
	@Column(name = "created_date")
	private LocalDate createDate;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public LocalDate getcreateDate() {
		return createDate;
	}

	/**
	 * Không thể gán giá trị cho hàm này
	 */
	public void setcreateDate() {
		this.createDate = LocalDate.now();
	}
}
