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
import org.tesseract.entities.PurchaseBean;
import org.tesseract.entities.PurchaseScreenBean;
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

	public Collection<Object> getVendorListByVendorCode(String vendorCode) throws Exception {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();

		try {
			return session.createQuery("SELECT vendorId, vendorName, vendorCode FROM VendorBean WHERE vendorCode LIKE '%"+ vendorCode +"%'").list();
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
		
		//get productdetails list
				@SuppressWarnings("unchecked")
				public List<PurchaseScreenBean> getProductDetailsList(Integer purchasedetid) {
					SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
					Session session = sessionFactory.openSession();
					session.beginTransaction();

					try {
						return session.createQuery("from PurchaseScreenBean where purchaseId.purchaseId=:purdetarg").setParameter("purdetarg",purchasedetid).list();
					} catch (Exception e) {
						e.printStackTrace();
						return null;
					} finally {
						session.close();
					}

				}
	
}
