package com.example.exchange_rate_application.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("api/currency")
@CrossOrigin("*")
public class CurrencyController {

    @GetMapping
    public String getTest(){
        return "Pipeline and deployment successfully !!! Test Successfully !!!";
    }

}
