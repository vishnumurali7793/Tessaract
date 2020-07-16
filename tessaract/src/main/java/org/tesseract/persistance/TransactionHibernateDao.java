package org.tesseract.persistance;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.tesseract.entities.ProductBean;
import org.tesseract.entities.PurchaseAmountBean;
import org.tesseract.entities.PurchaseBean;
import org.tesseract.entities.PurchaseScreenBean;
import org.tesseract.entities.SalesAmountBean;
import org.tesseract.entities.SalesBase;
import org.tesseract.entities.SalesDetailsBean;
import org.tesseract.entities.SalesReturnAmountBean;
import org.tesseract.entities.SalesReturnDetailsBean;
import org.tesseract.entities.StockBean;
import org.tesseract.entities.VendorBean;

public class TransactionHibernateDao {

	public Integer getvendorDetails(String ss) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		try {
			String qr = "SELECT vendorId FROM VendorBean where vendorCode=:vencode";
			Query q = session.createQuery(qr).setParameter("vencode", ss);
			return (Integer) q.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			session.close();
		}

	}

	// save purchasevendor data
	public void addPurchasevendor(PurchaseBean purBean) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		try {
			session.saveOrUpdate(purBean);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	@SuppressWarnings("unchecked")
	public Collection<Object> getVendorListByVendorCode(String vendorCode) throws Exception {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();

		try {
			return session
					.createQuery("SELECT vendorId, vendorName, vendorCode FROM VendorBean WHERE vendorCode LIKE '%"
							+ vendorCode + "%'")
					.list();
		} catch (Exception e) {
			return null;
		}
	}

	// save purchasedetails data
	public void savepurchasedetails(PurchaseScreenBean purdetailBean) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		try {
			session.saveOrUpdate(purdetailBean);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	// get productdetails list
	@SuppressWarnings("unchecked")
	public List<PurchaseScreenBean> getProductDetailsList(Integer purchasedetid) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		try {
			return session.createQuery(
					"from PurchaseScreenBean as a where a.purchaseId.purchaseId=:purdetarg and a.deleteStatus='N'")
					.setParameter("purdetarg", purchasedetid).list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}

	}

	// save purchasetotnetamt data
	public void savepurchasenetamt(PurchaseAmountBean purtotnetamtBean) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		try {
			session.saveOrUpdate(purtotnetamtBean);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	// get productamttot
	@SuppressWarnings("unchecked")
	public PurchaseAmountBean getProducttotamt(Integer purchasedetid) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		try {
			return (PurchaseAmountBean) session
					.createQuery("from PurchaseAmountBean where purchaseId.purchaseId=:purdetarg")
					.setParameter("purdetarg", purchasedetid).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}

	}

	// delete purchasedetails
	public void deletePurchaseById(PurchaseScreenBean purchaseBean) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		try {
			session.createQuery(
					"update PurchaseScreenBean as p set p.deleteStatus='Y' where p.purchaseScreenId=:purchaseScreenId")
					.setParameter("purchaseScreenId", purchaseBean.getPurchaseScreenId()).executeUpdate();
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	// invoiceno for purchase
	public Integer invoicePurchase() {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			String qr = "SELECT COUNT(*)  FROM PurchaseBean";
			Long count = (Long) session.createQuery(qr).uniqueResult();
			return count.intValue();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			session.close();
		}
	}

	// save stock
	public void savestockDetails(StockBean stockBean) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		try {
			session.saveOrUpdate(stockBean);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	// invoiceno for sales
	public Integer invoiceSales() {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			String qr = "SELECT COUNT(*)  FROM SalesBase";
			Long count = (Long) session.createQuery(qr).uniqueResult();
			return count.intValue();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			session.close();
		}
	}

	@SuppressWarnings("unchecked")
	public Collection<Object> getCustomerListByCustCode(String custCode) throws Exception {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();

		try {
			return session.createQuery(
					"SELECT customerCode, customerName, contact FROM CustomerBean WHERE customerCode LIKE '%" + custCode
							+ "%'")
					.list();
		} catch (Exception e) {
			return null;
		}
	}

	public Integer getcustomerDetails(String ss) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		try {
			String qr = "SELECT customerId FROM CustomerBean where customerCode=:custcode";
			Query q = session.createQuery(qr).setParameter("custcode", ss);
			return (Integer) q.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			session.close();
		}

	}

	// save sales data
	public void addSalesdata(SalesBase salesbase) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		try {
			session.saveOrUpdate(salesbase);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	// get salesdetails list
	@SuppressWarnings("unchecked")
	public List<SalesDetailsBean> getSalesDetailsList(Integer salesdetid) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		try {
			return session
					.createQuery("from SalesDetailsBean as a where a.salesid.salesId=:sales and a.deleteStatus='N'")
					.setParameter("sales", salesdetid).list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}

	}

	// get productamttot
	@SuppressWarnings("unchecked")
	public SalesAmountBean getsalestotamt(Integer salesdetid) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		try {
			return (SalesAmountBean) session.createQuery("from SalesAmountBean where salesid.salesId=:sales")
					.setParameter("sales", salesdetid).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}

	}

	// save purchasedetails data
	public void saveSalesdetails(SalesDetailsBean salesdetailBean) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		try {
			session.saveOrUpdate(salesdetailBean);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	// save salestotnetamt data
	public void savesalesnetamt(SalesAmountBean salnetamtBean) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		try {
			session.saveOrUpdate(salnetamtBean);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	// delete salesdetails
	public void deleteSalesById(SalesDetailsBean salesBean) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		try {
			session.createQuery(
					"update SalesDetailsBean as p set p.deleteStatus='Y' where p.salesDetailsId=:salesdetId")
					.setParameter("salesdetId", salesBean.getSalesDetailsId()).executeUpdate();
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	// delete updte in salesdetails
	public void delsalesById(SalesDetailsBean prodBean) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		try {
			session.createQuery("UPDATE SalesDetailsBean SET deleteStatus = 'Y' WHERE salesDetailsId=:detailsId")
					.setParameter("detailsId", prodBean.getSalesDetailsId()).executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
			sessionFactory.close();
		}

	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<SalesBase> searchByBillno(String billno) throws Exception {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();

		try {
			String query="";
			if(billno == null){
				query="FROM SalesBase";
			}else{
				query="FROM SalesBase WHERE invoice LIKE '%" + billno + "%'";
			}
			return (ArrayList<SalesBase>) session.createQuery(query).list();
		} catch (Exception e) {
			return null;
		}
	}
	
	// delete updte in salesdetails
		public void delsalesretById(SalesReturnDetailsBean retBean) {
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			Session session = sessionFactory.openSession();
			session.beginTransaction();

			try {
				session.createQuery("UPDATE SalesReturnDetailsBean SET deleteStatus = 'Y' WHERE salesDetailsReturnId=:detailsId")
						.setParameter("detailsId", retBean.getSalesDetailsId()).executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
				sessionFactory.close();
			}

		}
		
		// save salesreturndetails data
		public void saveReturnSalesdetails(SalesReturnDetailsBean salesretdetailBean) {
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();

			try {
				session.saveOrUpdate(salesretdetailBean);
				transaction.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}

		}
		
		// save salesreturntotnetamt data
		public void saveSalesReturnNetAmt(SalesReturnAmountBean salretnetamtBean) {
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();

			try {
				session.saveOrUpdate(salretnetamtBean);
				transaction.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}

		}

}
