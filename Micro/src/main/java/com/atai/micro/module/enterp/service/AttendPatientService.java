


package com.atai.micro.module.enterp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atai.micro.generic.service.AbstractService;
import com.atai.micro.module.enterp.dao.AttendPatientDao;
import com.atai.micro.module.enterp.model.AttendPatient;

@Service
public class AttendPatientService extends AbstractService<Integer, AttendPatient>{

	@Autowired
	public AttendPatientService(AttendPatientDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}
	
}
