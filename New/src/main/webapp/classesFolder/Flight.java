import java.time.LocalDateTime;

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
	
	public Flight(String flightNo, LocalDateTime departDateTime, LocalDateTime arriveDateTime, String departLocation, String arriveLocation, int numSeats, int durationMin, double price, String airlinecompany) {
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
	
}