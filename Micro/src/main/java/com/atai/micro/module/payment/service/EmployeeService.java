




package com.atai.micro.module.payment.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atai.micro.generic.service.AbstractService;
import com.atai.micro.module.payment.dao.EmployeeDao;
import com.atai.micro.module.payment.model.Employee;

@Service
public class EmployeeService extends AbstractService<String, Employee>{

	@Autowired
	public EmployeeService(EmployeeDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}
}
