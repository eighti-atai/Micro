package com.atai.micro.module.payment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atai.micro.generic.service.AbstractService;
import com.atai.micro.module.payment.dao.PaymentDao;
import com.atai.micro.module.payment.model.Payment;
import com.atai.micro.module.payment.model.PaymentKey;

@Service
public class PaymentService extends AbstractService<PaymentKey, Payment> {

	@Autowired
	public PaymentService(PaymentDao dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}

}
