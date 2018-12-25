package com.atai.micro.module.payment.dao;

import org.springframework.stereotype.Repository;

import com.atai.micro.generic.dao.AbstractDao;
import com.atai.micro.module.payment.model.Branch;

@Repository
public class BranchDao extends AbstractDao<String, Branch> {
}
