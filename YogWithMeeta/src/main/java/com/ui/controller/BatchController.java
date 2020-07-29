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

import com.ui.dao.BatchDao;
import com.ui.model.Batch;

@RestController
public class BatchController {
  @Autowired
  BatchDao batchDao;
  
  Batch batch;
  
  private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
  
  @GetMapping(value = "/getBatchByPage")
  public List<Batch> getPackageByPage(int pagesize, int startindex, HttpServletRequest request) {
      logger.info("***** GET BATCH BY PAGE *****");
      return batchDao.getBatchByPage(pagesize, startindex);
  }
  
  @DeleteMapping(value = "deleteBatch")
  public void delete(int batchid) {
      logger.info("***** DELETE USER *****");
      batchDao.deleteBatch(batchid);
  }
  
  @GetMapping(value = "/getAllBatchName")
  public List<Batch> getAllBatchName(HttpServletRequest request) {
      logger.info("***** GET ALL BATCH NAME *****");
      return batchDao.getAllBatchName();
  }
  
  @GetMapping(value = "/getBatchTimingsById")
  public Batch getBatchTimingsById(int batchId, HttpServletRequest request) {
      logger.info("***** GET ALL BATCH NAME *****");
      return batchDao.getBatchTimingsById(batchId);
  }
  
  @PostMapping(value = "addBatch")
  public String addBatch(String batchName, String startTime, String endTime, String description, HttpSession session, HttpServletRequest request,
          HttpServletResponse response) {
      logger.info("***** ADD BATCH *****");
      String result = "";

      int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
      String ipaddress = request.getHeader("X-FORWARDED-FOR");
      if (ipaddress == null) {
          ipaddress = request.getRemoteAddr();
      }
      String s = "y";

      batch = new Batch();
      
      String c = description.replace("$","&");
      String c1 = c.replace("~","#");
      String c2 = c1.replace("!","%");

      batch.setBatchName(batchName);
      batch.setBatchStartTime(startTime);
      batch.setBatchEndTime(endTime);
      batch.setBatchDescription(c2);
      batch.setStatus(s);
      batch.setCreatedBy(id);
      batch.setIpAddress(ipaddress);
      result = batchDao.addBatch(batch);
      
      return result;
  }
  
  
  @GetMapping(value = "/getBatchDetailById")
  public Batch getPackageDetailById(int batchid, HttpServletRequest request) {
      logger.info("***** GET PACKAGE DETAIL BY ID *****");
      return batchDao.getBatchDetailById(batchid);
  }
  
  
  @PostMapping(value = "editBatch")
  public String editBatch(int batchId, String batchName, String startTime, String endTime, String description, HttpSession session, HttpServletRequest request,
          HttpServletResponse response) {
      logger.info("***** EDIT BATCH *****");
      String result = "";

      int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
      String ipaddress = request.getHeader("X-FORWARDED-FOR");
      if (ipaddress == null) {
          ipaddress = request.getRemoteAddr();
      }
      String s = "y";

      String c = description.replace("$","&");
      String c1 = c.replace("~","#");
      String c2 = c1.replace("!","%");
      
      batch = new Batch();

      batch.setBatchId(batchId);
      batch.setBatchName(batchName);
      batch.setBatchStartTime(startTime);
      batch.setBatchEndTime(endTime);
      batch.setBatchDescription(c2);
      batch.setStatus(s);
      batch.setCreatedBy(id);
      batch.setIpAddress(ipaddress);
      result = batchDao.editBatch(batch);
      
      return result;
  }

}
