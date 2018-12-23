package com.atai.micro.module.payment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atai.micro.generic.service.AbstractService;
import com.atai.micro.module.payment.dao.CboDao;
import com.atai.micro.module.payment.model.Cbo;

@Service
public class CboService extends AbstractService<String, Cbo>{

	@Autowired
	public CboService(CboDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}
	
}