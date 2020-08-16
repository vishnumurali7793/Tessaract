package org.tesseract.entities;

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
@Table(schema = "tesseract", name = "salesReturnAmount")
public class SalesReturnAmountBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "salesretamountid")
	private Integer salesReturnAmountId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="salesid")
	private SalesBase salesid;
	
	@Column(name = "grossamount")
	private Double grossamount;
	
	@Column(name = "taxamt")
	private Double taxamt;
	
	@Column(name = "cgst")
	private Double cgst;
	
	@Column(name = "sgst")
	private Double sgst;
	
	@Column(name = "igst")
	private Double igst;
	
	@Column(name = "netamount")
	private Double netamount;

	public Integer getSalesAmountId() {
		return salesReturnAmountId;
	}

	public void setSalesAmountId(Integer salesAmountId) {
		this.salesReturnAmountId = salesAmountId;
	}

	public SalesBase getSalesid() {
		return salesid;
	}

	public void setSalesid(SalesBase salesid) {
		this.salesid = salesid;
	}

	public Double getGrossamount() {
		return grossamount;
	}

	public void setGrossamount(Double grossamount) {
		this.grossamount = grossamount;
	}

	public Double getTaxamt() {
		return taxamt;
	}

	public void setTaxamt(Double taxamt) {
		this.taxamt = taxamt;
	}

	public Double getCgst() {
		return cgst;
	}

	public void setCgst(Double cgst) {
		this.cgst = cgst;
	}

	public Double getSgst() {
		return sgst;
	}

	public void setSgst(Double sgst) {
		this.sgst = sgst;
	}

	public Double getIgst() {
		return igst;
	}

	public void setIgst(Double igst) {
		this.igst = igst;
	}

	public Double getNetamount() {
		return netamount;
	}

	public void setNetamount(Double netamount) {
		this.netamount = netamount;
	}
	
	
}

