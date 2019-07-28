package com.atai.micro.module.payment.dao;

import org.springframework.stereotype.Repository;

import com.atai.micro.generic.dao.AbstractDao;
import com.atai.micro.module.payment.model.Family;
import com.atai.micro.module.payment.model.FamilyKey;
import com.atai.micro.module.payment.model.Payment;
import com.atai.micro.module.payment.model.PaymentKey;

@Repository
public class FamilyDao extends AbstractDao<FamilyKey, Family> {

}