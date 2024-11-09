package com.vulenguyen.financetracker.finance.exception;

public class TrackerException extends RuntimeException {

    // Contructor that takes in a custome error message
    public TrackerException(String message) {
        super(message);
    }
}
