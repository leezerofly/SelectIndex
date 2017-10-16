package com.vini.model;

public class User {
	private String username;
	private String password;
	
	public User(){
		username="";
		password="";
	}
	public void setUsername(String s){
		username=s;
	}
	
	public String getUsername(){
		return username;
	}
	
	public void setPassword(String s){
		password=s;
	}
	
	public String getPassword(){
		return password;
	}
}
