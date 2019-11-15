package org.tesseract.persistance;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.tesseract.entities.CaratBean;
import org.tesseract.entities.CategoryBean;
import org.tesseract.entities.ProductBean;
import org.tesseract.entities.TaxBean;
import org.tesseract.entities.modelBean;

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
	
	//save category data
	public void addCategorydata(CategoryBean catBean) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		try {
			session.saveOrUpdate(catBean);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

	}
	
	//get category list
	@SuppressWarnings("unchecked")
	public List<CategoryBean> getCategryList() {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		try {
			return session.createQuery("from CategoryBean where deleteStatus='N'").list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}

	}

	//delete category
	public void deleteCategoryById(CategoryBean catBean) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		try {
			session.createQuery("update CategoryBean as cat set cat.deleteStatus='Y' where cat.categoryId=:catId")
					.setParameter("catId", catBean.getCategoryId()).executeUpdate();
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
	}

	// Edit category
		public CategoryBean getCatEditById(CategoryBean catBean) {
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			Session session = sessionFactory.openSession();
			session.beginTransaction();

			try {
				return session.get(CategoryBean.class, catBean.getCategoryId());

			} catch (Exception e) {
				e.printStackTrace();
				return null;
			} finally {
				session.close();
			}

		}

		//save product data
		public void addProductdata(ProductBean prodBean) {
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();

			try {
				session.saveOrUpdate(prodBean);
				transaction.commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}

		}
		//get product list
		@SuppressWarnings("unchecked")
		public List<ProductBean> getProductList() {
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			Session session = sessionFactory.openSession();
			session.beginTransaction();

			try {
				return session.createQuery("from ProductBean where deleteStatus='N'").list();
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			} finally {
				session.close();
			}

		}
		
		//delete product
		public void deleteProductById(ProductBean productBean) {
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();

			try {
				session.createQuery("update ProductBean as por set por.deleteStatus='Y' where por.productId=:productId")
						.setParameter("productId", productBean.getProductId()).executeUpdate();
				transaction.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
		}
		
		// Edit product
				public ProductBean getProdEditById(ProductBean prodBean) {
					SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
					Session session = sessionFactory.openSession();
					session.beginTransaction();

					try {
						return session.get(ProductBean.class, prodBean.getProductId());

					} catch (Exception e) {
						e.printStackTrace();
						return null;
					} finally {
						session.close();
					}

				}
				
				//get model list
				@SuppressWarnings("unchecked")
				public List<modelBean> getModelList() {
					SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
					Session session = sessionFactory.openSession();
					session.beginTransaction();

					try {
						return session.createQuery("from modelBean where deleteStatus='N'").list();
					} catch (Exception e) {
						e.printStackTrace();
						return null;
					} finally {
						session.close();
					}

				}
				
				public void saveModell(modelBean modelBean) {
					SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
					Session session = sessionFactory.openSession();
					Transaction transaction = session.beginTransaction();

					try {
						session.saveOrUpdate(modelBean);
						transaction.commit();
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						session.close();
					}

				}
				
				//delete model
				public void deleteModelById(modelBean modelBean) {
					SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
					Session session = sessionFactory.openSession();
					Transaction transaction = session.beginTransaction();

					try {
						session.createQuery("update modelBean as mol set mol.deleteStatus='Y' where mol.modelId=:modelId")
								.setParameter("modelId", modelBean.getModelId()).executeUpdate();
						transaction.commit();
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						session.close();
					}
				}
				// Edit model
				public modelBean getModelEditById(modelBean modBean) {
					SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
					Session session = sessionFactory.openSession();
					session.beginTransaction();

					try {
						return session.get(modelBean.class, modBean.getModelId());

					} catch (Exception e) {
						e.printStackTrace();
						return null;
					} finally {
						session.close();
					}

				}
				
				//get carat list
				@SuppressWarnings("unchecked")
				public List<CaratBean> getCaratList() {
					SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
					Session session = sessionFactory.openSession();
					session.beginTransaction();

					try {
						return session.createQuery("from CaratBean where deleteStatus='N'").list();
					} catch (Exception e) {
						e.printStackTrace();
						return null;
					} finally {
						session.close();
					}

				}
				
				//save category data
				public void addCaratdata(CaratBean caratBean) {
					SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
					Session session = sessionFactory.openSession();
					Transaction transaction = session.beginTransaction();

					try {
						session.saveOrUpdate(caratBean);
						transaction.commit();
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						session.close();
					}

				}
				
				//delete carat
				public void deleteCaratById(CaratBean caratBean) {
					SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
					Session session = sessionFactory.openSession();
					Transaction transaction = session.beginTransaction();

					try {
						session.createQuery("update CaratBean as car set car.deleteStatus='Y' where car.caratId=:carId")
								.setParameter("carId", caratBean.getCaratId()).executeUpdate();
						transaction.commit();
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						session.close();
					}
				}
				
				// Edit carat
				public CaratBean getCaratEditById(CaratBean carBean) {
					SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
					Session session = sessionFactory.openSession();
					session.beginTransaction();

					try {
						return session.get(CaratBean.class, carBean.getCaratId());

					} catch (Exception e) {
						e.printStackTrace();
						return null;
					} finally {
						session.close();
					}

				}
}
