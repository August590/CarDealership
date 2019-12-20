package com.cars;


public class Car {
	
	private String vendID;
	private String manufacturer;
	private String kilo;
	private String make;
	private String model;
	private String urlPic;
	private String price;
	private String priceDisc;
	private int daysInv;
	private boolean used;
	
	
	Car(){
		
	}
	Car(String vendID, String manufacturer, String kilo, String make, String model, String urlPic, String price, boolean used, int daysInv, String priceDisc){
		this.vendID = vendID;
		this.manufacturer = manufacturer;
		this.kilo = kilo;
		this.make = make;
		this.model = model;
		this.urlPic = urlPic;
		this.price = price;
		this.used = used;
		this.daysInv = daysInv;
		this.priceDisc = priceDisc;
	}
	
	public int myPrice() {
		return Integer.parseInt(price);
	}
	public int myDiscPrice() {
		return Integer.parseInt(priceDisc);
	}
	public String getPriceDisc() {
		return priceDisc;
	}
	public void setPriceDisc(String priceDisc) {
		this.priceDisc = priceDisc;
	}
	public int getDaysInv() {
		return daysInv;
	}
	public void setDaysInv(int daysInv) {
		this.daysInv = daysInv;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getKilo() {
		return kilo;
	}
	public void setKilo(String kilo) {
		this.kilo = kilo;
	}
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getUrlPic() {
		return urlPic;
	}
	public void setUrlPic(String urlPic) {
		this.urlPic = urlPic;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public boolean isUsed() {
		return used;
		
	}
	public void setUsed(boolean used) {
		this.used = used;
	}
	public String getVendID() {
		return vendID;
	}
	public void setVendID(String vendID) {
		this.vendID = vendID;
	}
	
	
	
}
