package org.tesseract.service;

import org.tesseract.entities.LoginBean;
import org.tesseract.persistance.LoginDao;

public class LoginDaoService implements LoginService {

	LoginDao loginDao;

	public boolean authenticateUser(LoginBean loginBean) {
		return loginDao.authenticateUser(loginBean);
	}

}
