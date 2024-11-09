package com.vulenguyen.financetracker.finance.dto;

/**
 * This Data Transfer Object (DTO) holds data for the payload
 * within the TrackerController of the POST /api/trackers.
 * 
 */
public class AccountRequestDto {
    String username;
    String password;
    String accountName;

    /* Getter & Setter */
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }
}
