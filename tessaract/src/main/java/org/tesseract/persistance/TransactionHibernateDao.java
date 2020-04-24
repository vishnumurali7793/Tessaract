package org.tesseract.persistance;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.tesseract.entities.PurchaseBean;
import org.tesseract.entities.VendorBean;

public class TransactionHibernateDao {
	
	
	
	
	public Integer getvendorDetails(String ss) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		try {
		String qr="SELECT * FROM VendorBean where vendorCode=:vencode";
		StringBuilder sbs=new StringBuilder();
		sbs.append(qr);
		Query q=sessionFactory.getCurrentSession().createQuery(qr.toString()).setParameter("vencode", ss);
		return (Integer) q.uniqueResult();
		}catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			session.close();
		}


	}

	//save purchasevendor data
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
	//autocomplete for vendor code
	@SuppressWarnings("unused")
	public Object addvendordetails(String vendorCode) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
		String qr="FROM VendorBean WHERE vendorCode=:vencode";
		Query q=sessionFactory.getCurrentSession().createQuery(qr).setParameter("vencode", vendorCode);
		return  q.list();
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

}
