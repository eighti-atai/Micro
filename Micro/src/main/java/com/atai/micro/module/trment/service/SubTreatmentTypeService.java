package com.atai.micro.module.trment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atai.micro.generic.service.AbstractService;
import com.atai.micro.module.trment.dao.SubTreatmentTypeDao;
import com.atai.micro.module.trment.model.SubTreatmentType;
import com.atai.micro.module.trment.model.SubTreatmentTypeKey;

@Service
public class SubTreatmentTypeService extends AbstractService<SubTreatmentTypeKey, SubTreatmentType> {

	@Autowired
	public SubTreatmentTypeService(SubTreatmentTypeDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}
	
}
