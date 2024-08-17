package com.vulenguyen.financetracker.finance.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FinanaceController {

    @GetMapping("/")
    public String homePage() {
        return "Welcome to Finance Home";
    }
}