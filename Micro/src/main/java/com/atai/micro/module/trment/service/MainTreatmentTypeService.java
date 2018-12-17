package com.atai.micro.module.trment.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atai.micro.generic.service.AbstractService;
import com.atai.micro.module.trment.dao.MainTreatmentTypeDao;
import com.atai.micro.module.trment.model.MainTreatmentType;

@Service
public class MainTreatmentTypeService extends AbstractService<String, MainTreatmentType>{

	@Autowired
	public MainTreatmentTypeService(MainTreatmentTypeDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}
	
}

