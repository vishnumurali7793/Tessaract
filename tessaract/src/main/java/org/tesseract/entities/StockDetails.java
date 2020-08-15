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
@Table(schema = "tesseract", catalog = "tesseract", name = "stockDetails")
public class StockDetails {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="stockId")
	private StockBean StockBaseId;
	
	@Column(name = "tranctionId")
	private Integer tranctionId;//purchaeid or SaleSid
	
	@Column(name="billNO")
	private String billNO;
	
	@Column(name="month")
	private String month;
	
	@Column(name="year")
	private String year;
	
	@Column(name="updatedOn")
	private Date updatedOn;
	
	@Column(name="transactionType")
	private String transactionType; //S- sales, SR- sales return, P- purchase, PR- purchase return
	
	@Column(name="stockQuantity")
	private Double stockQuantity;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getTranctionId() {
		return tranctionId;
	}

	public void setTranctionId(Integer tranctionId) {
		this.tranctionId = tranctionId;
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

	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	public StockBean getStockBaseId() {
		return StockBaseId;
	}

	public void setStockBaseId(StockBean stockBaseId) {
		StockBaseId = stockBaseId;
	}

	public Double getStockQuantity() {
		return stockQuantity;
	}

	public void setStockQuantity(Double stockQuantity) {
		this.stockQuantity = stockQuantity;
	}

}
