package com.ui.dao;

import java.util.List;

import com.ui.model.Batch;

public interface BatchDao {


  List<Batch> getBatchByPage(int pagesize, int startindex);
  String addBatch(Batch batch);
  Batch getBatchDetailById(int batchid);
  String editBatch(Batch batch);
  List<Batch> getAllBatchName();
  Batch getBatchTimingsById(int batchId);
  void deleteBatch(int batchid);
  
  

}
