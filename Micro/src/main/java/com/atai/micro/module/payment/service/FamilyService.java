package com.atai.micro.module.payment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atai.micro.generic.service.AbstractService;
import com.atai.micro.module.payment.dao.FamilyDao;
import com.atai.micro.module.payment.model.Family;
import com.atai.micro.module.payment.model.FamilyKey;

@Service
public class FamilyService extends AbstractService<FamilyKey, Family>{

	@Autowired
	public FamilyService(FamilyDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}
	
}