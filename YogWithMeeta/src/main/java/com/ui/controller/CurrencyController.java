package com.ui.controller;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ui.dao.CurrencyDAO;
import com.ui.model.Currency;

@RestController
public class CurrencyController {
  
  @Autowired
  CurrencyDAO currencydao;
  
  Currency currency;
  
  private static final Logger logger = LoggerFactory.getLogger(CurrencyController.class);
  
  @GetMapping(value="/Currency")
  public List<Currency> Currency()
  {
      logger.info("Inside Get All Currency");
      List<Currency> Currency = currencydao.getAllCurrency();
      return Currency;
  }

}
