package org.tesseract.service;

import org.tesseract.entities.LoginBean;

public interface LoginService {

	public boolean authenticateUser(LoginBean loginBean);

}
