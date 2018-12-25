package com.atai.micro.module.payment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atai.micro.generic.service.AbstractService;
import com.atai.micro.module.payment.dao.BranchDao;
import com.atai.micro.module.payment.model.Branch;

@Service
public class BranchService extends AbstractService<String, Branch>{

	@Autowired
	public BranchService(BranchDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}
}
