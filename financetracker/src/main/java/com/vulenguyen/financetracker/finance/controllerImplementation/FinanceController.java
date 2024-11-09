package com.vulenguyen.financetracker.finance.controllerImplementation;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FinanceController {

    @GetMapping("/")
    public String homePage() {
        return "Welcome to Finance Home";
    }

}