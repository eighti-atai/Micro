package com.atai.micro.module.payment.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import java.sql.Time;

@Entity
@Table(name = "cbo_tab")
public class Cbo {

	@Id
	@Column(name = "cbo_code")
	private String cboCode;
	@Column(name = "cbo_name")
	private String cboName;
	@Column(name = "branch_id")
	private String brnachId;
	@Column(name = "credit_officer")
	private String creditOfficer;
	private String province;
	private String district;
	@Column(name = "gs_devision")
	private String gsDevision;
	@Column(name = "frequency")
	private String meetingFrequency;
	private String objid;
	private String address1;
	private String address2;
	private String address3;
	@Column(name = "start_date")
	private Date startDate;
	@Column(name = "meeting_day")
	private String meetingDay;
	 @Temporal(TemporalType.TIME)
	@Column(name = "meeting_time")
	private Date meetingTime;
	@Column(name = "ds_office")
    private String dsOffice;
	
	public String getDsOffice() {
		return dsOffice;
	}
	public void setDsOffice(String dsOffice) {
		this.dsOffice = dsOffice;
	}
	public String getCboCode() {
		return cboCode;
	}
	public void setCboCode(String cboCode) {
		this.cboCode = cboCode;
	}
	public String getCboName() {
		return cboName;
	}
	public void setCboName(String cboName) {
		this.cboName = cboName;
	}
	public String getBrnachId() {
		return brnachId;
	}
	public void setBrnachId(String brnachId) {
		this.brnachId = brnachId;
	}
	public String getCreditOfficer() {
		return creditOfficer;
	}
	public void setCreditOfficer(String creditOfficer) {
		this.creditOfficer = creditOfficer;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getGsDevision() {
		return gsDevision;
	}
	public void setGsDevision(String gsDevision) {
		this.gsDevision = gsDevision;
	}
	public String getMeetingFrequency() {
		return meetingFrequency;
	}
	public void setMeetingFrequency(String meetingFrequency) {
		this.meetingFrequency = meetingFrequency;
	}
	public String getObjid() {
		return objid;
	}
	public void setObjid(String objid) {
		this.objid = objid;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public String getMeetingDay() {
		return meetingDay;
	}
	public void setMeetingDay(String meetingDay) {
		this.meetingDay = meetingDay;
	}
	public Date getMeetingTime() {
		return meetingTime;
	}
	public void setMeetingTime(Date meetingTime) {
		this.meetingTime = meetingTime;
	}
	public String getId() {
		// TODO Auto-generated method stub
		return getCboCode();
	}

	public void setId(String id) {
		setCboCode(id);
		// TODO Auto-generated method stub
		
	}
}
