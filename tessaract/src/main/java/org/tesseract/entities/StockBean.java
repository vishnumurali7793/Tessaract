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
@Table(schema = "tesseract", name = "stock")
public class StockBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "stock_id")
	private Integer stockId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="purchaseId")
	private PurchaseBean purchaseId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="productId")
	private ProductBean productId;
	
	@Column(name="date")
	private Date date;
	
	@Column(name="quantity")
	private Double Quantity; 
	
	@Column(name="netWt")
	private Double NetWt;
	
	@Column(name="detailStatus")
	private String detailStatus;
	
	public Integer getStockId() {
		return stockId;
	}

	public void setStockId(Integer stockId) {
		this.stockId = stockId;
	}

	public PurchaseBean getPurchaseId() {
		return purchaseId;
	}

	public void setPurchaseId(PurchaseBean purchaseId) {
		this.purchaseId = purchaseId;
	}

	public ProductBean getProductId() {
		return productId;
	}

	public void setProductId(ProductBean productId) {
		this.productId = productId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Double getQuantity() {
		return Quantity;
	}

	public void setQuantity(Double quantity) {
		Quantity = quantity;
	}

	public Double getNetWt() {
		return NetWt;
	}

	public void setNetWt(Double netWt) {
		NetWt = netWt;
	}

	public String getDetailStatus() {
		return detailStatus;
	}

	public void setDetailStatus(String detailStatus) {
		this.detailStatus = detailStatus;
	} 
	
	
	
	
}
