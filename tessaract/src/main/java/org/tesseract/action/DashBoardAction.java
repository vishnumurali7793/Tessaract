package org.tesseract.action;

import java.util.ArrayList;
import java.util.Collection;

import org.tesseract.persistance.DashBoardHibernateDao;

import com.opensymphony.xwork2.ActionSupport;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class DashBoardAction extends ActionSupport{
	private static final long serialVersionUID = 1L;

	/* INSTANTIATIONS */
	private DashBoardHibernateDao dashBoardHibernateDao = new DashBoardHibernateDao();
	
	/* DECLARATIONS */
	private Collection<Object> overallSalesList,
							   currentDaySalesList;
	
	
	/*
	 * TODO:
	 * 1. get total sales till date - amount & count
	 * 2. current date's total sales - amount & count
	 * 3. current date gold, platinum, silver rate
	 * */
	public String getAllSalesData() {
		overallSalesList = new ArrayList<Object>();
		overallSalesList = dashBoardHibernateDao.getSalesDetails("TOTAL");
		return SUCCESS;
	}
	
	public String getTodaysSalesData() {
		currentDaySalesList = new ArrayList<Object>();
		currentDaySalesList = dashBoardHibernateDao.getSalesDetails("TODAY");
		return SUCCESS;
	}
	
}
