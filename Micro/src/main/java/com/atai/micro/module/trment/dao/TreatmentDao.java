package com.atai.micro.module.trment.dao;

import org.springframework.stereotype.Repository;

import com.atai.micro.generic.dao.AbstractDao;
import com.atai.micro.module.trment.model.Treatment;
import com.atai.micro.module.trment.model.TreatmentKey;

@Repository
public class TreatmentDao extends AbstractDao<TreatmentKey, Treatment> {

}

