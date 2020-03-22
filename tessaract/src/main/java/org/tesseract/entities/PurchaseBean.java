package org.tesseract.entities;

import java.util.Date;

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
@Table(schema = "tesseract", name = "purchaseBase")
public class PurchaseBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "purchase_id")
	private Integer purchaseId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="vendorId")
	private VendorBean vendor;
	
	@Column(name = "gst_code")
	private String gstCode;
	
	@Column(name = "purchase_date")
	private Date purchaseDate;
	
	@Column(name = "invoice_date")
	private Date invoiceDate;
	
	@Column(name = "gold_rate")
	private Double goldRate;
	
	@Column(name = "silver_rate")
	private Double silverRate;
	
	@Column(name = "platinum_rate")
	private Double platinumRate;
	
	@Column(name = "invoice")
	private String invoice;
	
	@Column(name = "pur_Bill_no")
	private String purBillNo;

	public Integer getPurchaseId() {
		return purchaseId;
	}

	public void setPurchaseId(Integer purchaseId) {
		this.purchaseId = purchaseId;
	}

	public VendorBean getVendor() {
		return vendor;
	}

	public void setVendor(VendorBean vendor) {
		this.vendor = vendor;
	}

	public String getGstCode() {
		return gstCode;
	}

	public void setGstCode(String gstCode) {
		this.gstCode = gstCode;
	}

	public Date getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
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

	public String getInvoice() {
		return invoice;
	}

	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}

	public String getPurBillNo() {
		return purBillNo;
	}

	public void setPurBillNo(String purBillNo) {
		this.purBillNo = purBillNo;
	}
	
	
}
