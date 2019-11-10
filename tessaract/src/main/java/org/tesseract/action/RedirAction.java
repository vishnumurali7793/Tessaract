package org.tesseract.action;

import java.util.List;

import org.tesseract.entities.CategoryBean;
import org.tesseract.entities.ProductBean;
import org.tesseract.entities.TaxBean;
import org.tesseract.persistance.MasterHibernateDao;

import com.opensymphony.xwork2.ActionSupport;

public class RedirAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	private List<TaxBean> taxList;
	private List<CategoryBean> catList;
	private List<ProductBean> prodList;
	
	private MasterHibernateDao masterHibernateDao = new MasterHibernateDao();

	public String goToTaxMaster() {
		taxList = masterHibernateDao.getTaxList();
		return SUCCESS;
	}
	
	public String goToCategory() {
		catList = masterHibernateDao.getCategryList();
		return SUCCESS;
	}
	
	public String goToProduct() {
		prodList = masterHibernateDao.getProductList();
		return SUCCESS;
	}
	
	public String goToHome() {
		return SUCCESS;
	}

	public List<TaxBean> getTaxList() {
		return taxList;
	}

	public void setTaxList(List<TaxBean> taxList) {
		this.taxList = taxList;
	}

	public List<CategoryBean> getCatList() {
		return catList;
	}

	public void setCatList(List<CategoryBean> catList) {
		this.catList = catList;
	}

	public List<ProductBean> getProdList() {
		return prodList;
	}

	public void setProdList(List<ProductBean> prodList) {
		this.prodList = prodList;
	}
	
	

}
