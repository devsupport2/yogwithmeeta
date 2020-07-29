package com.ui.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ui.dao.LoginDAO;
import com.ui.model.Cource;
import com.ui.model.User;

@RestController
public class LoginController {
    @Autowired
    LoginDAO loginDAO;

    User user;
    
  private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

  
  @PostMapping(value = "checkLogin")
  public String checkLogin(String email, String password, String loggedin, HttpSession session,
          HttpServletResponse response) {
      logger.info("***** CHECK LOGIN *****");

      User user = null;

      user = loginDAO.checkLogin(email, password);

      if (user != null && user.getUserTypeId() == 3) {
          session.setAttribute("userid", user.getUserId());
          session.setAttribute("username", user.getFirstName() + " " + user.getLastName());
          session.setAttribute("usertypeid", user.getUserTypeId());
          session.setAttribute("emailid", user.getEmail());
          session.setAttribute("mobileno", user.getMobileNo());
          session.setAttribute("loginby", user.getLoginBy());

          if (loggedin.equalsIgnoreCase("y")) {               
              
              Cookie ck1 = new Cookie("useremail", email);
              Cookie ck2 = new Cookie("userpassword", password);
              ck1.setMaxAge(60 * 60 * 24 * 365 * 10); // 10 Years
              ck2.setMaxAge(60 * 60 * 24 * 365 * 10); // 10 Years
              response.addCookie(ck1);
              response.addCookie(ck2);
          }

          return "Success";
      } else if (user != null && user.getUserTypeId() == 1) {
          session.setAttribute("adminuserid", user.getUserId());
          session.setAttribute("adminusername", user.getFirstName() + " " + user.getLastName());
          session.setAttribute("adminusertypeid", user.getUserTypeId());
          session.setAttribute("adminemailid", user.getEmail());
          session.setAttribute("adminmobileno", user.getMobileNo());
          return "Success";
      } else {
          return "Fail";
      }
  }

}
