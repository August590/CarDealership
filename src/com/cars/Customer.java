package com.cars;

public class Customer implements Comparable<Customer> {
	private String fullName;
	private String car;
	private String date;
	private String email;
	
	
	public Customer(String fullName, String car, String date, String email) {
		this.fullName = fullName;
		this.car = car;
		this.date = date;
		this.email = email;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getCar() {
		return car;
	}
	public void setCar(String car) {
		this.car = car;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public int compareTo(Customer o) {
		// TODO Auto-generated method stub
		if(getDate() == null || o.getDate() == null) {
			return 0;
		}
		
		return getDate().compareTo(o.getDate());
	}
}
