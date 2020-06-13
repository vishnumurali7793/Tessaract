package org.tesseract.action;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.tesseract.entities.CustomerBean;
import org.tesseract.entities.ProductBean;
import org.tesseract.entities.PurchaseAmountBean;
import org.tesseract.entities.PurchaseBean;
import org.tesseract.entities.PurchaseScreenBean;
import org.tesseract.entities.SalesAmountBean;
import org.tesseract.entities.SalesBase;
import org.tesseract.entities.SalesDetailsBean;
import org.tesseract.entities.StockBean;
import org.tesseract.entities.VendorBean;
import org.tesseract.entities.modelBean;
import org.tesseract.persistance.MasterHibernateDao;
import org.tesseract.persistance.TransactionHibernateDao;

import com.opensymphony.xwork2.ActionSupport;

public class TransactionAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private TransactionHibernateDao transHibernateDao = new TransactionHibernateDao();
	private MasterHibernateDao masterHibernateDao = new MasterHibernateDao();
	private PurchaseBean purchaseBean;
	private List<PurchaseBean> purbeanList;
	private Collection<Object> vendorList;
	private String[] checkbox;
	private PurchaseScreenBean purchaseDetails;
	private List<ProductBean> prodList;
	private List<PurchaseScreenBean> prodDetList;
	private PurchaseAmountBean purchaseamtBean;
	private StockBean stockBean;
	private SalesBase salesBase;
	private List<SalesBase> salesBaseList;
	private Collection<Object> customerList;
	private SalesDetailsBean salesdetils;
	private List<SalesDetailsBean> salDetList;
	private SalesAmountBean salesamtbean;

	// vendor page action
	public String savepurchaseVendor() {
		if (purchaseBean != null) {
			Integer vendid = transHibernateDao.getvendorDetails(purchaseBean.getVendor().getVendorCode());
			purchaseBean.setVendor(new VendorBean());
			purchaseBean.getVendor().setVendorId(vendid);
			transHibernateDao.addPurchasevendor(purchaseBean);
			return SUCCESS;
		}

		return INPUT;
	}

	public String getVendorDetails() throws Exception {
		if (purchaseBean != null && purchaseBean.getVendor() != null) {
			vendorList = new ArrayList<Object>();
			vendorList = transHibernateDao.getVendorListByVendorCode(purchaseBean.getVendor().getVendorCode());
		}
		return SUCCESS;
	}

	public String getmodalForPurchase() {
		String invoiceNo = "";
		String newInvc = null;
		int year = 0;
		Integer invoival = transHibernateDao.invoicePurchase();
		int abc = 0;
		if (invoival != null) {
			abc = invoival + 1;
			Date dt = new Date();
			year = LocalDate.parse(new SimpleDateFormat("yyyy-MM-dd").format(dt)).getYear();
			newInvc = "SS/" + abc + "/" + year;
		} else {
			newInvc = "SS/" + "1" + "/" + year;
		}
		try {
			purchaseBean = new PurchaseBean();
			purchaseBean.setInvoice(newInvc);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String getProductListForPurchase() {
		prodList = masterHibernateDao.getProductList();
		return SUCCESS;
	}

	public String editPurchaseDetails() {
		if (purchaseBean != null && purchaseBean.getPurchaseId() != null) {
			prodDetList = transHibernateDao.getProductDetailsList(purchaseBean.getPurchaseId());
			purchaseamtBean = transHibernateDao.getProducttotamt(purchaseBean.getPurchaseId());
		}
		return SUCCESS;
	}

	public String savepurchaseform() {
		if (checkbox != null && checkbox.length > 0 && purchaseBean.getPurchaseId() != null) {
			for (String chboxdata : checkbox) {
				purchaseDetails = new PurchaseScreenBean();
				purchaseDetails.setProductId(new ProductBean());
				purchaseDetails.getProductId().setProductId(Integer.parseInt(chboxdata));
				purchaseDetails.setPurchaseId(new PurchaseBean());
				purchaseDetails.getPurchaseId().setPurchaseId(purchaseBean.getPurchaseId());
				transHibernateDao.savepurchasedetails(purchaseDetails);
			}
		}
		return SUCCESS;
	}

	public String savepurchaseDetails() {
		if (prodDetList != null && purchaseBean.getPurchaseId() != null) {
			List<PurchaseScreenBean> newprodlist = new ArrayList<PurchaseScreenBean>();
			newprodlist = transHibernateDao.getProductDetailsList(purchaseBean.getPurchaseId());
			int i = 0;
			for (PurchaseScreenBean pd : prodDetList) {
				pd.setProductId(newprodlist.get(i).getProductId());
				pd.setPurchaseId(new PurchaseBean());
				pd.getPurchaseId().setPurchaseId(newprodlist.get(i).getPurchaseId().getPurchaseId());
				pd.setPurchaseScreenId(newprodlist.get(i).getPurchaseScreenId());
				transHibernateDao.savepurchasedetails(pd);

				stockBean = new StockBean();
				stockBean.setProductId(new ProductBean());
				stockBean.getProductId().setProductId(newprodlist.get(i).getProductId().getProductId());
				stockBean.setPurchaseId(new PurchaseBean());
				stockBean.getPurchaseId().setPurchaseId(newprodlist.get(i).getPurchaseId().getPurchaseId());
				stockBean.setDate(new Date());
				stockBean.setNetWt(pd.getNetweight());
				stockBean.setQuantity(pd.getQuantity());
				transHibernateDao.savestockDetails(stockBean);
				i++;
			}
			purchaseamtBean.setPurchaseId(new PurchaseBean());
			purchaseamtBean.getPurchaseId().setPurchaseId(purchaseBean.getPurchaseId());
			transHibernateDao.savepurchasenetamt(purchaseamtBean);
		}
		return SUCCESS;
	}

	// delete purchasedata
	public String deletePurchase() {
		if (purchaseDetails.getPurchaseScreenId() != null) {
			transHibernateDao.deletePurchaseById(purchaseDetails);
		}
		return SUCCESS;
	}

	public String getmodalForSales() {
		String invoiceNo = "";
		String newInvc = null;
		int year = 0;
		Integer invoival = transHibernateDao.invoiceSales();
		int abc = 0;
		if (invoival != null) {
			abc = invoival + 1;
			Date dt = new Date();
			year = LocalDate.parse(new SimpleDateFormat("yyyy-MM-dd").format(dt)).getYear();
			newInvc = "SS/" + abc + "/" + year;
		} else {
			newInvc = "SS/" + "1" + "/" + year;
		}
		try {
			salesBase = new SalesBase();
			salesBase.setInvoice(newInvc);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String getCustomerDetails() throws Exception {
		if (salesBase != null && salesBase.getCustomerId() != null) {
			customerList = new ArrayList<Object>();
			customerList = transHibernateDao.getCustomerListByCustCode(salesBase.getCustomerId().getCustomerCode());
		}
		return SUCCESS;
	}

	// sales page action
	public String savesalescustomer() {
		if (salesBase != null) {
			Integer cusid = transHibernateDao.getcustomerDetails(salesBase.getCustomerId().getCustomerCode());
			salesBase.setCustomerId(new CustomerBean());
			salesBase.getCustomerId().setCustomerId(cusid);
			transHibernateDao.addSalesdata(salesBase);
			return SUCCESS;
		}

		return INPUT;
	}

	public String editsalesDetails() {
		if (salesBase != null && salesBase.getSalesId() != null) {
			salDetList = transHibernateDao.getSalesDetailsList(salesBase.getSalesId());
			salesamtbean = transHibernateDao.getsalestotamt(salesBase.getSalesId());
		}
		return SUCCESS;
	}

	public String getProductListForSales() {
		prodList = masterHibernateDao.getProductList();
		return SUCCESS;
	}

	public String saveSalesform() {
		if (checkbox != null && checkbox.length > 0 && salesBase.getSalesId() != null) {
			for (String chboxdata : checkbox) {
				salesdetils = new SalesDetailsBean();
				salesdetils.setProductId(new ProductBean());
				salesdetils.getProductId().setProductId(Integer.parseInt(chboxdata));
				salesdetils.setSalesid(new SalesBase());
				salesdetils.getSalesid().setSalesId(salesBase.getSalesId());
				transHibernateDao.saveSalesdetails(salesdetils);
			}
		}
		return SUCCESS;
	}

	public String saveSAlesDetails() {
		if (salDetList != null && salesBase.getSalesId() != null) {
			List<SalesDetailsBean> newsalelist = new ArrayList<SalesDetailsBean>();
			newsalelist = transHibernateDao.getSalesDetailsList(salesBase.getSalesId());
			int i = 0;
			for (SalesDetailsBean pd : salDetList) {
				pd.setProductId(newsalelist.get(i).getProductId());
				pd.setSalesid(new SalesBase());
				pd.getSalesid().setSalesId(newsalelist.get(i).getSalesid().getSalesId());
				pd.setSalesDetailsId(newsalelist.get(i).getSalesDetailsId());
				transHibernateDao.saveSalesdetails(pd);
				i++;
			}
			salesamtbean.setSalesid(new SalesBase());
			salesamtbean.getSalesid().setSalesId(salesBase.getSalesId());
			transHibernateDao.savesalesnetamt(salesamtbean);
		}
		return SUCCESS;
	}

	// delete salesdata
	public String deletesalesdet() {
		if (salesdetils.getSalesDetailsId() != null) {
			transHibernateDao.delsalesById(salesdetils);
		}
		return SUCCESS;
	}

	public PurchaseBean getPurchaseBean() {
		return purchaseBean;
	}

	public void setPurchaseBean(PurchaseBean purchaseBean) {
		this.purchaseBean = purchaseBean;
	}

	public List<PurchaseBean> getPurbeanList() {
		return purbeanList;
	}

	public void setPurbeanList(List<PurchaseBean> purbeanList) {
		this.purbeanList = purbeanList;
	}

	public Collection<Object> getVendorList() {
		return vendorList;
	}

	public void setVendorList(Collection<Object> vendorList) {
		this.vendorList = vendorList;
	}

	public String[] getCheckbox() {
		return checkbox;
	}

	public void setCheckbox(String[] checkbox) {
		this.checkbox = checkbox;
	}

	public PurchaseScreenBean getPurchaseDetails() {
		return purchaseDetails;
	}

	public void setPurchaseDetails(PurchaseScreenBean purchaseDetails) {
		this.purchaseDetails = purchaseDetails;
	}

	public List<ProductBean> getProdList() {
		return prodList;
	}

	public void setProdList(List<ProductBean> prodList) {
		this.prodList = prodList;
	}

	public List<PurchaseScreenBean> getProdDetList() {
		return prodDetList;
	}

	public void setProdDetList(List<PurchaseScreenBean> prodDetList) {
		this.prodDetList = prodDetList;
	}

	public PurchaseAmountBean getPurchaseamtBean() {
		return purchaseamtBean;
	}

	public void setPurchaseamtBean(PurchaseAmountBean purchaseamtBean) {
		this.purchaseamtBean = purchaseamtBean;
	}

	public StockBean getStockBean() {
		return stockBean;
	}

	public void setStockBean(StockBean stockBean) {
		this.stockBean = stockBean;
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

	public Collection<Object> getCustomerList() {
		return customerList;
	}

	public void setCustomerList(Collection<Object> customerList) {
		this.customerList = customerList;
	}

	public SalesDetailsBean getSalesdetils() {
		return salesdetils;
	}

	public void setSalesdetils(SalesDetailsBean salesdetils) {
		this.salesdetils = salesdetils;
	}

	public List<SalesDetailsBean> getSalDetList() {
		return salDetList;
	}

	public void setSalDetList(List<SalesDetailsBean> salDetList) {
		this.salDetList = salDetList;
	}

	public SalesAmountBean getSalesamtbean() {
		return salesamtbean;
	}

	public void setSalesamtbean(SalesAmountBean salesamtbean) {
		this.salesamtbean = salesamtbean;
	}

}
