package com.decoders.gymManagementSystem.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.ModelAndView;

import com.decoders.gymManagementSystem.exception.BookingExistsException;
import com.decoders.gymManagementSystem.exception.SeatNotAvailableException;

@ControllerAdvice
public class ExceptionHandler {

	@org.springframework.web.bind.annotation.ExceptionHandler(SeatNotAvailableException.class)
	public ModelAndView seatNotAvailableExceptionHandler(SeatNotAvailableException ex) {
		ModelAndView mv = new ModelAndView("ExceptionPage");
		mv.addObject("errorMessage", ex.getMessage());
		return mv;
	}
	
	@org.springframework.web.bind.annotation.ExceptionHandler(BookingExistsException.class)
	public ModelAndView seatExistsException(BookingExistsException ex) {
		ModelAndView mv = new ModelAndView("ExceptionPage");
		mv.addObject("errorMessage", ex.getMessage());
		return mv;
	}
}
