package com.cs336.pkg;

import java.util.ArrayList;
//import java.util.List;

public class Trip{
	private ArrayList<Flight> flights;
	int numStops;
	
	public Trip(ArrayList<Flight> flights) {
		this.flights = flights;
		this.numStops = (flights.size()-1); 
	}
	
	public Trip() {
		this.flights = new ArrayList<Flight>();
		this.numStops = 0; 
	}
	
	public void addFlight(Flight f) {
		flights.add(f);
		this.numStops = (flights.size()-1); 
	}
	
	public ArrayList<Flight> getFlights() {
		   return this.flights;
	}
	
	public int getNumStops() {
		   return this.numStops;
	}
	
	public String tripHeader() {
		if(flights.size() == 0) {
			return "No flights included";
		}
		String startLocation = this.getFlights().get(0).departLocation;
		String endLocation = this.getFlights().get(this.flights.size()-1).arriveLocation;
		return (startLocation + " - " + endLocation);
	}
	
}