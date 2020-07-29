package com.ui.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ui.dao.UserDAO;
import com.ui.model.User;

@RestController
public class UserController {
  
  @Autowired
  UserDAO userDao;
  
  @Autowired
  EmailController emailcon;
  

  @Autowired
  MixController mixcon;
  
  User u;
  
  private static final Logger logger = LoggerFactory.getLogger(StateController.class);
  
  
  @GetMapping(value = "/getUsersByPage")
  public List<User> getUserByPage(int pagesize, int startindex, HttpServletRequest request) {
      logger.info("***** GET USER BY PAGE *****");
      List<User> ul = new ArrayList<User>();

      ul = userDao.getUserByPage(pagesize, startindex);

      return ul;
  }
  
  @GetMapping(value = "/searchUser")
  public List<User> searchUser(String keyword, HttpServletRequest request) {
      logger.info("***** SEARCH USER *****");

      List<User> ul = new ArrayList<User>();

      ul = userDao.searchUser(keyword);

      return ul;
  }
  
  @GetMapping(value = "/getUserDetailById")
  public User getUserDetailById(int userid, HttpServletRequest request) {
      logger.info("***** GET USER DETAIL BY ID *****");

      u = userDao.getUserDetailById(userid);
      return u;
  }

  @DeleteMapping(value = "deleteUser")
  public void delete(int userid) {
      logger.info("***** DELETE USER *****");
      userDao.deleteUser(userid);
  }
  
  @PostMapping(value = "ForgotPassword")
  public String ForgotPassword(String email, HttpSession session,
          HttpServletResponse response) {
      logger.info("***** ForgotPassword*****");

      User user = null;

      user=userDao.getUserByEmail(email);
      if(user!=null)
      {
          userDao.setforgotpassflag("y",email);
          emailcon.sendForgotPassLink(user.getEmail());
          return "Success";
      }
      else 
      {
      return "Something went wrong";
      }
  }
  
  
  @PostMapping("updatePass")
  public String updatePass(@RequestBody User user, HttpServletRequest request, HttpSession session) {
      logger.info("***** Update user pass *****");
      logger.info("***** U *****"+user.getEmail());
      String result = null;
      
      if(user.getEmail()!=null) {
          if(userDao.getforgotpassflag(user.getEmail()).equals("n")) {
              result = "NotAllowed";
          }else {
          userDao.setforgotpassflag("n", user.getEmail());
          result = userDao.UpdatePass(user);
          }
      } else {
          result = "something went wrong or user logged in using social media";
      }

      return result;
  }
  
  @PostMapping("addUser")
  public String addUser(@RequestBody User user, HttpServletRequest request, HttpSession session) {
      logger.info("***** ADD USER *****");

      String result = null;
      int checkEmail = 0;

      int userid = 0;

      if (user.getLoginBy().equals("Google") || user.getLoginBy().equals("Facebook") || user.getLoginBy().equals("WebApp")) {
          userid = 0;
      } else {
          userid = Integer.parseInt(session.getAttribute("userid").toString());
      }

      String ip = request.getHeader("X-FORWARDED-FOR");
      if (ip == null) {
          ip = request.getRemoteAddr();
      }

      String s = "y";

      user.setCreatedBy(userid);
      user.setIpAddress(ip);

      if (user.getUserId() != 0) {
          result = userDao.editUser(user);

      } else {
          User u = null;

          if (user.getLoginBy().equals("Google") || user.getLoginBy().equals("Facebook")) {
              user.setStatus(s);
              u = userDao.getUserByEmail(user.getEmail());
              if (u == null) {
                  String[] splited = user.getFirstName().split("\\s+");
                  user.setFirstName(splited[0]);
                  user.setLastName(splited[1]);
                  result = userDao.addUser(user);
              } else {
                  session.setAttribute("userid", u.getUserId());
                  session.setAttribute("username", u.getFirstName() + " " + u.getLastName());
                  session.setAttribute("usertypeid", u.getUserTypeId());
                  session.setAttribute("emailid", u.getEmail());
                  session.setAttribute("mobileno", u.getMobileNo());
                  session.setAttribute("loginby", u.getLoginBy());

                  result = "Success";
              }
          } else if (user.getLoginBy().equals("WebApp")) {
              user.setStatus("y");

              if (!user.getEmail().isEmpty()) {
                  checkEmail = userDao.isEmailUnique(user.getEmail());
              }
              if (checkEmail == 0) {
                logger.info("inside if=======================");
                  result = userDao.addUser(user);
                  
                  int userID = userDao.getLastUserId();
                  if(userID != 0)
                  {
                    u = userDao.getUserDetailById(userID);
                    session.setAttribute("userid", u.getUserId());
                    session.setAttribute("username", u.getFirstName() + " " + u.getLastName());
                    session.setAttribute("usertypeid", u.getUserTypeId());
                    session.setAttribute("emailid", u.getEmail());
                    session.setAttribute("mobileno", u.getMobileNo());
                    session.setAttribute("loginby", u.getLoginBy());
                  }


              } else {
                logger.info("inside else=======================");
                  result = "Data not saved! Email already exists! Change email and submit again.";
              }
          }
      }

      return result;
  }
  
  
  @PostMapping(value = "/editUserByAdmin")
  public String editUserByAdmin(@RequestParam(value = "userimage", required = false) MultipartFile userimage,
          int userid, int usertypeid, String userpicture, String firstname,
          String lastname, String mobileno, String gender, String dateofbirth, String email, String address,
          int stateid, int countryid, String city, String pincode, HttpServletRequest request, HttpSession session) {
      logger.info("***** EDIT USER BY ADMIN *****");
      String result = "";

      int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
      String ipaddress = request.getHeader("X-FORWARDED-FOR");
      if (ipaddress == null) {
          ipaddress = request.getRemoteAddr();
      }
      String s = "y";
      String image = null;

      User user = new User();

      user.setUserId(userid);
      user.setUserTypeId(usertypeid);
      user.setFirstName(firstname);
      user.setLastName(lastname);
      user.setMobileNo(mobileno);
      user.setGender(gender);
      user.setDateOfBirth(dateofbirth);
      user.setEmail(email);
      user.setAddress(address);
      user.setStateId(stateid);
      user.setCountryId(countryid);
      user.setCity(city);
      user.setPincode(pincode);
      user.setStatus(s);
      user.setCreatedBy(id);
      user.setIpAddress(ipaddress);

      if (userimage != null) {
          image = mixcon.uploadProfileImage(userimage, "UserImage", request);
          user.setUserImage(image);
      } else {
          user.setUserImage(userpicture);
      }

      result = userDao.editUser(user);
      return result;
  }
  
  
  @PostMapping(value = "/editUser")
  public String editUser(@RequestParam(value = "userimage", required = false) MultipartFile userimage,
          int userid, int usertypeid, String userpicture, String firstname,
          String lastname, String mobileno, String gender, String dateofbirth, String email, String address,
          int stateid, int countryid, String city, String pincode, HttpServletRequest request, HttpSession session) {
      logger.info("***** EDIT USER *****");
      
      String result = "";

      int id = Integer.parseInt(session.getAttribute("userid").toString());
      String ipaddress = request.getHeader("X-FORWARDED-FOR");
      if (ipaddress == null) {
          ipaddress = request.getRemoteAddr();
      }
      String s = "y";
      String image = null;

      User user = new User();

      user.setUserId(userid);
      user.setUserTypeId(usertypeid);
      user.setFirstName(firstname);
      user.setLastName(lastname);
      user.setMobileNo(mobileno);
      user.setGender(gender);
      user.setDateOfBirth(dateofbirth);
      user.setEmail(email);
      user.setAddress(address);
      user.setStateId(stateid);
      user.setCountryId(countryid);
      user.setCity(city);
      user.setPincode(pincode);
      user.setStatus(s);
      user.setCreatedBy(id);
      user.setIpAddress(ipaddress);

      if (userimage != null) {
          image = mixcon.uploadProfileImage(userimage, "UserImage", request);
          user.setUserImage(image);
      } else {
          user.setUserImage(userpicture);
      }

      result = userDao.editUser(user);
      return result;
  }
  
}
