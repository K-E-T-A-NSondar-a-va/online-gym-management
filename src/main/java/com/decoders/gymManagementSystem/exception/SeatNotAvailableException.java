package com.decoders.gymManagementSystem.exception;

public class SeatNotAvailableException extends Exception {
	public SeatNotAvailableException() {
		super("Seat not available, slot is full !");
	}
}
