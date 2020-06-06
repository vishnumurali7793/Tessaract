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
@Table(schema = "tesseract", name = "sales_details")
public class SalesDetailsBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "salesdetailsid")
	private Integer salesDetailsId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="salesid")
	private SalesBase salesid;
	
	@Column(name = "hsn_code")
	private String hsnCode;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="productId")
	private ProductBean productId;
	
	@Column(name = "quantity")
	private Double quantity;
	
	@Column(name = "goldweight")
	private Double goldweight;
	
	@Column(name = "stoneweight")
	private Double stoneweight;
	
	@Column(name = "netweight")
	private Double netweight;
	
	@Column(name = "rate")
	private Double rate;
	
	@Column(name = "vaamount")
	private Double vaamount;
	
	@Column(name = "afterdis")
	private Double afterdis;
	
	@Column(name = "stonecash")
	private Double stonecash;
	
	@Column(name = "totamt")
	private Double totalAmt;
	
	@Column(name = "deletestatus")
	private String deleteStatus="N";

	public Integer getSalesDetailsId() {
		return salesDetailsId;
	}

	public void setSalesDetailsId(Integer salesDetailsId) {
		this.salesDetailsId = salesDetailsId;
	}

	public SalesBase getSalesid() {
		return salesid;
	}

	public void setSalesid(SalesBase salesid) {
		this.salesid = salesid;
	}

	public String getHsnCode() {
		return hsnCode;
	}

	public void setHsnCode(String hsnCode) {
		this.hsnCode = hsnCode;
	}

	public ProductBean getProductId() {
		return productId;
	}

	public void setProductId(ProductBean productId) {
		this.productId = productId;
	}

	public Double getQuantity() {
		return quantity;
	}

	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}

	public Double getGoldweight() {
		return goldweight;
	}

	public void setGoldweight(Double goldweight) {
		this.goldweight = goldweight;
	}

	public Double getStoneweight() {
		return stoneweight;
	}

	public void setStoneweight(Double stoneweight) {
		this.stoneweight = stoneweight;
	}

	public Double getNetweight() {
		return netweight;
	}

	public void setNetweight(Double netweight) {
		this.netweight = netweight;
	}

	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
	}

	public Double getVaamount() {
		return vaamount;
	}

	public void setVaamount(Double vaamount) {
		this.vaamount = vaamount;
	}

	public Double getAfterdis() {
		return afterdis;
	}

	public void setAfterdis(Double afterdis) {
		this.afterdis = afterdis;
	}

	public Double getStonecash() {
		return stonecash;
	}

	public void setStonecash(Double stonecash) {
		this.stonecash = stonecash;
	}

	public Double getTotalAmt() {
		return totalAmt;
	}

	public void setTotalAmt(Double totalAmt) {
		this.totalAmt = totalAmt;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}
	
	
}
