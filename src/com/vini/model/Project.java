package com.vini.model;

public class Project {
	private int id;
	private String projectNo;
	private String projectName;
	private String projectProvince;
	private String projectCity;
	private String projectArea;
	private String cityLevel;
	private int trareType;
	private String bidUnit;
	private String bidConcatTel;
	private String fixBidDate;
	private String widbidUnit;
	private String widbidAmount;
	private String widbidConcatTel;
	private String widbidProduct;
	
	public Project(){
		id = 0;
		projectNo = "";
		projectName = "";
		projectProvince = "";
		projectCity = "";
		projectArea = "";
		cityLevel = "";
		trareType = 0;
		bidUnit = "";
		bidConcatTel = "";
		fixBidDate = "";
		widbidUnit = "";
		widbidAmount = "";
		widbidConcatTel = "";
		widbidProduct = "";
	}
	public void setId(int s){
		this.id = s;
	}
	
	public int getId(){
		return this.id;
	}
	
	public void setProjectNo(String s){
		projectNo = s;
	}
	
	public String getProjectNo(){
		return projectNo;
	}
}
