package org.tesseract.action;

import java.util.List;

import org.tesseract.entities.master.TaxBean;
import org.tesseract.persistance.master.MasterHibernateDao;

import com.opensymphony.xwork2.ActionSupport;

public class RedirAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	private List<TaxBean> taxList;
	
	private MasterHibernateDao masterHibernateDao = new MasterHibernateDao();

	public String goToTaxMaster() {
		taxList = masterHibernateDao.getTaxList();
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
	
	

}
