package org.tesseract.persistance.master;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.tesseract.entities.master.TaxBean;

public class MasterHibernateDao {

	public void addTax(TaxBean taxBean) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		try {
			session.saveOrUpdate(taxBean);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	// not using now
	public TaxBean getTaxById(TaxBean taxBean) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		try {
			return session.get(TaxBean.class, taxBean.getTaxId());

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}

	}

	@SuppressWarnings("unchecked")
	public List<TaxBean> getTaxList() {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		try {
			return session.createQuery("from TaxBean where deleteStatus='N'").list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}

	}

	public void deleteTaxById(TaxBean taxBean) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		try {
			session.createQuery("update TaxBean as tax set tax.deleteStatus='Y' where tax.taxId=:taxId")
					.setParameter("taxId", taxBean.getTaxId()).executeUpdate();
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
	}

}
