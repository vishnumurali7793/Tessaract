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
@Table(schema = "tesseract", name = "purchaseReturnDetails")
public class PurchaseReturnScreenBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "purchase_return_screen_id")
	private Integer purchaseReturnScreenId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="purchaseId")
	private PurchaseBean purchaseId;
	
	@Column(name = "hsn_code")
	private Double hsnCode;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="productId")
	private ProductBean productId;
	
	@Column(name = "purity")
	private Double purity;
	
	@Column(name = "goldweight")
	private Double goldweight;
	
	@Column(name = "touch")
	private Double touch;
	
	@Column(name = "netweight")
	private Double netweight;
	
	@Column(name = "rate")
	private Double rate;
	
	@Column(name = "totalamount")
	private Double totalamount;
	
	@Column(name = "gramweight")
	private Double gramweight;
	
	@Column(name = "deletestatus")
	private String deleteStatus="N";
	
	@Column(name = "quantity")
	private Double quantity;

	public Integer getPurchaseScreenId() {
		return purchaseReturnScreenId;
	}

	public void setPurchaseScreenId(Integer purchaseScreenId) {
		this.purchaseReturnScreenId = purchaseScreenId;
	}

	public PurchaseBean getPurchaseId() {
		return purchaseId;
	}

	public void setPurchaseId(PurchaseBean purchaseId) {
		this.purchaseId = purchaseId;
	}

	public Double getHsnCode() {
		return hsnCode;
	}

	public void setHsnCode(Double hsnCode) {
		this.hsnCode = hsnCode;
	}

	public ProductBean getProductId() {
		return productId;
	}

	public void setProductId(ProductBean productId) {
		this.productId = productId;
	}

	public Double getPurity() {
		return purity;
	}

	public void setPurity(Double purity) {
		this.purity = purity;
	}

	public Double getGoldweight() {
		return goldweight;
	}

	public void setGoldweight(Double goldweight) {
		this.goldweight = goldweight;
	}

	public Double getTouch() {
		return touch;
	}

	public void setTouch(Double touch) {
		this.touch = touch;
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

	public Double getTotalamount() {
		return totalamount;
	}

	public void setTotalamount(Double totalamount) {
		this.totalamount = totalamount;
	}

	public Double getGramweight() {
		return gramweight;
	}

	public void setGramweight(Double gramweight) {
		this.gramweight = gramweight;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public Double getQuantity() {
		return quantity;
	}

	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}
	
	
}

