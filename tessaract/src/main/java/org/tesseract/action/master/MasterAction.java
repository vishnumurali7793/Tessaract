package org.tesseract.action.master;

import java.util.Date;

import org.tesseract.entities.master.TaxBean;
import org.tesseract.persistance.master.MasterHibernateDao;

import com.opensymphony.xwork2.ActionSupport;

public class MasterAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private TaxBean taxBean;

	private MasterHibernateDao masterHibernateDao = new MasterHibernateDao();

	public String addTax() {
		if (taxBean != null) {
			if ((taxBean.getSgst() > 0 && taxBean.getCgst() > 0) || taxBean.getIgst() > 0) {
				taxBean.setAddedOn(new Date());
				masterHibernateDao.addTax(taxBean);
				return SUCCESS;
			}
		}
		return INPUT;
	}

	public TaxBean getTaxBean() {
		return taxBean;
	}

	public void setTaxBean(TaxBean taxBean) {
		this.taxBean = taxBean;
	}

}
