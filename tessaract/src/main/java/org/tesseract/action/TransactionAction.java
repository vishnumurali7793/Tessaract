package org.tesseract.action;

import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.tesseract.entities.CustomerBean;
import org.tesseract.entities.ProductBean;
import org.tesseract.entities.PurchaseAmountBean;
import org.tesseract.entities.PurchaseBean;
import org.tesseract.entities.PurchaseReturnAmountBean;
import org.tesseract.entities.PurchaseReturnScreenBean;
import org.tesseract.entities.PurchaseScreenBean;
import org.tesseract.entities.SalesAmountBean;
import org.tesseract.entities.SalesBase;
import org.tesseract.entities.SalesDetailsBean;
import org.tesseract.entities.SalesReturnAmountBean;
import org.tesseract.entities.SalesReturnDetailsBean;
import org.tesseract.entities.StockBean;
import org.tesseract.entities.StockDetails;
import org.tesseract.entities.VendorBean;
import org.tesseract.persistance.MasterHibernateDao;
import org.tesseract.persistance.TransactionHibernateDao;

import com.opensymphony.xwork2.ActionSupport;

public class TransactionAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> session;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private TransactionHibernateDao transHibernateDao = new TransactionHibernateDao();
	private MasterHibernateDao masterHibernateDao = new MasterHibernateDao();
	private PurchaseBean purchaseBean;
	private Collection<Object> vendorList;
	private String[] checkbox;
	private PurchaseScreenBean purchaseDetails;
	private List<ProductBean> prodList;
	private List<PurchaseScreenBean> prodDetList;
	private PurchaseAmountBean purchaseamtBean;
	private StockBean stockBean;
	private StockDetails Stockdetails;
	private SalesBase salesBase;
	private List<SalesBase> salesBaseList;
	private Collection<Object> customerList;
	private SalesDetailsBean salesdetils;
	private List<SalesDetailsBean> salDetList;
	private SalesAmountBean salesamtbean;
	private String billno;
	private SalesReturnDetailsBean salesreturndetils;
	private List<SalesReturnDetailsBean> salretDetList;
	private SalesReturnAmountBean salesretamtbean;
	private List<PurchaseBean> purchases;
	/*private PurchaseReturnScreenBean purchaseReturnScreenBean;
	private List<PurchaseReturnScreenBean> PurchaseRetlist;
	private PurchaseReturnAmountBean purchaseRetAmtBean;*/

	private PurchaseReturnScreenBean purchaseReturnItem;
	private PurchaseReturnAmountBean purchaseReturnAmount;
	private List<PurchaseReturnScreenBean> purchaseReturnItems;

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
		String newInvc = null;
		int year = 0;
		Integer invoival = transHibernateDao.invoicePurchase();
		int abc = 0;
		if (invoival != null) {
			abc = invoival + 1;
			Date dt = new Date();
			year = LocalDate.parse(new SimpleDateFormat("yyyy-MM-dd").format(dt)).getYear();
			newInvc = "PR/" + abc + "/" + year;
		} else {
			newInvc = "PR/" + "1" + "/" + year;
		}
		try {
			purchaseBean = new PurchaseBean();
			purchaseBean.setInvoice(newInvc);
		} catch (Exception e) {
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
			Double rate=0.00;
			for(PurchaseScreenBean purcr:prodDetList){
				rate=transHibernateDao.getrateByProductForPurchase(purcr.getProductId().getCategory().getCategoryId());
				 purcr.setRate(rate);
			}
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
			PurchaseBean prb=new PurchaseBean();
			prb=transHibernateDao.getPurchaseBaseData(purchaseBean.getPurchaseId());
			LocalDate currentdate = LocalDate.now();
			int currentMonth = currentdate.getMonthValue();
			int currentYear = currentdate.getYear();
			int i = 0;
			for (PurchaseScreenBean pd : prodDetList) {
				pd.setProductId(newprodlist.get(i).getProductId());
				pd.setPurchaseId(new PurchaseBean());
				pd.getPurchaseId().setPurchaseId(newprodlist.get(i).getPurchaseId().getPurchaseId());
				pd.setPurchaseScreenId(newprodlist.get(i).getPurchaseScreenId());
				transHibernateDao.savepurchasedetails(pd);

				StockBean sdet=new StockBean();
				sdet=transHibernateDao.getstockbasedata(newprodlist.get(i).getProductId().getProductId());
				
				stockBean = new StockBean();
				stockBean.setStockId(sdet.getStockId());
				stockBean.setProductId(newprodlist.get(i).getProductId());
				stockBean.setQuantity(sdet.getQuantity()+pd.getQuantity());
				stockBean.setNetWt(sdet.getNetWt()+pd.getNetweight());
				transHibernateDao.savestockBaseData(stockBean);
				
				Stockdetails=new StockDetails();
				Stockdetails.setMonth(currentMonth+"");
				Stockdetails.setYear(currentYear+"");
				Stockdetails.setBillNO(prb.getInvoice());
				Stockdetails.setTranctionId(purchaseBean.getPurchaseId());
				Stockdetails.setTransactionType("P");
				Stockdetails.setStockBaseId(sdet);
				Stockdetails.setUpdatedOn(new Date());
				Stockdetails.setStockQuantity(pd.getQuantity());
				transHibernateDao.savestockprodmapingDetails(Stockdetails);
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
			Double rate=0.00;
			for(SalesDetailsBean purcr:salDetList){
				rate=transHibernateDao.getrateByProductForPurchase(purcr.getProductId().getCategory().getCategoryId());
				 purcr.setRate(rate);
			}
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
			SalesBase Saledet= new SalesBase();
			Saledet=transHibernateDao.getsalesBaseData(salesBase.getSalesId());
			LocalDate currentdate = LocalDate.now();
			int currentMonth = currentdate.getMonthValue();
			int currentYear = currentdate.getYear();
			int i = 0;
			for (SalesDetailsBean pd : salDetList) {
				pd.setProductId(newsalelist.get(i).getProductId());
				pd.setSalesid(new SalesBase());
				pd.getSalesid().setSalesId(newsalelist.get(i).getSalesid().getSalesId());
				pd.setSalesDetailsId(newsalelist.get(i).getSalesDetailsId());
				transHibernateDao.saveSalesdetails(pd);
				
				StockBean sdet=new StockBean();
				sdet=transHibernateDao.getstockbasedata(newsalelist.get(i).getProductId().getProductId());
				
				stockBean = new StockBean();
				stockBean.setStockId(sdet.getStockId());
				stockBean.setProductId(newsalelist.get(i).getProductId());
				stockBean.setQuantity(sdet.getQuantity()-pd.getQuantity());
				stockBean.setNetWt(sdet.getNetWt()-pd.getNetweight());
				transHibernateDao.savestockBaseData(stockBean);
				
				Stockdetails=new StockDetails();
				Stockdetails.setMonth(currentMonth+"");
				Stockdetails.setYear(currentYear+"");
				Stockdetails.setBillNO(Saledet.getInvoice());
				Stockdetails.setTranctionId(salesBase.getSalesId());
				Stockdetails.setTransactionType("S");
				Stockdetails.setStockBaseId(sdet);
				Stockdetails.setUpdatedOn(new Date());
				Stockdetails.setStockQuantity(pd.getQuantity());
				transHibernateDao.savestockprodmapingDetails(Stockdetails);
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

	public String goToSalesReturn() {
		session.put("tab", "transactions");
		session.put("subtab", "salesReturn");
		try {
			salesBaseList = transHibernateDao.searchByBillno(billno);
			for(SalesBase base:salesBaseList){
				base.setSalesReturnStaus(transHibernateDao.getSaletesReturnStatus(base.getSalesId()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String editsalesReturnDetails() throws IllegalAccessException, InvocationTargetException {
		if (salesBase != null && salesBase.getSalesId() != null) {
			salDetList = transHibernateDao.getSalesDetailsList(salesBase.getSalesId());
			salesamtbean = transHibernateDao.getsalestotamt(salesBase.getSalesId());
			salretDetList = new ArrayList<SalesReturnDetailsBean>();
			for (SalesDetailsBean saldetils : salDetList) {
				try {
					saldetils.setSalesDetailsId(null);
					salesreturndetils = new SalesReturnDetailsBean();
					BeanUtils.copyProperties(salesreturndetils, saldetils);
				} catch (Exception e) {
					e.printStackTrace();
				}
				salretDetList.add(salesreturndetils);
			}
			salesretamtbean = new SalesReturnAmountBean();
			BeanUtils.copyProperties(salesretamtbean, salesamtbean);
		}
		return SUCCESS;
	}

	public String saveSalesReturnDetails() {
		if (salesBase != null && salesBase.getSalesId() != null) {
			List<SalesDetailsBean> newsalelist = new ArrayList<SalesDetailsBean>();
			newsalelist = transHibernateDao.getSalesDetailsList(salesBase.getSalesId());
			SalesBase Saleretdet= new SalesBase();
			Saleretdet=transHibernateDao.getsalesBaseData(salesBase.getSalesId());
			LocalDate currentdate = LocalDate.now();
			int currentMonth = currentdate.getMonthValue();
			int currentYear = currentdate.getYear();
			int i = 0;
			for (SalesReturnDetailsBean salretdetils : salretDetList) {
				salretdetils.setProductId(newsalelist.get(i).getProductId());
				salretdetils.setSalesid(new SalesBase());
				salretdetils.getSalesid().setSalesId(newsalelist.get(i).getSalesid().getSalesId());
				transHibernateDao.saveReturnSalesdetails(salretdetils);
				
				StockBean sdet=new StockBean();
				sdet=transHibernateDao.getstockbasedata(newsalelist.get(i).getProductId().getProductId());
				
				stockBean = new StockBean();
				stockBean.setStockId(sdet.getStockId());
				stockBean.setProductId(newsalelist.get(i).getProductId());
				stockBean.setQuantity(sdet.getQuantity()+salretdetils.getQuantity());
				stockBean.setNetWt(sdet.getNetWt()+salretdetils.getNetweight());
				transHibernateDao.savestockBaseData(stockBean);
				
				Stockdetails=new StockDetails();
				Stockdetails.setMonth(currentMonth+"");
				Stockdetails.setYear(currentYear+"");
				Stockdetails.setBillNO(Saleretdet.getInvoice());
				Stockdetails.setTranctionId(salesBase.getSalesId());
				Stockdetails.setTransactionType("SR");
				Stockdetails.setStockBaseId(sdet);
				Stockdetails.setUpdatedOn(new Date());
				Stockdetails.setStockQuantity(salretdetils.getQuantity());
				transHibernateDao.savestockprodmapingDetails(Stockdetails);
				i++;
			}
			salesretamtbean.setSalesid(new SalesBase());
			salesretamtbean.getSalesid().setSalesId(salesBase.getSalesId());
			transHibernateDao.saveSalesReturnNetAmt(salesretamtbean);

		}
		return SUCCESS;
	}

	public String viewsalesReturnDetails(){
		if (salesBase != null && salesBase.getSalesId() != null) {
			salesreturndetils = new SalesReturnDetailsBean();
			salretDetList = new ArrayList<SalesReturnDetailsBean>();
			salretDetList = transHibernateDao.getSalesretDetailsList(salesBase.getSalesId());
			for(SalesReturnDetailsBean itemsBean :salretDetList){
				Double rate=0.00;
				rate=transHibernateDao.getrateByProductForPurchase(itemsBean.getProductId().getCategory().getCategoryId());
				itemsBean.setRate(rate);
			}
			salesretamtbean = transHibernateDao.getsalesRettotamt(salesBase.getSalesId());
		}
		return SUCCESS;
	}
	// delete salesreturndata
	public String deletesalesretdet() {
		if (salesreturndetils.getSalesDetailsId() != null) {
			transHibernateDao.delsalesretById(salesreturndetils);
		}
		return SUCCESS;
	}

	// purchase return
	public String getPurchaseListForPurchaseReturn() {
		session.put("tab", "transactions");
		session.put("subtab", "purchaseReturn");
		try {
			purchases = transHibernateDao.searchByPurchaseBillno(billno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String getPurchaseditemByBill() throws IllegalAccessException, InvocationTargetException {
		if (purchaseBean.getPurchaseId() != null) {
			purchaseReturnItems = transHibernateDao.getItemListForReturn(purchaseBean.getPurchaseId());
			purchaseamtBean = transHibernateDao.getProducttotamt(purchaseBean.getPurchaseId());
			if (purchaseReturnItems == null || purchaseReturnItems.size() <= 0) {
				prodDetList = transHibernateDao.getProductDetailsList(purchaseBean.getPurchaseId());
				purchaseReturnItems = new ArrayList<PurchaseReturnScreenBean>();
				for (PurchaseScreenBean itemsBean : prodDetList) {
					PurchaseReturnScreenBean returnedItemBean = new PurchaseReturnScreenBean();
					try {
						BeanUtils.copyProperties(returnedItemBean, itemsBean);
						returnedItemBean.setPurchaseReturnScreenId(null);
						transHibernateDao.saveItemListForPurchaseReturn(returnedItemBean);
						Double rate=0.00;
							rate=transHibernateDao.getrateByProductForPurchase(itemsBean.getProductId().getCategory().getCategoryId());
							itemsBean.setRate(rate);
						
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				
				purchaseReturnItems = transHibernateDao.getItemListForReturn(purchaseBean.getPurchaseId());
				purchaseamtBean = transHibernateDao.getProducttotamt(purchaseBean.getPurchaseId());
				PurchaseReturnAmountBean purchaseretamt = new PurchaseReturnAmountBean();
				BeanUtils.copyProperties(purchaseretamt, purchaseamtBean);
				purchaseretamt.setPurchaseReturnAmountId(null);
				transHibernateDao.savePurReturnNetAmt(purchaseretamt);
			}
			purchaseReturnAmount=transHibernateDao.getPurrettotamt(purchaseBean.getPurchaseId());

		}
		return SUCCESS;
	}
	
	public String updatePurchaseReturn() throws IllegalAccessException, InvocationTargetException {
		if (purchaseBean != null && purchaseBean.getPurchaseId() != null) {
			purchaseReturnItem =new PurchaseReturnScreenBean();
			List<PurchaseReturnScreenBean> newpurlist = new ArrayList<PurchaseReturnScreenBean>();
			newpurlist = transHibernateDao.getItemListForReturn(purchaseBean.getPurchaseId());
			PurchaseBean pretdet=new PurchaseBean();
			pretdet=transHibernateDao.getPurchaseBaseData(purchaseBean.getPurchaseId());
			LocalDate currentdate = LocalDate.now();
			int currentMonth = currentdate.getMonthValue();
			int currentYear = currentdate.getYear();
			int i = 0;
			//purchaseReturnItems = transHibernateDao.getItemListForReturn(purchaseBean.getPurchaseId());
			for (PurchaseReturnScreenBean purretdetils : purchaseReturnItems) {
				purretdetils.setProductId(newpurlist.get(i).getProductId());
				BeanUtils.copyProperties(purchaseReturnItem, purretdetils);
				//purretdetils.setPurchaseReturnScreenId(null);
				transHibernateDao.saveItemListForPurchaseReturn(purchaseReturnItem);
				
				
				StockBean sdet=new StockBean();
				sdet=transHibernateDao.getstockbasedata(newpurlist.get(i).getProductId().getProductId());
				
				stockBean = new StockBean();
				stockBean.setStockId(sdet.getStockId());
				stockBean.setProductId(newpurlist.get(i).getProductId());
				stockBean.setQuantity(sdet.getQuantity()-purretdetils.getQuantity());
				stockBean.setNetWt(sdet.getNetWt()-purretdetils.getNetweight());
				transHibernateDao.savestockBaseData(stockBean);
				
				Stockdetails=new StockDetails();
				Stockdetails.setMonth(currentMonth+"");
				Stockdetails.setYear(currentYear+"");
				Stockdetails.setBillNO(pretdet.getInvoice());
				Stockdetails.setTranctionId(purchaseBean.getPurchaseId());
				Stockdetails.setTransactionType("PR");
				Stockdetails.setStockBaseId(sdet);
				Stockdetails.setUpdatedOn(new Date());
				Stockdetails.setStockQuantity(purretdetils.getQuantity());
				transHibernateDao.savestockprodmapingDetails(Stockdetails);
				i++;
			}
			PurchaseReturnAmountBean purchaseRetamt = new PurchaseReturnAmountBean();
			//purchaseRetamt=transHibernateDao.getPurrettotamt(purchaseBean.getPurchaseId());
			purchaseReturnAmount.setPurchaseId(new PurchaseBean());
			purchaseReturnAmount.getPurchaseId().setPurchaseId(purchaseBean.getPurchaseId());
			BeanUtils.copyProperties(purchaseRetamt, purchaseReturnAmount);
			//purchaseRetamt.setPurchaseReturnAmountId(null);
			transHibernateDao.savePurReturnNetAmt(purchaseRetamt);
		}
		return SUCCESS;
	}
	
	
	public PurchaseBean getPurchaseBean() {
		return purchaseBean;
	}

	public void setPurchaseBean(PurchaseBean purchaseBean) {
		this.purchaseBean = purchaseBean;
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

	public String getBillno() {
		return billno;
	}

	public void setBillno(String billno) {
		this.billno = billno;
	}

	public SalesReturnDetailsBean getSalesreturndetils() {
		return salesreturndetils;
	}

	public void setSalesreturndetils(SalesReturnDetailsBean salesreturndetils) {
		this.salesreturndetils = salesreturndetils;
	}

	public List<SalesReturnDetailsBean> getSalretDetList() {
		return salretDetList;
	}

	public void setSalretDetList(List<SalesReturnDetailsBean> salretDetList) {
		this.salretDetList = salretDetList;
	}

	public SalesReturnAmountBean getSalesretamtbean() {
		return salesretamtbean;
	}

	public void setSalesretamtbean(SalesReturnAmountBean salesretamtbean) {
		this.salesretamtbean = salesretamtbean;
	}

	public List<PurchaseBean> getPurchases() {
		return purchases;
	}

	public void setPurchases(List<PurchaseBean> purchases) {
		this.purchases = purchases;
	}

	/*public PurchaseReturnScreenBean getPurchaseReturnScreenBean() {
		return purchaseReturnScreenBean;
	}

	public void setPurchaseReturnScreenBean(PurchaseReturnScreenBean purchaseReturnScreenBean) {
		this.purchaseReturnScreenBean = purchaseReturnScreenBean;
	}

	public PurchaseReturnAmountBean getPurchaseRetAmtBean() {
		return purchaseRetAmtBean;
	}

	public void setPurchaseRetAmtBean(PurchaseReturnAmountBean purchaseRetAmtBean) {
		this.purchaseRetAmtBean = purchaseRetAmtBean;
	}

	public List<PurchaseReturnScreenBean> getPurchaseRetlist() {
		return PurchaseRetlist;
	}

	public void setPurchaseRetlist(List<PurchaseReturnScreenBean> purchaseRetlist) {
		PurchaseRetlist = purchaseRetlist;
	}
*/
	public PurchaseReturnScreenBean getPurchaseReturnItem() {
		return purchaseReturnItem;
	}

	public void setPurchaseReturnItem(PurchaseReturnScreenBean purchaseReturnItem) {
		this.purchaseReturnItem = purchaseReturnItem;
	}

	public PurchaseReturnAmountBean getPurchaseReturnAmount() {
		return purchaseReturnAmount;
	}

	public void setPurchaseReturnAmount(PurchaseReturnAmountBean purchaseReturnAmount) {
		this.purchaseReturnAmount = purchaseReturnAmount;
	}

	public List<PurchaseReturnScreenBean> getPurchaseReturnItems() {
		return purchaseReturnItems;
	}

	public void setPurchaseReturnItems(List<PurchaseReturnScreenBean> purchaseReturnItems) {
		this.purchaseReturnItems = purchaseReturnItems;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}
