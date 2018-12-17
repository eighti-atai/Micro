package com.atai.micro.report.record;

import java.util.HashMap;

public class ReportRecInvoicePatientTreatment extends ReportRec {
	private int    patientId;
	private int    treatmentId;
	
	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public int getTreatmentId() {
		return treatmentId;
	}

	public void setTreatmentId(int treatmentId) {
		this.treatmentId = treatmentId;
	}

	@Override
	public HashMap<String, Object> setReportParams() {
		// TODO Auto-generated method stub
		HashMap<String, Object> hParams;
		hParams = super.setReportParams();
		hParams.put("patient_id", this.patientId);
		hParams.put("treatment_id", this.treatmentId);
		return hParams;
	}

}
