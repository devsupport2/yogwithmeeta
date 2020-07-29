package com.ui.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.ui.dao.ScheduleDAO;
import com.ui.model.Batch;
import com.ui.model.Schedule;

public class ScheduleDAOImpl implements ScheduleDAO {
  
  @Autowired
  private DataSource dataSource;

  public void setDataSource(DataSource dataSource) {
      this.dataSource = dataSource;
  }

  JdbcTemplate jdbcTemplate;
  private static final Logger logger = LoggerFactory.getLogger(ScheduleDAOImpl.class);
  
  @Override
  public List<Schedule> getScheduleByPage(int pagesize, int startindex) {
    logger.info("+++++ GET SCHEDULE BY PAGE +++++");
    List<Schedule> sta = new ArrayList<Schedule>();
    String s = "y";
    String sql = "select sc.schedule_id, sc.batch_id, sc.schedule_name, DATE_FORMAT(sc.schedule_start_date, '%d/%m/%Y')as schedule_start_date , DATE_FORMAT(sc.schedule_end_date, '%d/%m/%Y') as schedule_end_date, sc.schedule_days, bt.batch_start_time, bt.batch_end_time from schedule sc left join batch bt on bt.batch_id = sc.batch_id where sc.status=? order by sc.schedule_name limit ?,?";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, s);
        ps.setInt(2, startindex);
        ps.setInt(3, pagesize);
        Schedule a = null;
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            a = new Schedule();
            a.setBatchId(rs.getInt("batch_id"));
            a.setScheduleId(rs.getInt("schedule_id"));
            a.setScheduleName(rs.getString("schedule_name"));
            a.setScheduleStartDate(rs.getString("schedule_start_date"));
            a.setScheduleEndDate(rs.getString("schedule_end_date"));
            a.setScheduleDays(rs.getString("schedule_days"));
            a.setBatchStartTime(rs.getString("batch_start_time"));
            a.setBatchEndTime(rs.getString("batch_end_time"));
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
  public String addSchedule(Schedule schedule) {
    logger.info("+++++ ADD SCHEDULE +++++");
    String sql = "insert into schedule (batch_id, schedule_name, schedule_start_date, schedule_end_date, schedule_days, status, created_by, ip_address) values (?,?,STR_TO_DATE(?,'%d/%m/%Y'),STR_TO_DATE(?,'%d/%m/%Y'),?,?,?,?)";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, schedule.getBatchId());
        ps.setString(2, schedule.getScheduleName());
        ps.setString(3, schedule.getScheduleStartDate());
        ps.setString(4, schedule.getScheduleEndDate());
        ps.setString(5, schedule.getScheduleDays());
        ps.setString(6, schedule.getStatus());
        ps.setInt(7, schedule.getCreatedBy());
        ps.setString(8, schedule.getIpAddress());
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
  public Schedule getScheduleDetailById(int scheduleid) {
      logger.info("+++++ GET SCHEDULE DETAIL BY ID +++++");
      Schedule a = null;
      String sql = "select sc.schedule_id, sc.batch_id, sc.schedule_name, DATE_FORMAT(sc.schedule_start_date, '%d/%m/%Y')as schedule_start_date , DATE_FORMAT(sc.schedule_end_date, '%d/%m/%Y') as schedule_end_date, sc.schedule_days, bt.batch_start_time, bt.batch_end_time from schedule sc left join batch bt on bt.batch_id = sc.batch_id where sc.schedule_id=?";

      Connection conn = null;
      try {
          conn = dataSource.getConnection();
          PreparedStatement ps = conn.prepareStatement(sql);
          ps.setInt(1, scheduleid);
          ResultSet rs = ps.executeQuery();
          if (rs.next()) {
            a = new Schedule();
            a.setBatchId(rs.getInt("batch_id"));
            a.setScheduleId(rs.getInt("schedule_id"));
            a.setScheduleName(rs.getString("schedule_name"));
            a.setScheduleStartDate(rs.getString("schedule_start_date"));
            a.setScheduleEndDate(rs.getString("schedule_end_date"));
            a.setScheduleDays(rs.getString("schedule_days"));
            a.setBatchStartTime(rs.getString("batch_start_time"));
            a.setBatchEndTime(rs.getString("batch_end_time"));
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
  public String editSchedule(Schedule schedule) {
    logger.info("+++++ EDIT SCHEDULE +++++");
    String sql = "update schedule set batch_id=?, schedule_name=?, schedule_start_date=STR_TO_DATE(?,'%d/%m/%Y'), schedule_end_date=STR_TO_DATE(?,'%d/%m/%Y'), schedule_days=?, status=?, created_by=?, ip_address=? where schedule_id=?";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, schedule.getBatchId());
        ps.setString(2, schedule.getScheduleName());
        ps.setString(3, schedule.getScheduleStartDate());
        ps.setString(4, schedule.getScheduleEndDate());
        ps.setString(5, schedule.getScheduleDays());
        ps.setString(6, schedule.getStatus());
        ps.setInt(7, schedule.getCreatedBy());
        ps.setString(8, schedule.getIpAddress());
        ps.setInt(9, schedule.getScheduleId());
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
  public List<Schedule> getAllSchedulesName() {
    logger.info("+++++ GET ALL SCHEDULE NAME +++++");
    List<Schedule> sta = new ArrayList<Schedule>();
    String s = "y";
    String sql = "select sc.schedule_id, sc.batch_id, sc.schedule_name, sc.schedule_start_date, sc.schedule_end_date, sc.schedule_days, bt.batch_start_time, bt.batch_end_time from schedule sc left join batch bt on bt.batch_id = sc.batch_id where sc.status=? order by sc.schedule_name";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, s);
        Schedule a = null;
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            a = new Schedule();
            a.setBatchId(rs.getInt("batch_id"));
            a.setScheduleId(rs.getInt("schedule_id"));
            a.setScheduleName(rs.getString("schedule_name"));
            a.setScheduleStartDate(rs.getString("schedule_start_date"));
            a.setScheduleEndDate(rs.getString("schedule_end_date"));
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
  public void deleteSchedule(int scheduleid) {
    logger.info("+++++ DELETE SCHEDULE +++++");
    String status = "n";
    String sql = "update schedule set status=? where schedule_id=?";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, status);
        ps.setInt(2, scheduleid);
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


}
