package com.ui.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ui.dao.CountryDAO;
import com.ui.model.Country;
import com.ui.model.State;

@RestController
public class CountryController {
	@Autowired
	CountryDAO countrydao;
	private static final Logger logger = LoggerFactory.getLogger(CountryController.class);

	@RequestMapping(value = "/getCountry", method = RequestMethod.GET, produces = "application/json")
	public List<Country> getCountry(HttpServletRequest request) {
		logger.info("Inside Country");

		List<Country> Country = countrydao.getAllCountry();

		return Country;
	}

	@RequestMapping(value = "/GetRelatedState", method = RequestMethod.GET, produces = "application/json")
	public List<State> GetRelatedState(int countryid) {
		logger.info("Inside Get Related State");
		List<State> s = countrydao.getRelatedState(countryid);
		return s;
	}

	
}
