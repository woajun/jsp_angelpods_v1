package com.javaEdu.ex.dto;

import java.sql.Timestamp;

public class DeviceDto {

	private String dId;
	private String dGroup;
	private Timestamp drDate;
	private String dState;
	private String dModel;
	private String memberId;
	
	
	public String getdId() {
		return dId;
	}
	public void setdId(String dId) {
		this.dId = dId;
	}
	public String getdGroup() {
		return dGroup;
	}
	public void setdGroup(String dGroup) {
		this.dGroup = dGroup;
	}
	public Timestamp getDrDate() {
		return drDate;
	}
	public void setDrDate(Timestamp drDate) {
		this.drDate = drDate;
	}
	public String getdState() {
		return dState;
	}
	public void setdState(String dState) {
		this.dState = dState;
	}
	public String getdModel() {
		return dModel;
	}
	public void setdModel(String dModel) {
		this.dModel = dModel;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
}
