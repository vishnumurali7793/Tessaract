package org.tesseract.action;


import java.util.List;

import org.tesseract.entities.TaxBean;
import org.tesseract.persistance.MasterHibernateDao;

import com.opensymphony.xwork2.ActionSupport;

public class MasterAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private TaxBean taxBean;
	
	private List<TaxBean> taxList;

	private MasterHibernateDao masterHibernateDao = new MasterHibernateDao();

	public String addTax() {
		if (taxBean != null) {
			if ((taxBean.getSgst() > 0 && taxBean.getCgst() > 0) || taxBean.getIgst() > 0) {
				masterHibernateDao.addTax(taxBean);
				return SUCCESS;
			}
		}
		return INPUT;
	}
	
	public String deleteTax() {
		if(taxBean!=null && taxBean.getTaxId()!=null) {
			masterHibernateDao.deleteTaxById(taxBean);
		}
		setTaxList(masterHibernateDao.getTaxList());
		return SUCCESS;
	}
	public TaxBean getTaxBean() {
		return taxBean;
	}

	public void setTaxBean(TaxBean taxBean) {
		this.taxBean = taxBean;
	}

	public List<TaxBean> getTaxList() {
		return taxList;
	}

	public void setTaxList(List<TaxBean> taxList) {
		this.taxList = taxList;
	}

}
