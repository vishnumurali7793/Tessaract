package org.tesseract.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.tesseract.entities.CaratBean;
import org.tesseract.entities.CategoryBean;
import org.tesseract.entities.CustomerBean;
import org.tesseract.entities.ProductBean;
import org.tesseract.entities.PurchaseBean;
import org.tesseract.entities.RateBean;
import org.tesseract.entities.SalesBase;
import org.tesseract.entities.TaxBean;
import org.tesseract.entities.VendorBean;
import org.tesseract.entities.modelBean;
import org.tesseract.persistance.MasterHibernateDao;

import com.opensymphony.xwork2.ActionSupport;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class RedirAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware{

	private static final long serialVersionUID = 1L;
	private Map<String, Object> session;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private List<TaxBean> taxList;
	private List<CategoryBean> catList;
	private List<ProductBean> prodList;
	private List<modelBean> modelList;
	private List<CaratBean> caratList;
	private List<RateBean> rateList;
	private List<CustomerBean> customerList;
	private List<VendorBean> vendorList;
	private List<PurchaseBean> purchaseList;
	private PurchaseBean purchaseBean;
	private SalesBase salesBase;
	private List<SalesBase> salesBaseList;
	
	private MasterHibernateDao masterHibernateDao = new MasterHibernateDao();

	public String goToTaxMaster() {
		session.put("subtab", "tax");
		taxList = masterHibernateDao.getTaxList();
		return SUCCESS;
	}
	
	public String goToCategory() {
		session.put("subtab", "category");
		catList = masterHibernateDao.getCategryList();
		caratList = masterHibernateDao.getCaratList();
		return SUCCESS;
	}
	
	public String goToProduct() {
		session.put("subtab", "product");
		prodList = masterHibernateDao.getProductList();
		catList = masterHibernateDao.getCategryList();
		modelList = masterHibernateDao.getModelList();
		return SUCCESS;
	}
	
	public String goToModel() {
		session.put("subtab", "model");
		modelList = masterHibernateDao.getModelList();
		return SUCCESS;
	}
	
	public String goToCarat() {
		session.put("subtab", "karat");
		caratList = masterHibernateDao.getCaratList();
		return SUCCESS;
	}
	
	public String goToRate() {
		session.put("subtab", "rate");
		rateList = masterHibernateDao.getRateList();
		catList = masterHibernateDao.getCategryList();
		caratList = masterHibernateDao.getCaratList();
		return SUCCESS;
	}
	
	public String goToCustomer() {
		session.put("subtab", "customer");
		customerList = masterHibernateDao.getCustomerList();
		return SUCCESS;
	}
	
	public String goToVendor() {
		session.put("subtab", "vendor");
		vendorList = masterHibernateDao.getVendorList();
		return SUCCESS;
	}
	
	public String goToPurchase() {
		purchaseList = masterHibernateDao.getPurchaseList();
		return SUCCESS;
	}
	
	public String goToSales() {
		salesBaseList = masterHibernateDao.getSalesList();
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

	public List<RateBean> getRateList() {
		return rateList;
	}

	public void setRateList(List<RateBean> rateList) {
		this.rateList = rateList;
	}

	public List<CustomerBean> getCustomerList() {
		return customerList;
	}

	public void setCustomerList(List<CustomerBean> customerList) {
		this.customerList = customerList;
	}

	public List<VendorBean> getVendorList() {
		return vendorList;
	}

	public void setVendorList(List<VendorBean> vendorList) {
		this.vendorList = vendorList;
	}

	public List<PurchaseBean> getPurchaseList() {
		return purchaseList;
	}

	public void setPurchaseList(List<PurchaseBean> purchaseList) {
		this.purchaseList = purchaseList;
	}

	public PurchaseBean getPurchaseBean() {
		return purchaseBean;
	}

	public void setPurchaseBean(PurchaseBean purchaseBean) {
		this.purchaseBean = purchaseBean;
	}

	public SalesBase getSalesBase() {
		return salesBase;
	}

	public void setSalesBase(SalesBase salesBase) {
		this.salesBase = salesBase;
	}

	public List<SalesBase> getSalesBaseList() {
		return salesBaseList;
	}

	public void setSalesBaseList(List<SalesBase> salesBaseList) {
		this.salesBaseList = salesBaseList;
	}

	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session = session;
		
	}

	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response = response;
		
	}

	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
		
	}
	
	

}
