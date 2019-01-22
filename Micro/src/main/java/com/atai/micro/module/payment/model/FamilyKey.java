package com.atai.micro.module.payment.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class FamilyKey implements Serializable{

	@Column(name = "client_nic_no")
	private String clientNicNo;
	@Column(name = "nic_no")
	private String nicNo;
	@Column(name = "payment_no")
	

	public String getClientNicNo() {
		return clientNicNo;
	}
	public void setClientNicNo(String clientNicNo) {
		this.clientNicNo = clientNicNo;
	}
	public String getNicNo() {
		return nicNo;
	}
	public void setNicNo(String nicNo) {
		this.nicNo = nicNo;
	}
	
	/*@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + patientId;
		result = prime * result + paymentNo;
		result = prime * result + treatmentId;
		return result;
	}*/
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FamilyKey other = (FamilyKey) obj;
		if (clientNicNo != other.clientNicNo)
			return false;
		if (nicNo != other.nicNo)
			return false;
		return true;
	}
	
	
	
}
