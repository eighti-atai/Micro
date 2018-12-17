package com.atai.micro.module.enterp.dao;

import com.atai.micro.module.enterp.model.User;

public interface UserDao {

	void addUser(User user);

	User findByUserId(int userId);

	User findByUserName(String userName);

}