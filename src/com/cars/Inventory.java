package com.cars;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class Inventory {
	private ArrayList<Car> invCars = new ArrayList<Car>();
	private ArrayList<Car> usedCars = new ArrayList<Car>();
	private ArrayList<Car> newCars = new ArrayList<Car>();
	private ArrayList<Car> biddableCars = new ArrayList<Car>();
	private ArrayList<Customer> transactionAL = new ArrayList<Customer>();
	public static final File file = new File("D:\\JavaTraining\\claim-workspace\\CarDealership\\src\\com\\cars\\saveInventory.txt");
	public static final File transactions = new File("D:\\JavaTraining\\claim-workspace\\CarDealership\\src\\com\\cars\\Transactions.txt");
	
	
	public Car getDetails(String vendID){
		Car myCar = new Car();
		
		for (Car car : invCars) {
			if(car.getVendID() == vendID) {
				myCar = car;
				return myCar; 
			}
		}
		return null;
	}
	
	public void checkUsed(Car car) {
		if(car.isUsed()) {
			usedCars.add(car);
			checkDate(car);
//			System.out.println(car.getManufacturer() +"" +car.isUsed());
		}
		else {
			newCars.add(car);
//			System.out.println(car.getManufacturer() +"" +car.isUsed());
		}
		invCars.add(car);
	}
	
	public void checkDate(Car car) {
		if(car.getDaysInv() <= 120) {
			biddableCars.add(car);
		}
	}
	
	public void removeCar(String vendID) {
		Car myCar = new Car();
		for (Car car : invCars) {
			if(car.getVendID() == vendID) {
				myCar = car;
				break;
			}
		}
		if(myCar.isUsed() == true) {
			usedCars.remove(myCar);
			if(myCar.getDaysInv() >= 120) {
				biddableCars.remove(myCar);
			}
		}
		else {
			newCars.remove(myCar);
		}
		invCars.remove(myCar);
	}
	public void readingFromTxtFile() throws IOException {

		BufferedReader txtFileToRead = new BufferedReader(new FileReader(file));
		//System.out.println(txtFileToRead.readLine());
		int num = 0;
		String[] myCars = null;
		String line = null;
		while((line = txtFileToRead.readLine()) != null){
			//(Integer.parseInt(String)
			myCars = line.split(",");
			boolean amIUsed = Boolean.parseBoolean(myCars[7]);
			
			int daysInv = Integer.parseInt(myCars[8]);
			checkUsed(new Car(myCars[0], myCars[1], myCars[2], myCars[3], myCars[4],myCars[5], myCars[6], amIUsed, daysInv, myCars[9]));
		}
		
		//writeToTxtFiles("001", "Truman", "01/18/2019", "43000", "Mk39", "Jeep", "fasdfasdf", "232332", "true", "189");
	}
	
	public void getModelCars(String model) throws IOException{
		BufferedReader txtFileToRead = new BufferedReader(new FileReader(file));
		//System.out.println(txtFileToRead.readLine());
		int num = 0;
		String[] myCars = null;
		String line = null;
		while((line = txtFileToRead.readLine()) != null){
			//(Integer.parseInt(String)
			myCars = line.split(",");
			if(myCars[3].equals(model)) {
				boolean amIUsed = Boolean.parseBoolean(myCars[7]);
				
				int daysInv = Integer.parseInt(myCars[8]);
				checkUsed(new Car(myCars[0], myCars[1], myCars[2], myCars[3], myCars[4],myCars[5], myCars[6], amIUsed, daysInv, myCars[9]));
			}
		}
	}
	
	public void removeFromTxtFile(String vendID) throws IOException {
		BufferedReader txtToRead = new BufferedReader(new FileReader(file));
		BufferedWriter txtFileToWrite = new BufferedWriter(new FileWriter(file, true));
		ArrayList<Car> tempCar = new ArrayList<Car>();
		
	
		String line = null;
		while((line = txtToRead.readLine())!= null) {
			String[] car = line.split(",");
			if(car[0].equals(vendID)) {
				continue;
				
			}
			boolean amIUsed = Boolean.parseBoolean(car[7]);
			int daysInv = Integer.parseInt(car[8]);
			//txtFileToWrite.write(car[0] + "," + car[1] + "," + car[2] + "," + car[3] + "," + car[4] + "," + car[5] + "," + car[6] + "," + car[7] + "," + car[8] + System.getProperty("line.separator"));
			tempCar.add(new Car(car[0], car[1], car[2], car[3], car[4], car[5], car[6], amIUsed, daysInv, car[9]));
		}
		BufferedWriter txtFileClear = new BufferedWriter(new FileWriter(file));
		txtFileClear.close();
		for (Car car : tempCar) {
			String used = String.valueOf(car.isUsed());
			String dayInv = String.valueOf(car.getDaysInv());
			String writer = car.getVendID() + "," + car.getManufacturer() + "," + car.getKilo() + "," + car.getMake() + "," + car.getModel() + "," + car.getUrlPic() + "," + car.getPrice() + "," + used + "," + dayInv + "," + car.getPriceDisc();
			txtFileToWrite.write(writer + System.getProperty("line.separator"));
		}
		txtFileToWrite.close();
	}
	
	public void writeToTxtFiles(String vendID, String manufacturer, String kilo, String make, String model, String urlPic, String price, String used, String daysInv) throws IOException {
		//File file = new File("D:\\JavaTraining\\claim-workspace\\CarDealership\\src\\com\\cars\\saveInventory.txt");
//		try(BufferedWriter txtFileToWrite = new BufferedWriter(new FileWriter(file, true))){
//			String lineBf = vendID + "," + manufacturer + "," + date + "," + kilo + "," + make + "," + model + "," + urlPic + "," + price + "," + used + "," + daysInv;
//			txtFileToWrite.write(lineBf + System.getProperty("line.separator"));
////		}catch (IOException e){
//			
//		}
			int intDiscPrice = (Integer.parseInt(price) -(Integer.parseInt(price)/10));
			String discPrice = String.valueOf(intDiscPrice);
			BufferedWriter txtFileToWrite = new BufferedWriter(new FileWriter(file, true));
			String lineBf = vendID + "," + manufacturer + "," + kilo + "," + make + "," + model + "," + urlPic + "," + price + "," + used + "," + daysInv + "," + discPrice;
			txtFileToWrite.write(lineBf + System.getProperty("line.separator"));
			txtFileToWrite.close();
			
			
	}
	
	public void addToTransactions(String vendID, String firstName, String lastName, String email) throws IOException {
		BufferedWriter txtTransactionToWrite = new BufferedWriter(new FileWriter(transactions, true));
		String date = LocalDate.now().toString();
		String myCar = null;
		for (Car car : invCars) {
			if(car.getVendID().equals(vendID)) {
				myCar = car.getManufacturer() + " " + car.getMake();
			}
		}
		String transaction = date + "," + myCar + "," + firstName + " " + lastName + "," + email;
		txtTransactionToWrite.write(transaction + System.getProperty("line.separator"));
		txtTransactionToWrite.close();
	}
	public void readFromTransactionsFile() throws IOException {
		BufferedReader txtFileToRead = new BufferedReader(new FileReader(transactions));
		//System.out.println(txtFileToRead.readLine());
		String[] myTrans = null;
		String line = null;
		while((line = txtFileToRead.readLine()) != null){
			//(Integer.parseInt(String)
			myTrans = line.split(",");
			transactionAL.add(new Customer(myTrans[3], myTrans[2], myTrans[0], myTrans[1]));
			
		}
		Collections.reverse(transactionAL);
	}
	public ArrayList<Customer> getTransactionAL() {
		return transactionAL;
	}

	public void setTransactionAL(ArrayList<Customer> transactionAL) {
		this.transactionAL = transactionAL;
	}

	public ArrayList<Car> getInvCars() {
		return invCars;
	}

	public void setInvCars(ArrayList<Car> invCars) {
		this.invCars = invCars;
	}

	public ArrayList<Car> getUsedCars() {
		return usedCars;
	}

	public void setUsedCars(ArrayList<Car> usedCars) {
		this.usedCars = usedCars;
	}

	public ArrayList<Car> getNewCars() {
		return newCars;
	}

	public void setNewCars(ArrayList<Car> newCars) {
		this.newCars = newCars;
	}

	public ArrayList<Car> getBiddableCars() {
		return biddableCars;
	}

	public void setBiddableCars(ArrayList<Car> biddableCars) {
		this.biddableCars = biddableCars;
	}
	
	
}
