package com.vulenguyen.financetracker.finance.entity;

public class TrackerAccount {
    int taId;
    String username;
    String password;
    String accountName;

    /* Getter & Setter */
    public int getTaId() {
        return taId;
    }

    public void setTaId(int taId) {
        this.taId = taId;
    }

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
