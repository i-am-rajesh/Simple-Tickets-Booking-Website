/**
 * 
 */
package com.hdsoft.controllers;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hdsoft.database.bookTicket_database;
import com.hdsoft.repository.BusTicketBooking;

/**
 * @author rajesh
 *
 */
@Controller
public class viewController {
//	Default controller
	@RequestMapping(value = "/addTicket", method = RequestMethod.GET)
    public ModelAndView index(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("home/index");
        return mv;
    }
	
    @Autowired
    private bookTicket_database db;
	
//	posting data into database
	 @PostMapping("/bookTicket")
	    public ResponseEntity<String> regData(@ModelAttribute BusTicketBooking detail, HttpServletResponse response, HttpServletRequest request, HttpSession session) {

	    	 response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	         response.setHeader("Pragma", "no-cache");
	         response.setHeader("Expires", "0");
	         response.setHeader("Set-Cookie","key=value; HttpOnly; SameSite=strict");
	    	
	    	try {
	    		int rowsAffected =  db.bookTicket(detail);
	            if(rowsAffected != 0) {
	              return ResponseEntity.ok("{\"status\": \"success\", \"message\": \"ticket booked successful!\"}");
	            }else {
	          	  return ResponseEntity.status(401).body("{\"status\": \"failed\", \"message\": \"booking failed!\"}");
	            }
	    	}catch(Exception e) {
	    		 return ResponseEntity.status(401).body("{\"status\": \"failed\", \"message\": \"An error occurred while processing your request!\"}");
	    	}
	    }	
	 
//	 view ticket
	 @Autowired
	    private JdbcTemplate jdbcTemplate;
	 
	  @GetMapping("/")
	    public String getTicket(Model model, HttpServletResponse response) {
		  
		  	 response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	         response.setHeader("Pragma", "no-cache");
	         response.setHeader("Expires", "0");
	         response.setHeader("Set-Cookie","key=value; HttpOnly; SameSite=strict");
	        
		  List<BusTicketBooking> ticket = jdbcTemplate.query("SELECT * FROM bus_ticket_booking", new BeanPropertyRowMapper<>(BusTicketBooking.class));
		  System.out.println(ticket);
	        model.addAttribute("ticket", ticket);
	        return "home/viewTicket";
	    }
	  
//		posting data into database
	  @PostMapping("/updateTicket")
	  public ResponseEntity<String> updateTicket(
	          @RequestParam("ticketID") int ticketId,
	          @RequestParam("newJourneyDate") String newJourneyDate, 
	          @RequestParam("newBoardingTime") String newBoardingTime,
	          HttpServletResponse response, HttpServletRequest request, HttpSession session) {

	      try {

	          String sql = "UPDATE bus_ticket_booking SET journey_date = ?, boarding_time = ? WHERE booking_id = ?";
	          int rowsAffected = jdbcTemplate.update(sql, newJourneyDate, newBoardingTime, ticketId);

	          if (rowsAffected != 0) {
	              return ResponseEntity.ok("{\"status\": \"success\", \"message\": \"Ticket updated successfully!\"}");
	          } else {
	              return ResponseEntity.status(401).body("{\"status\": \"failed\", \"message\": \"Update failed!\"}");
	          }
	      } catch (Exception e) {
	          return ResponseEntity.status(401).body("{\"status\": \"failed\", \"message\": \"An error occurred while processing your request!\"}");
	      }

}
//	  cancel ticket
	  @PostMapping("/deleteTicket")
	  public ResponseEntity<String> cancelTicket(
	          @RequestParam("ticketID") int ticketId,
	          HttpServletResponse response, HttpServletRequest request, HttpSession session) {

	      try {

	          String sql = "DELETE FROM bus_ticket_booking WHERE booking_id = ?";
	          int rowsAffected = jdbcTemplate.update(sql, ticketId);

	          if (rowsAffected != 0) {
	              return ResponseEntity.ok("{\"status\": \"success\", \"message\": \"Ticket canceled successfully!\"}");
	          } else {
	              return ResponseEntity.status(401).body("{\"status\": \"failed\", \"message\": \"cancel failed!\"}");
	          }
	      } catch (Exception e) {
	          return ResponseEntity.status(401).body("{\"status\": \"failed\", \"message\": \"An error occurred while processing your request!\"}");
	      }

}
	  
}
