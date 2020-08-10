package org.tesseract.persistance;

import java.util.Collection;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.tesseract.entities.StockBean;

public class DashBoardHibernateDao {
	Session session;
	SessionFactory sessionFactory;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Collection<Object> getSalesDetails(String type) {
		Query query = null;
		StringBuilder queryBuilder = new StringBuilder("SELECT COUNT(sb.salesid), SUM(sa.netamount) "
				+ "FROM tesseract.salesBase sb JOIN tesseract.salesamount sa ON sb.salesid = sa.salesid");
		session = getInstance();
		try {
			if (type.equals("TODAY")) {
				queryBuilder.append(" WHERE sb.invoice_date = DATE(NOW())");
				query = session.createSQLQuery(queryBuilder.toString());
			} else if (type.equals("TOTAL")) {
				query = session.createSQLQuery(queryBuilder.toString());
			}
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			closeInstance();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<StockBean> getCurrentStockDetails() {
		session = getInstance();
		try {
			return session.createQuery("FROM StockBean").list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			closeInstance();
		}
		
	}
	
	
	
	
/*********************************ADD YOUR CODES ABOVE THIS LINE*********************************/
	
	public Session getInstance() {
		sessionFactory = new Configuration().configure().buildSessionFactory();
		return sessionFactory.openSession();
	}

	public void closeInstance() {
		session.close();
		sessionFactory.close();
	}

}
