package com.atai.micro.module.payment.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "branch_tab")
public class Branch {
	@Id
	private String code;
	private String name;
	@Column(name = "phone_no")
	private String phoneNo;
	private String address1;
	private String address2;
	private String address3;
	private String city;
	private String email;
	private String fax;
	private String objid;
	public String getCode() {
		return code.toUpperCase();
	}
	public void setCode(String code) {
		this.code = code.toUpperCase();
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getObjid() {
		return objid;
	}
	public void setObjid(String objid) {
		this.objid = objid;
	}
	public String getId() {
		// TODO Auto-generated method stub
		return getCode();
	}

	public void setId(String id) {
		setCode(id);
		// TODO Auto-generated method stub
		
	}

}
