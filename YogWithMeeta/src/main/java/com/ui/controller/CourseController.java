package com.ui.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ui.dao.CourseDAO;
import com.ui.model.Cource;
import com.ui.model.Schedule;

@RestController
public class CourseController {
  @Autowired
  CourseDAO courcedao;
  
  @Autowired
  MixController mixcon;
  
  Cource course;
  
  private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
  
  @GetMapping(value = "/getCourseByPage")
  public List<Cource> getCourseByPage(int pagesize, int startindex, HttpServletRequest request) {
      logger.info("***** GET COURSE BY PAGE *****");
      return courcedao.getCourseByPage(pagesize, startindex);
  }
  
  @GetMapping(value = "/getCourseDetailById")
  public Cource getCourseDetailById(int Id,HttpServletRequest request) {
      logger.info("***** GET COURSE DETAIL BY ID *****");
      return courcedao.getCourseDetailById(Id);
  }
        
  @DeleteMapping(value = "deleteCourse")
  public void delete(int courseid) {
      logger.info("***** DELETE COURSE *****");
      courcedao.deleteCourse(courseid);
  }
  @GetMapping(value = "/getThreeCourseFront")
  public List<Cource> getThreeCourseFront(HttpServletRequest request) {
      logger.info("***** GET THREE COURSE FOR FRONT *****");
      List<Cource> courseList;
      courseList = courcedao.getThreeCourseFront();
      
      for(Cource CL : courseList){
        String days = CL.getScheduleDays();
        List<String> items = Arrays.asList(days.split("\\s*,\\s*"));
        String[] alldays = {"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
        int flag = 1;
        for(int i=0;i<items.size();i++){
        }
      }
      return courseList;
  }
  
  @GetMapping(value = "/getAllCourseName")
  public List<Cource> getAllCourseName( HttpServletRequest request) {
      logger.info("***** GET ALl COURSE NAMES *****");
      return courcedao.getAllCourseName();
  }
  
  @GetMapping(value = "/getAllCourseFront")
  public List<Cource> getAllCourseFront(HttpServletRequest request) {
      logger.info("***** GET ALL COURSE FOR FRONT *****");
      List<Cource> courseList;
      courseList = courcedao.getAllCourseFront();
      
      for(Cource CL : courseList){
        String days = CL.getScheduleDays();
        List<String> items = Arrays.asList(days.split("\\s*,\\s*"));
        String[] alldays = {"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
        int flag = 1;
        for(int i=0;i<items.size();i++){
        }
      }
      return courseList;
  }
  
  @PostMapping(value = "addCourse")
  public String addCourse(@RequestParam(value = "CourseImage", required = false) MultipartFile CourseImage,
          String courseTitle, String subTitle, String description, float feeAmount, int Currency, String feeValidty,
          String location, int scheduleID, String contactPersonName, String contactPersonPhone, String contactPersonEmail, String VideoLink,
          HttpServletRequest request, HttpSession session) {
      logger.info("***** ADD COURCE *****");
      String result = "";
      int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
      String ipaddress = request.getHeader("X-FORWARDED-FOR");
      if (ipaddress == null) {
          ipaddress = request.getRemoteAddr();
      }
      String s = "y";
      String image = null;

      String c = description.replace("$","&");
      String c1 = c.replace("~","#");
      String c2 = c1.replace("!","%");

      course = new Cource();
      course.setVideoLink(VideoLink);
      course.setCourceTitle(courseTitle);
      course.setCourceSubTitle(subTitle);
      course.setCourceDescription(c2);
      course.setCourseFee(feeAmount);
      course.setCurrencyId(Currency);
      course.setCourceFeeValidity(feeValidty);
      course.setCourceLocation(location);
      course.setScheduleId(scheduleID);
      course.setContactPersonName(contactPersonName);
      course.setContactPersonEmail(contactPersonEmail);
      course.setContactPersonPhone(contactPersonPhone);
      course.setStatus(s);
      course.setCreatedBy(id);
      course.setIpAddress(ipaddress);

          if (CourseImage != null) {
              image = mixcon.uploadImage(CourseImage, "CourseImageFolder", request);
              course.setCourceImage(image);
          } else {
            course.setCourceImage(image);
          }

          result = courcedao.addCourse(course);

          return result;
      } 
  
  @PostMapping(value = "editCourse")
  public String editCourse(@RequestParam(value = "CourseImageEdit", required = false) MultipartFile CourseImageEdit,
          String courseTitle, String subTitle, String description, float feeAmount, int Currency, String feeValidty,
          String location, int scheduleID, String contactPersonName, String contactPersonPhone, String contactPersonEmail,
          int CourseId, String CurrImage, String VideoLinkE, String VideoLinkEdit, HttpServletRequest request, HttpSession session) {
      logger.info("***** EDIT COURSE *****");
      String result = "";
      int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
      String ipaddress = request.getHeader("X-FORWARDED-FOR");
      if (ipaddress == null) {
          ipaddress = request.getRemoteAddr();
      }
      String s = "y";
      String image;

      if(CurrImage.equals(""))
      {
        image = null;
      }else{
        image = CurrImage;
      }
      
      String c = description.replace("$","&");
      String c1 = c.replace("~","#");
      String c2 = c1.replace("!","%");
      
      String vidlink = VideoLinkE;
      
      if(VideoLinkEdit != ""){
        vidlink = VideoLinkEdit;
      }

      course = new Cource();
      course.setCourceId(CourseId);
      course.setCourceTitle(courseTitle);
      course.setCourceSubTitle(subTitle);
      course.setCourceDescription(c2);
      course.setCourseFee(feeAmount);
      course.setCurrencyId(Currency);
      course.setCourceFeeValidity(feeValidty);
      course.setCourceLocation(location);
      course.setScheduleId(scheduleID);
      course.setContactPersonName(contactPersonName);
      course.setContactPersonEmail(contactPersonEmail);
      course.setContactPersonPhone(contactPersonPhone);
      course.setStatus(s);
      course.setVideoLink(vidlink);
      course.setCreatedBy(id);
      course.setIpAddress(ipaddress);

          if (CourseImageEdit != null) {
              image = mixcon.uploadImage(CourseImageEdit, "CourseImageFolder", request);
              course.setCourceImage(image);
          } else {
            course.setCourceImage(image);
          }

          result = courcedao.editCourse(course);

          return result;
      } 
  
  

}
