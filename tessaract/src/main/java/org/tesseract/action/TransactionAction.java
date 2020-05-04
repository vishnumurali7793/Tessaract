package org.tesseract.action;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.tesseract.entities.ProductBean;
import org.tesseract.entities.PurchaseAmountBean;
import org.tesseract.entities.PurchaseBean;
import org.tesseract.entities.PurchaseScreenBean;
import org.tesseract.entities.VendorBean;
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
	
	public String getProductListForPurchase() {
		prodList = masterHibernateDao.getProductList();
		return SUCCESS;
	}
	
	public String editPurchaseDetails() {
		if(purchaseBean !=null && purchaseBean.getPurchaseId() != null){
		prodDetList=transHibernateDao.getProductDetailsList(purchaseBean.getPurchaseId());
		purchaseamtBean=transHibernateDao.getProducttotamt(purchaseBean.getPurchaseId());
		}
		return SUCCESS;
	}
	
	public String savepurchaseform (){
		if(checkbox != null && checkbox.length > 0 && purchaseBean.getPurchaseId() != null){
			for(String chboxdata : checkbox){
					purchaseDetails= new PurchaseScreenBean();
					purchaseDetails.setProductId(new ProductBean());
					purchaseDetails.getProductId().setProductId(Integer.parseInt(chboxdata));
					purchaseDetails.setPurchaseId(new PurchaseBean());
					purchaseDetails.getPurchaseId().setPurchaseId(purchaseBean.getPurchaseId());
					transHibernateDao.savepurchasedetails(purchaseDetails);
			}
		}
		return SUCCESS;
	}
	
	public String savepurchaseDetails(){
		if(prodDetList != null && purchaseBean.getPurchaseId() != null){
			List<PurchaseScreenBean>  newprodlist= new ArrayList<PurchaseScreenBean>();
	         newprodlist=transHibernateDao.getProductDetailsList(purchaseBean.getPurchaseId());
			int i=0;
			for(PurchaseScreenBean pd:prodDetList){
				pd.setProductId(newprodlist.get(i).getProductId());
				pd.setPurchaseId(new PurchaseBean());
				pd.getPurchaseId().setPurchaseId(newprodlist.get(i).getPurchaseId().getPurchaseId());
				pd.setPurchaseScreenId(newprodlist.get(i).getPurchaseScreenId());
				transHibernateDao.savepurchasedetails(pd);
				
				i++;
			}
			purchaseamtBean.setPurchaseId(new PurchaseBean());
			purchaseamtBean.getPurchaseId().setPurchaseId(purchaseBean.getPurchaseId());
			transHibernateDao.savepurchasenetamt(purchaseamtBean);
		}
		return SUCCESS;
	}
	
	//delete purchasedata
	public String deletePurchase() {
		if(purchaseDetails.getPurchaseScreenId() != null) {
			transHibernateDao.deletePurchaseById(purchaseDetails);
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

}
