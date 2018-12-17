package com.atai.micro.module.invent.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atai.micro.generic.service.AbstractService;
import com.atai.micro.module.invent.dao.InvPartInStockDao;
import com.atai.micro.module.invent.model.InvPartInStock;
import com.atai.micro.module.invent.model.InvPartInStockKey;

@Service
public class InvPartInStockService extends AbstractService<InvPartInStockKey, InvPartInStock> {

	@Autowired
	public InvPartInStockService(InvPartInStockDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}

}
