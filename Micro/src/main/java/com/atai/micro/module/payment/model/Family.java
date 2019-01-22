package com.atai.micro.module.payment.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.atai.micro.generic.interfaces.Model;

@Entity
@Table(name = "family_tab")
public class Family implements Model<FamilyKey> {

	@Id
	private FamilyKey id;
	@Column(name = "relation_type")
	private String relationType;
	private String Name;
	private String objid;
	
	@ManyToOne//(fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "client_nic_no", referencedColumnName = "nic_no", insertable = false, updatable = false)
	})
	
	public FamilyKey getId() {
		return id;
	}
	public void setId(FamilyKey id) {
		this.id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}

}
