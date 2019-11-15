package org.tesseract.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(schema = "tesseract", name = "rate")
public class RateBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "rate_id")
	private Integer rateId;
	
	@ManyToOne
	@JoinColumn(name="categoryId")
	private CategoryBean categoryId;
	
	@ManyToOne
	@JoinColumn(name="caratId")
	private CaratBean caratId;
	
	@Column(name = "amount")
	private Double amount;
	
	@Column(name = "active_status")
	private String activeStatus;
	
	@Column(name = "delete_status")
	private String deleteStatus = "N";

	@Column(name = "added_on")
	private String addedOn;

	public Integer getRateId() {
		return rateId;
	}

	public void setRateId(Integer rateId) {
		this.rateId = rateId;
	}

	public CategoryBean getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(CategoryBean categoryId) {
		this.categoryId = categoryId;
	}

	public CaratBean getCaratId() {
		return caratId;
	}

	public void setCaratId(CaratBean caratId) {
		this.caratId = caratId;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getActiveStatus() {
		return activeStatus;
	}

	public void setActiveStatus(String activeStatus) {
		this.activeStatus = activeStatus;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public String getAddedOn() {
		return addedOn;
	}

	public void setAddedOn(String addedOn) {
		this.addedOn = addedOn;
	}
	
	
	
}
