package com.cs336.pkg;

import java.time.LocalDateTime;
//import java.util.ArrayList;

public class Flight{
	String flightNo;
	
	LocalDateTime departDateTime;
	LocalDateTime arriveDateTime;
	
	String departLocation;
	String arriveLocation;
	 
	int numSeats;
	int durationMin;
	double price;
	String airlinecompany;
	
	public Flight(String flightNo , LocalDateTime departDateTime, LocalDateTime arriveDateTime, String departLocation, String arriveLocation, int numSeats, int durationMin, double price, String airlinecompany) {
		this.flightNo = flightNo;
		
		this.departDateTime = departDateTime;
		this.arriveDateTime = arriveDateTime;
		
		this.departLocation = departLocation;
		this.arriveLocation = arriveLocation;
		
		this.numSeats = numSeats;
		this.durationMin = durationMin;
		this.price = price;
		this.airlinecompany = airlinecompany;
	}
	
	
	public String getflightNo() {
		   return flightNo;
	}
	
	public LocalDateTime getDepartureTime() {
		   return departDateTime;
	}
	
	public LocalDateTime getArrivalTime() {
		   return arriveDateTime;
	}
	
	public String getdepartLocation() {
		   return departLocation;
	}
	
	public String getarriveLocation() {
		   return arriveLocation;
	}
}
	
