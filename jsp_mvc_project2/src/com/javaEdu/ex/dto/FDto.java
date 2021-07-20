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
	private int comments;
	private String findornot;
	
	public FDto(int num, String image, String model, Timestamp rdate, String area, String title, String contents,
			int comments, String findornot) {
		super();
		this.num = num;
		this.image = image;
		this.model = model;
		this.rdate = rdate;
		this.area = area;
		this.title = title;
		this.contents = contents;
		this.comments = comments;
		this.findornot = findornot;
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
	public int getComments() {
		return comments;
	}
	public void setComments(int comments) {
		this.comments = comments;
	}
	public String getFindornot() {
		return findornot;
	}
	public void setFindornot(String findornot) {
		this.findornot = findornot;
	}
	
	
}
