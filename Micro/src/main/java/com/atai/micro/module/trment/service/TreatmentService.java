package com.atai.micro.module.trment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atai.micro.generic.service.AbstractService;
import com.atai.micro.module.trment.dao.TreatmentDao;
import com.atai.micro.module.trment.model.Treatment;
import com.atai.micro.module.trment.model.TreatmentKey;

@Service
public class TreatmentService extends AbstractService<TreatmentKey, Treatment>{

	@Autowired
	public TreatmentService(TreatmentDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}
	
}
