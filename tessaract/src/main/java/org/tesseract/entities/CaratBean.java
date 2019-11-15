package org.tesseract.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(schema = "tesseract", name = "carat")
public class CaratBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "carat_id")
	private Integer caratId;
	
	@Column(name = "carat_code")
	private String caratCode;
	
	@Column(name = "carat_name")
	private String caratName;
	
	@Column(name = "active_status")
	private String activeStatus;
	
	@Column(name = "delete_status")
	private String deleteStatus = "N";

	public Integer getCaratId() {
		return caratId;
	}

	public void setCaratId(Integer caratId) {
		this.caratId = caratId;
	}

	public String getCaratCode() {
		return caratCode;
	}

	public void setCaratCode(String caratCode) {
		this.caratCode = caratCode;
	}

	public String getCaratName() {
		return caratName;
	}

	public void setCaratName(String caratName) {
		this.caratName = caratName;
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

	
}
