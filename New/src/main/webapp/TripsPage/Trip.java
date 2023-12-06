import java.util.ArrayList;
//import java.util.List;

public class Trip{
	private ArrayList<Flight> flights;
	int numStops;
	
	public Trip(ArrayList<Flight> flights) {
		this.flights = flights;
		this.numStops = (flights.size()-1);
	}
	
	public void addFlight(Flight f) {
		flights.add(f);
	}
	
}