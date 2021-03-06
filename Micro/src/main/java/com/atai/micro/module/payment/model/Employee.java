package com.atai.micro.module.payment.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import com.atai.micro.generic.interfaces.Model;

@Entity
@Table(name = "employee_tab")
public class Employee  implements Model<String> {
	
	@Id
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_name")
	private String userName;
	@Column(name = "user_type")
	private String userType;
	@Column(name = "first_name")
	private String firstName;
	@Column(name = "middle_names")
	private String middleNames;
	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleNames() {
		return middleNames;
	}

	public void setMiddleNames(String middleNames) {
		this.middleNames = middleNames;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getNicNo() {
		return nicNo;
	}

	public void setNicNo(String nicNo) {
		this.nicNo = nicNo;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getCivilStatus() {
		return civilStatus;
	}

	public void setCivilStatus(String civilStatus) {
		this.civilStatus = civilStatus;
	}

	public String getHouseNo() {
		return houseNo;
	}

	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public String getCityCbo() {
		return cityCbo;
	}

	public void setCityCbo(String cityCbo) {
		this.cityCbo = cityCbo;
	}



	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "last_name")
	private String lastName;
	@Column(name = "nic_no")
	private String nicNo;
	@Column(name = "date_of_birth")
	private Date dateOfBirth;
	@Column(name = "civil_status")
	private String civilStatus;
	@Column(name = "house_no")
	private String houseNo;
	@Column(name = "street_address")
	private String streetAddress;
	@Column(name = "city_cbo")
	private String cityCbo;
	@Column(name = "mobile_no")
	private String   mobileNo;
	@Column(name = "land_phone_no")
	private String  landPhoneNo;
	private String password;
	private String title;
	private String gender;
	private String email;
	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getLandPhoneNo() {
		return landPhoneNo;
	}

	public void setLandPhoneNo(String landPhoneNo) {
		this.landPhoneNo = landPhoneNo;
	}

	private String objid;
	
	
	public String getObjid() {
		return objid;
	}

	public void setObjid(String objid) {
		this.objid = objid;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName.toUpperCase();
	}

	/*private String getUserType() {
		return userType;
	}

	private void setUserType(String userType) {
		this.userType = userType;
	}

	private String getFirstName() {
		return firstName;
	}

	private void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	private String getMiddleNames() {
		return middleNames;
	}

	private void setMiddleNames(String middleNames) {
		this.middleNames = middleNames;
	}

	private String getLastName() {
		return lastName;
	}

	private void setLastName(String lastName) {
		this.lastName = lastName;
	}

	private String getNicNo() {
		return nicNo;
	}

	private void setNicNo(String nicNo) {
		this.nicNo = nicNo;
	}

	private Date getDateOfBirth() {
		return dateOfBirth;
	}

	private void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	private String getCivilStatus() {
		return civilStatus;
	}

	private void setCivilStatus(String civilStatus) {
		this.civilStatus = civilStatus;
	}

	private String getHouseNo() {
		return houseNo;
	}

	private void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}

	private String getStreetAddress() {
		return streetAddress;
	}

	private void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	private String getCityCbo() {
		return cityCbo;
	}

	private void setCityCbo(String cityCbo) {
		this.cityCbo = cityCbo;
	}

	private String getMobile_no() {
		return mobile_no;
	}

	private void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}

	private String getLand_phone_no() {
		return land_phone_no;
	}

	private void setLand_phone_no(String land_phone_no) {
		this.land_phone_no = land_phone_no;
	}

	private String getPassword() {
		return password;
	}

	private void setPassword(String password) {
		this.password = password;
	}

	private String getTitle() {
		return title;
	}

	private void setTitle(String title) {
		this.title = title;
	}

	private String getGender() {
		return gender;
	}

	private void setGender(String gender) {
		this.gender = gender;
	}

	private String getEmail() {
		return email;
	}

	private void setEmail(String email) {
		this.email = email;
	}*/

	public String getId() {
		// TODO Auto-generated method stub
		return getUserName();
	}

	public void setId(String id) {
		setUserName(id);
		// TODO Auto-generated method stub
		
	}
}
