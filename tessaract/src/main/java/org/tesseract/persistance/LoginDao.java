package org.tesseract.persistance;

import org.tesseract.entities.LoginBean;

public interface LoginDao {

	boolean authenticateUser(LoginBean loginBean);

}
