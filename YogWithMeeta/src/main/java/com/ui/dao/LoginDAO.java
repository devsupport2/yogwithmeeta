package com.ui.dao;

import com.ui.model.User;

public interface LoginDAO {
	User checkLogin(String email, String password);	
}

