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

import com.ui.dao.CourseDAO;
import com.ui.model.Cource;

public class CourseDAOImpl implements CourseDAO {
  @Autowired
  private DataSource dataSource;

  public void setDataSource(DataSource dataSource) {
      this.dataSource = dataSource;
  }

  JdbcTemplate jdbcTemplate;
  private static final Logger logger = LoggerFactory.getLogger(CourseDAOImpl.class);

  @Override
  public List<Cource> getCourseByPage(int pagesize, int startindex) {
    logger.info("+++++ GET COURCE BY PAGE +++++");
    List<Cource> sta = new ArrayList<Cource>();
    String s = "y";
    String sql = "select c.course_id, c.course_title, c.schedule_id, sc.schedule_name, sc.schedule_start_date, sc.schedule_end_date, sc.schedule_days, bt.batch_id, bt.batch_name, bt.batch_start_time, bt.batch_end_time from course c left join schedule sc on c.schedule_id = sc.schedule_id left join batch bt on bt.batch_id = sc.batch_id where c.status=? order by c.course_title limit ?,?";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, s);
        ps.setInt(2, startindex);
        ps.setInt(3, pagesize);
        Cource a = null;
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            a = new Cource();
            a.setCourceId(rs.getInt("course_id"));
            a.setCourceTitle(rs.getString("course_title"));
            a.setScheduleName(rs.getString("schedule_name"));
            a.setScheduleStartDate(rs.getString("schedule_start_date"));
            a.setScheduleEndDate(rs.getString("schedule_end_date"));
            a.setScheduleDays(rs.getString("schedule_days"));
            a.setBatchName(rs.getString("batch_name"));
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
  public Cource getCourseDetailById(int id) {
    logger.info("+++++ GET COURCE DETAIL BY ID +++++");
    String s = "y";
    String sql = "select c.course_id, c.course_title, c.course_subtitle, c.course_description, c.course_image, c.schedule_id, c.course_location, c.course_fee, c.course_fee_validity, c.currency_id, c.contact_person, c.contact_person_phone, c.contact_person_email, c.course_video, sc.schedule_name, sc.schedule_start_date, sc.schedule_end_date, sc.schedule_days, bt.batch_id, bt.batch_name, bt.batch_start_time, bt.batch_end_time  from course c left join schedule sc on c.schedule_id = sc.schedule_id left join batch bt on bt.batch_id = sc.batch_id  where course_id=? ";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        Cource a = null;
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            a = new Cource();
            a.setCourceId(rs.getInt("course_id"));
            a.setCourceTitle(rs.getString("course_title"));
            a.setCourceSubTitle(rs.getString("course_subtitle"));
            a.setCourceDescription(rs.getString("course_description"));
            a.setCourceImage(rs.getString("course_image"));
            a.setScheduleId(rs.getInt("schedule_id"));
            a.setCourceLocation(rs.getString("course_location"));
            a.setCourseFee(rs.getFloat("course_fee"));
            a.setCourceFeeValidity(rs.getString("course_fee_validity"));
            a.setCurrencyId(rs.getInt("currency_id"));
            a.setContactPersonName(rs.getString("contact_person"));
            a.setContactPersonPhone(rs.getString("contact_person_phone"));
            a.setContactPersonEmail(rs.getString("contact_person_email"));
            a.setVideoLink(rs.getString("course_video"));
            
            a.setScheduleName(rs.getString("schedule_name"));
            a.setScheduleStartDate(rs.getString("schedule_start_date"));
            a.setScheduleEndDate(rs.getString("schedule_end_date"));
            a.setScheduleDays(rs.getString("schedule_days"));
            a.setBatchName(rs.getString("batch_name"));
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
  public String addCourse(Cource course) {
    logger.info("+++++ ADD Cource +++++");
    String sql = "insert into course (course_title, course_subtitle, course_description, course_image, schedule_id, course_location, course_fee, course_fee_validity, currency_id, contact_person, contact_person_phone, contact_person_email, status, created_by, ip_address, course_video) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        
        ps.setString(1, course.getCourceTitle());
        ps.setString(2, course.getCourceSubTitle());
        ps.setString(3, course.getCourceDescription());
        ps.setString(4, course.getCourceImage());
        ps.setInt(5, course.getScheduleId());
        ps.setString(6, course.getCourceLocation());
        ps.setFloat(7, course.getCourseFee());
        ps.setString(8, course.getCourceFeeValidity());
        ps.setInt(9, course.getCurrencyId());
        ps.setString(10, course.getContactPersonName());
        ps.setString(11, course.getContactPersonPhone());
        ps.setString(12, course.getContactPersonEmail());
        ps.setString(13, course.getStatus());
        ps.setInt(14, course.getCreatedBy());
        ps.setString(15, course.getIpAddress());
        ps.setString(16, course.getVideoLink());
       
        
        ps.executeUpdate();
        return "Success";
    } catch (SQLException e) {
      System.out.println("Error adding course"+e);
        return "Fail";
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
  public String editCourse(Cource course) {
    logger.info("+++++ EDIT COURSE +++++");
    String sql = "update course set course_title=?, course_subtitle=?, course_description=?, course_image=?, schedule_id=?, course_location=?, course_fee=?, course_fee_validity=?, currency_id=?, contact_person=?, contact_person_phone=?, contact_person_email=?, status=?, created_by=?, ip_address=?, course_video=? where course_id=?";
    Connection conn = null;
    try {
      conn = dataSource.getConnection();
      PreparedStatement ps = conn.prepareStatement(sql);
      
      ps.setString(1, course.getCourceTitle());
      ps.setString(2, course.getCourceSubTitle());
      ps.setString(3, course.getCourceDescription());
      ps.setString(4, course.getCourceImage());
      ps.setInt(5, course.getScheduleId());
      ps.setString(6, course.getCourceLocation());
      ps.setFloat(7, course.getCourseFee());
      ps.setString(8, course.getCourceFeeValidity());
      ps.setInt(9, course.getCurrencyId());
      ps.setString(10, course.getContactPersonName());
      ps.setString(11, course.getContactPersonPhone());
      ps.setString(12, course.getContactPersonEmail());
      ps.setString(13, course.getStatus());
      ps.setInt(14, course.getCreatedBy());
      ps.setString(15, course.getIpAddress());
      ps.setString(16, course.getVideoLink());
      ps.setInt(17, course.getCourceId());
     
      
      ps.executeUpdate();
      return "Success";
    } catch (SQLException e) {
      System.out.println("Error adding course"+e);
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
  public List<Cource> getThreeCourseFront() {
    logger.info("+++++ GET THREE COURSE FOR FRONT +++++");
    List<Cource> sta = new ArrayList<Cource>();
    String s = "y";
    String sql = "select c.course_id, c.course_title, c.course_description, c.course_fee, c.course_fee_validity, c.course_image, c.schedule_id, sc.schedule_name, sc.schedule_start_date, sc.schedule_end_date, sc.schedule_days, bt.batch_id, bt.batch_name, bt.batch_start_time, bt.batch_end_time from course c left join schedule sc on c.schedule_id = sc.schedule_id left join batch bt on bt.batch_id = sc.batch_id where c.status=? order by c.course_id DESC limit 0,3";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, s);
        Cource a = null;
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            a = new Cource();
            a.setCourceId(rs.getInt("course_id"));
            a.setCourceTitle(rs.getString("course_title"));
            a.setCourceDescription(rs.getString("course_description"));
            a.setCourseFee(rs.getFloat("course_fee"));
            a.setCourceFeeValidity(rs.getString("course_fee_validity"));
            a.setCourceImage(rs.getString("course_image"));
            a.setScheduleName(rs.getString("schedule_name"));
            a.setScheduleStartDate(rs.getString("schedule_start_date"));
            a.setScheduleEndDate(rs.getString("schedule_end_date"));
            a.setScheduleDays(rs.getString("schedule_days"));
            a.setBatchName(rs.getString("batch_name"));
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
  public void deleteCourse(int courseid) {
    logger.info("+++++ DELETE COURSE +++++");
    String status = "n";
    String sql = "update course set status=? where course_id=?";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, status);
        ps.setInt(2, courseid);
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

  @Override
  public List<Cource> getAllCourseFront() {
    logger.info("+++++ GET ALL COURSE FOR FRONT +++++");
    List<Cource> sta = new ArrayList<Cource>();
    String s = "y";
    String sql = "select c.course_id, c.course_title, c.course_description, c.course_fee, c.course_fee_validity, c.course_image, c.schedule_id, sc.schedule_name, sc.schedule_start_date, sc.schedule_end_date, sc.schedule_days, bt.batch_id, bt.batch_name, bt.batch_start_time, bt.batch_end_time from course c left join schedule sc on c.schedule_id = sc.schedule_id left join batch bt on bt.batch_id = sc.batch_id where c.status=? order by c.course_id DESC";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, s);
        Cource a = null;
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            a = new Cource();
            a.setCourceId(rs.getInt("course_id"));
            a.setCourceTitle(rs.getString("course_title"));
            a.setCourceDescription(rs.getString("course_description"));
            a.setCourseFee(rs.getFloat("course_fee"));
            a.setCourceFeeValidity(rs.getString("course_fee_validity"));
            a.setCourceImage(rs.getString("course_image"));
            a.setScheduleName(rs.getString("schedule_name"));
            a.setScheduleStartDate(rs.getString("schedule_start_date"));
            a.setScheduleEndDate(rs.getString("schedule_end_date"));
            a.setScheduleDays(rs.getString("schedule_days"));
            a.setBatchName(rs.getString("batch_name"));
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
  public List<Cource> getAllCourseName() {
    logger.info("+++++ GET ALL COURSE NAMES +++++");
    List<Cource> sta = new ArrayList<Cource>();
    String s = "y";
    String sql = "select c.course_id, c.course_title from course c where c.status=? order by c.course_title";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, s);
        Cource a = null;
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            a = new Cource();
            a.setCourceId(rs.getInt("course_id"));
            a.setCourceTitle(rs.getString("course_title"));
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

 

}
