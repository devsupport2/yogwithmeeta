package com.ui.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.ui.dao.BatchDao;
import com.ui.model.Batch;

public class BatchDAOImpl implements BatchDao {

  @Autowired
  private DataSource dataSource;

  public void setDataSource(DataSource dataSource) {
      this.dataSource = dataSource;
  }

  JdbcTemplate jdbcTemplate;
  private static final Logger logger = LoggerFactory.getLogger(BatchDAOImpl.class);
  
  @Override
  public List<Batch> getBatchByPage(int pagesize, int startindex) {
    logger.info("+++++ GET BATCH BY PAGE +++++");
    List<Batch> sta = new ArrayList<Batch>();
    String s = "y";
    String sql = "select batch_id, batch_name, batch_start_time, batch_end_time, batch_description from batch where status=? order by batch_name limit ?,?";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, s);
        ps.setInt(2, startindex);
        ps.setInt(3, pagesize);
        Batch a = null;
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            a = new Batch();
            a.setBatchId(rs.getInt("batch_id"));
            a.setBatchName(rs.getString("batch_name"));
            a.setBatchStartTime(rs.getString("batch_start_time"));
            a.setBatchEndTime(rs.getString("batch_End_time"));
            a.setBatchDescription(rs.getString("batch_description"));
            sta.add(a);
        }
        rs.close();
        ps.close();
        return sta;
    } catch (SQLException e) {
        throw new RuntimeException(e);
    } finally {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
            }
        }
    }
  }
  
  @Override
  public String addBatch(Batch batch) {
    logger.info("+++++ ADD BATCH +++++");
    String sql = "insert into batch (batch_name, batch_start_time, batch_end_time, batch_description, status, created_by, ip_address) values (?,?,?,?,?,?,?)";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, batch.getBatchName());
        ps.setString(2, batch.getBatchStartTime());
        ps.setString(3, batch.getBatchEndTime());
        ps.setString(4, batch.getBatchDescription());
        ps.setString(5, batch.getStatus());
        ps.setInt(6, batch.getCreatedBy());
        ps.setString(7, batch.getIpAddress());
        ps.executeUpdate();
        return "Success";
    } catch (SQLException e) {
        return "Data not saved!";
    } finally {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
            }
        }
    }
  }

  @Override
  public Batch getBatchDetailById(int batchid) {
    logger.info("+++++ GET BATCH DETAIL BY ID +++++");
    Batch a = null;
    String sql = "select batch_id, batch_name, batch_start_time, batch_end_time, batch_description from batch where batch_id=?";

    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, batchid);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
          a = new Batch();
          a.setBatchId(rs.getInt("batch_id"));
          a.setBatchName(rs.getString("batch_name"));
          a.setBatchStartTime(rs.getString("batch_start_time"));
          a.setBatchEndTime(rs.getString("batch_End_time"));
          a.setBatchDescription(rs.getString("batch_description"));
        }
        rs.close();
        ps.close();

        return a;
    } catch (SQLException e) {
        throw new RuntimeException(e);
    } finally {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
            }
        }
    }
  }

  @Override
  public String editBatch(Batch batch) {
    logger.info("+++++ EDIT BATCH +++++");
    String sql = "update batch set batch_name=?, batch_start_time=?, batch_end_time=?, batch_description=?, status=?, created_by=?, ip_address=? where batch_id=?";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, batch.getBatchName());
        ps.setString(2, batch.getBatchStartTime());
        ps.setString(3, batch.getBatchEndTime());
        ps.setString(4, batch.getBatchDescription());
        ps.setString(5, batch.getStatus());
        ps.setInt(6, batch.getCreatedBy());
        ps.setString(7, batch.getIpAddress());
        ps.setInt(8, batch.getBatchId());
        ps.executeUpdate();
        return "Success";
    } catch (SQLException e) {
        return "Data not updated!";
    } finally {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
            }
        }
    }
  }

  @Override
  public List<Batch> getAllBatchName() {
    logger.info("+++++ GET ALL BATCH NAME +++++");
    List<Batch> sta = new ArrayList<Batch>();
    String s = "y";
    String sql = "select batch_id, batch_name from batch where status=? order by batch_name";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, s);
        Batch a = null;
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            a = new Batch();
            a.setBatchId(rs.getInt("batch_id"));
            a.setBatchName(rs.getString("batch_name"));
            sta.add(a);
        }
        rs.close();
        ps.close();
        return sta;
    } catch (SQLException e) {
        throw new RuntimeException(e);
    } finally {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
            }
        }
    }
  }

  @Override
  public Batch getBatchTimingsById(int batchId) {
    logger.info("+++++ GET BATCH DETAIL BY ID +++++");
    Batch a = null;
    String sql = "select batch_start_time, batch_end_time from batch where batch_id=?";

    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, batchId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
          a = new Batch();
          a.setBatchStartTime(rs.getString("batch_start_time"));
          a.setBatchEndTime(rs.getString("batch_End_time"));
        }
        rs.close();
        ps.close();

        return a;
    } catch (SQLException e) {
        throw new RuntimeException(e);
    } finally {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
            }
        }
    }
  }

  @Override
  public void deleteBatch(int batchid) {
    logger.info("+++++ DELETE BATCH +++++");
    String status = "n";
    String sql = "update batch set status=? where batch_id=?";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, status);
        ps.setInt(2, batchid);
        ps.executeUpdate();
    } catch (SQLException e) {
        throw new RuntimeException(e);
    } finally {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
            }
        }
    }
    
  }

  
  
  
}//end
