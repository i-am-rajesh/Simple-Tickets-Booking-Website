/**
 * 
 */
package com.hdsoft.database;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hdsoft.repository.BusTicketBooking;

/**
 * @author rajesh
 *
 */
@Repository
public class bookTicket_database {
	
	 @Autowired
	    private JdbcTemplate jdbcTemplate;
	 
	 public bookTicket_database() {
	        System.out.println("bookTicket_database bean created");
	    }
	 
	 
	 public int bookTicket(BusTicketBooking detail) {
	        try {
	            String sql = "INSERT INTO bus_ticket_booking (first_name, last_name, age, gender, contact_number, email, from_location, to_location, journey_date, bus_type, boarding_point,drop_off_point,boarding_time) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	            int rowsAffected = jdbcTemplate.update(sql,
	            		detail.getFirstName(),
	            		detail.getLastName() ,
	            		detail.getAge(),
	            		detail.getGender() ,
	            		detail.getContactNumber() ,
	            		detail.getEmail() ,
	            		detail.getFromLocation() ,
	            		detail.getToLocation() ,
	            		detail.getJourneyDate() ,
	            		detail.getBusType() ,
	            		detail.getBoardingPoint() ,
	            		detail.getDropOffPoint(),
	            		detail.getBoardingTime()
	            		);
	                    
	            return rowsAffected;
	        } catch (Exception e) {
	            e.printStackTrace(); 
	            System.out.println("Error booking ticket: " + e.getMessage());
	            return 0;
	        }
	    }
}
