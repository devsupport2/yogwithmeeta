package com.ui.controller;

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
import org.springframework.web.bind.annotation.RestController;

import com.ui.dao.ScheduleDAO;
import com.ui.model.Batch;
import com.ui.model.Schedule;

@RestController
public class ScheduleController {
  
  @Autowired
  ScheduleDAO scheduledao;
 
 Schedule schedule;
 Batch batch;
  
  private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
  
  @GetMapping(value = "/getScheduleByPage")
  public List<Schedule> getScheduleByPage(int pagesize, int startindex, HttpServletRequest request) {
      logger.info("***** GET SCHEDULE BY PAGE *****");
      return scheduledao.getScheduleByPage(pagesize, startindex);
  }
  
  @GetMapping(value = "/getAllSchedules")
  public List<Schedule> getAllSchedules(HttpServletRequest request) {
      logger.info("***** GET ALL BATCH NAME *****");
      return scheduledao.getAllSchedulesName();
  }
        
  @DeleteMapping(value = "deleteSchedule")
  public void delete(int scheduleid) {
      logger.info("***** DELETE Schedule *****");
      scheduledao.deleteSchedule(scheduleid);
  }
  
  @PostMapping(value = "/addSchedule")
  public String addSchedule(String scheduleName, String startDate, String endDate, String days, int batchId, HttpSession session, HttpServletRequest request,
          HttpServletResponse response) {
      logger.info("***** ADD SCHEDULE *****");
      String result = "";
     

      int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
      String ipaddress = request.getHeader("X-FORWARDED-FOR");
      if (ipaddress == null) {
          ipaddress = request.getRemoteAddr();
      }
      String s = "y";

      schedule = new Schedule();

      schedule.setScheduleName(scheduleName);
      schedule.setScheduleStartDate(startDate);
      schedule.setScheduleEndDate(endDate);
      schedule.setScheduleDays(days);
      schedule.setBatchId(batchId);
      schedule.setStatus(s);
      schedule.setCreatedBy(id);
      schedule.setIpAddress(ipaddress);
      
      result = scheduledao.addSchedule(schedule);
      
      return result;
  }
  
  
  @GetMapping(value = "/getScheduleDetailById")
  public Schedule getPackageDetailById(int scheduleid, HttpServletRequest request) {
      logger.info("***** GET PACKAGE DETAIL BY ID *****");
      return scheduledao.getScheduleDetailById(scheduleid);
  }
  
  @PostMapping(value = "editSchedule")
  public String editSchedule(int scheduleId, String scheduleName, String startDate, String endDate, String days, int batchId, HttpSession session, HttpServletRequest request,
        HttpServletResponse response) {
    logger.info("***** EDIT SCHEDULE *****");
    String result = "";

      int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
      String ipaddress = request.getHeader("X-FORWARDED-FOR");
      if (ipaddress == null) {
          ipaddress = request.getRemoteAddr();
      }
      String s = "y";

      schedule = new Schedule();

      schedule.setScheduleId(scheduleId);
      schedule.setScheduleName(scheduleName);
      schedule.setScheduleStartDate(startDate);
      schedule.setScheduleEndDate(endDate);
      schedule.setScheduleDays(days);
      schedule.setBatchId(batchId);
      schedule.setStatus(s);
      schedule.setCreatedBy(id);
      schedule.setIpAddress(ipaddress);
      
      result = scheduledao.editSchedule(schedule);
      System.out.println("controller"+result);
      return result;
  }


}
