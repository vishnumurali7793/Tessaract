package org.tesseract.action;

import java.util.List;

import org.tesseract.entities.CaratBean;
import org.tesseract.entities.CategoryBean;
import org.tesseract.entities.ProductBean;
import org.tesseract.entities.TaxBean;
import org.tesseract.entities.modelBean;
import org.tesseract.persistance.MasterHibernateDao;

import com.opensymphony.xwork2.ActionSupport;

public class RedirAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	private List<TaxBean> taxList;
	private List<CategoryBean> catList;
	private List<ProductBean> prodList;
	private List<modelBean> modelList;
	private List<CaratBean> caratList;
	
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
		catList = masterHibernateDao.getCategryList();
		return SUCCESS;
	}
	
	public String goToModel() {
		modelList = masterHibernateDao.getModelList();
		return SUCCESS;
	}
	
	public String goToCarat() {
		caratList = masterHibernateDao.getCaratList();
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

	public List<modelBean> getModelList() {
		return modelList;
	}

	public void setModelList(List<modelBean> modelList) {
		this.modelList = modelList;
	}

	public List<CaratBean> getCaratList() {
		return caratList;
	}

	public void setCaratList(List<CaratBean> caratList) {
		this.caratList = caratList;
	}
	
	

}
