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
	
	@Column(name = "tranctionId")
	private Integer tranctionId;//purchaeid or SaleSid
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="productId")
	private ProductBean productId;
	
	@Column(name="billNO")
	private String billNO;
	
	@Column(name="month")
	private String month;
	
	@Column(name="year")
	private String year;
	
	@Column(name="updatedOn")
	private Date updatedOn;
	
	@Column(name="quantity")
	private Double Quantity; 
	
	@Column(name="netWt")
	private Double NetWt;
	
	@Column(name="transactionType")
	private String transactionType; //S- sales, SR- sales return, P- purchase, PR- purchase return

	public Integer getStockId() {
		return stockId;
	}

	public void setStockId(Integer stockId) {
		this.stockId = stockId;
	}

	public Integer getTranctionId() {
		return tranctionId;
	}

	public void setTranctionId(Integer tranctionId) {
		this.tranctionId = tranctionId;
	}

	public ProductBean getProductId() {
		return productId;
	}

	public void setProductId(ProductBean productId) {
		this.productId = productId;
	}

	public String getBillNO() {
		return billNO;
	}

	public void setBillNO(String billNO) {
		this.billNO = billNO;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
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

	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}
	
	

}
