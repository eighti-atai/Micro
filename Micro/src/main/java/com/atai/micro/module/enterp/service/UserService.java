package com.atai.micro.module.enterp.service;

import com.atai.micro.module.enterp.form.UserForm;
import com.atai.micro.module.enterp.model.User;

public interface UserService {

	void save(UserForm userform);

	User findByUsername(String username);
	
	User findByUserId(int userId);

}