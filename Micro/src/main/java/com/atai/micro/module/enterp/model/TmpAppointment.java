
package com.atai.micro.module.enterp.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.atai.micro.generic.interfaces.Model;
import com.atai.micro.generic.other.Time12HoursValidator;

@Entity
@Table(name = "tmp_appointment_tab")
public class TmpAppointment implements Model<Integer> {

	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "app_id")
	private Integer appointmentId;
	@Column(name = "patient_id")
	private Integer patientId;
	@Column(name = "org_appoinment_id")
	private Integer orgAppoinmentId;
	private String name;
	private Date date;
	private String time;
	private String  doctor;
	private String code;
	private String objid;
	@Column(name = "contact_no")
	private String contactNo;
	@Column(name = "contact_no2")
	private String contactNo2;
	@Column(name = "contact_no_fo")
	private String contactNoFo;
	
	
	
	public Integer getAppointmentId() {
		return appointmentId;
	}

	public void setAppointmentId(Integer appointmentId) {
		this.appointmentId = appointmentId;
	}

	public Integer getPatientId() {
		return patientId;
	}

	public void setPatientId(Integer patientId) {
		this.patientId = patientId;
	}

	public Integer getOrgAppoinmentId() {
		return orgAppoinmentId;
	}

	public void setOrgAppoinmentId(Integer orgAppoinmentId) {
		this.orgAppoinmentId = orgAppoinmentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTime() {
		Time12HoursValidator timeValidate = new Time12HoursValidator();
		return timeValidate.convertTimeBack(time);
	}

	public void setTime(String time) {
		String timeT = time.replaceAll("\\s","");
		Time12HoursValidator timeValidate = new Time12HoursValidator();
		timeValidate.validate(timeT);
		this.time = timeValidate.convertTime(timeT);
	}

	public String getDoctor() {
		return doctor;
	}

	public void setDoctor(String  doctor) {
		this.doctor = doctor;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getObjid() {
		return objid;
	}

	public void setObjid(String objid) {
		this.objid = objid;
	}

	public Integer getId() {
		// TODO Auto-generated method stub
		return getAppointmentId();
	}

	public void setId(Integer id) {
		setAppointmentId(id);

	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getContactNo2() {
		return contactNo2;
	}

	public void setContactNo2(String contactNo2) {
		this.contactNo2 = contactNo2;
	}

	public String getContactNoFo() {
		return contactNoFo;
	}

	public void setContactNoFo(String contactNoFo) {
		this.contactNoFo = contactNoFo;
	}

}
