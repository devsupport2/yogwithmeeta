package com.ui.model;

public class Batch {
  
  private int batchId;
  private String batchName;
  private String batchStartTime;
  private String batchEndTime;
  private String batchDescription;
  private String status;
  private int createdBy;
  private String createdDate;
  private String ipAddress;
  
  
  
  public int getBatchId() {
    return batchId;
  }
  public void setBatchId(int batchId) {
    this.batchId = batchId;
  }
  public String getBatchName() {
    return batchName;
  }
  public void setBatchName(String batchName) {
    this.batchName = batchName;
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
  public String getBatchDescription() {
    return batchDescription;
  }
  public void setBatchDescription(String batchDescription) {
    this.batchDescription = batchDescription;
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

  
  
}
