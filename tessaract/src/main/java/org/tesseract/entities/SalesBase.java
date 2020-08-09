package org.tesseract.entities;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(schema = "tesseract", name = "salesBase")
public class SalesBase {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "salesid")
	private Integer salesId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="customerId")
	private CustomerBean customerId;
	
	@Column(name = "invoice")
	private String invoice;
	
	@Column(name = "invoice_date")
	private Date invoiceDate;
	
	@Column(name = "gold_rate")
	private Double goldRate;
	
	@Column(name = "silver_rate")
	private Double silverRate;
	
	@Column(name = "platinum_rate")
	private Double platinumRate;
	
	@Column(name = "gst_code")
	private String gstCode;

	public Integer getSalesId() {
		return salesId;
	}

	public void setSalesId(Integer salesId) {
		this.salesId = salesId;
	}

	public CustomerBean getCustomerId() {
		return customerId;
	}

	public void setCustomerId(CustomerBean customerId) {
		this.customerId = customerId;
	}

	public String getInvoice() {
		return invoice;
	}

	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}

	public Date getInvoiceDate() {
		return invoiceDate;
	}

	public void setInvoiceDate(Date invoiceDate) {
		this.invoiceDate = invoiceDate;
	}

	public Double getGoldRate() {
		return goldRate;
	}

	public void setGoldRate(Double goldRate) {
		this.goldRate = goldRate;
	}

	public Double getSilverRate() {
		return silverRate;
	}

	public void setSilverRate(Double silverRate) {
		this.silverRate = silverRate;
	}

	public Double getPlatinumRate() {
		return platinumRate;
	}

	public void setPlatinumRate(Double platinumRate) {
		this.platinumRate = platinumRate;
	}

	public String getGstCode() {
		return gstCode;
	}

	public void setGstCode(String gstCode) {
		this.gstCode = gstCode;
	}
	
	
}
