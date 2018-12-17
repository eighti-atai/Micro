package com.atai.micro.module.invent.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atai.micro.generic.service.AbstractService;
import com.atai.micro.module.invent.dao.PartCategoryDao;
import com.atai.micro.module.invent.model.PartCategory;

@Service
public class PartCategoryService extends AbstractService<String, PartCategory> {

	@Autowired
	public PartCategoryService(PartCategoryDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}

}
