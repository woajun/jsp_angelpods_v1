package com.javaEdu.ex.dto;

import java.sql.Timestamp;

public class FDto {

	private int num;
	private String image;
	private String model;
	private Timestamp rdate;
	private String area;
	private String title;
	private String contents;
	private String findornot;
	private String writerId;
	private String deviceId;
	
	public FDto(int num, String image, String model, Timestamp rdate, String area, String title, String contents,
			String findornot, String writerId, String deviceId) {
		super();
		this.num = num;
		this.image = image;
		this.model = model;
		this.rdate = rdate;
		this.area = area;
		this.title = title;
		this.contents = contents;
		this.findornot = findornot;
		this.writerId = writerId;
		this.deviceId = deviceId;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public Timestamp getRdate() {
		return rdate;
	}
	public void setRdate(Timestamp rdate) {
		this.rdate = rdate;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getFindornot() {
		return findornot;
	}
	public void setFindornot(String findornot) {
		this.findornot = findornot;
	}
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	public String getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}
	
}
