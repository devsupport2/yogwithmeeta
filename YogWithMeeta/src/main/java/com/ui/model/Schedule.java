package com.ui.model;

public class Schedule {

  private int scheduleId;
  private int batchId;
  private String scheduleName;
  private String scheduleStartDate;
  private String scheduleEndDate;
  private String scheduleDays;
  private String status;
  private int createdBy;
  private String createdDate;
  private String ipAddress; 
  

  private String batchStartTime;
  private String batchEndTime;
  
  
  
  
  public int getScheduleId() {
    return scheduleId;
  }
  public void setScheduleId(int scheduleId) {
    this.scheduleId = scheduleId;
  }
  public int getBatchId() {
    return batchId;
  }
  public void setBatchId(int batchId) {
    this.batchId = batchId;
  }
  public String getScheduleName() {
    return scheduleName;
  }
  public void setScheduleName(String scheduleName) {
    this.scheduleName = scheduleName;
  }
  public String getScheduleStartDate() {
    return scheduleStartDate;
  }
  public void setScheduleStartDate(String scheduleStartDate) {
    this.scheduleStartDate = scheduleStartDate;
  }
  public String getScheduleEndDate() {
    return scheduleEndDate;
  }
  public void setScheduleEndDate(String scheduleEndDate) {
    this.scheduleEndDate = scheduleEndDate;
  }
  public String getScheduleDays() {
    return scheduleDays;
  }
  public void setScheduleDays(String scheduleDays) {
    this.scheduleDays = scheduleDays;
  }
  public String getStatus() {
    return status;
  }
  public void setStatus(String status) {
    this.status = status;
  }
  public int getCreatedBy() {
    return createdBy;
  }
  public void setCreatedBy(int createdBy) {
    this.createdBy = createdBy;
  }
  public String getCreatedDate() {
    return createdDate;
  }
  public void setCreatedDate(String createdDate) {
    this.createdDate = createdDate;
  }
  public String getIpAddress() {
    return ipAddress;
  }
  public void setIpAddress(String ipAddress) {
    this.ipAddress = ipAddress;
  }
  public String getBatchStartTime() {
    return batchStartTime;
  }
  public void setBatchStartTime(String batchStartTime) {
    this.batchStartTime = batchStartTime;
  }
  public String getBatchEndTime() {
    return batchEndTime;
  }
  public void setBatchEndTime(String batchEndTime) {
    this.batchEndTime = batchEndTime;
  }
  
  
  
  
}
