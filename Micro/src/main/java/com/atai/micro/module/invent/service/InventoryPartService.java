package com.atai.micro.module.invent.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atai.micro.generic.service.AbstractService;
import com.atai.micro.module.invent.dao.InventoryPartDao;
import com.atai.micro.module.invent.model.InventoryPart;

@Service
public class InventoryPartService extends AbstractService<String, InventoryPart> {

	@Autowired
	public InventoryPartService(InventoryPartDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}

}
