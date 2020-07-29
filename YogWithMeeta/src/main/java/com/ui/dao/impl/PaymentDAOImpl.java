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

import com.ui.dao.PaymentDAO;
import com.ui.model.Batch;
import com.ui.model.Order;

public class PaymentDAOImpl implements PaymentDAO {

  @Autowired
  private DataSource dataSource;

  public void setDataSource(DataSource dataSource) {
      this.dataSource = dataSource;
  }

  JdbcTemplate jdbcTemplate;
  private static final Logger logger = LoggerFactory.getLogger(ScheduleDAOImpl.class);
  
  @Override
  public Order getLastOrderDetail() {
    logger.info("+++++ GET LAST ORDER DETAIL +++++");
    Order od = null;
    String sql = "select order_id, sequence, order_number from orders order by order_id desc limit 0,1";

    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            od = new Order();

            od.setOrderId(rs.getInt("order_id"));
            od.setSequence(rs.getInt("sequence"));
            od.setOrderNumber(rs.getString("order_number"));
        }
        rs.close();
        ps.close();
        return od;
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
  public String addOrder(Order order) {
    logger.info("+++++ ADD ORDER DETAIL +++++");
    String sql1 = "SET time_zone = '+05:30'";
    String sql = "insert into orders (sequence, order_number, user_id, course_id, amount_paid, order_status, payment_status, payment_mode, created_by, ip_address, status, order_date) values (?,?,?,?,?,?,?,?,?,?,?,CURRENT_TIMESTAMP())";

    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql1);
        ps.execute();
        ps = conn.prepareStatement(sql);
        
        ps.setInt(1, order.getSequence());
        ps.setString(2, order.getOrderNumber());
        ps.setInt(3, order.getUserId());
        ps.setInt(4, order.getCourseId());
        ps.setFloat(5, order.getAmountPaid());
        ps.setString(6, order.getOrderStatus());
        ps.setString(7, order.getPaymentStatus());
        ps.setString(8, order.getPaymentMode());
        ps.setInt(9, order.getCreatedBy());
        ps.setString(10, order.getIpAddress());
        ps.setString(11, "y");
        ps.executeUpdate();
        return "Success";
    }

    catch (SQLException e) {
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
  public List<Order> getAllPaymentDetailByUser(int userid) {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public String addCcavenueResponse(Order orderDetail) {
    logger.info("+++++ UPDATE CCAVENUE RESPONSE +++++");

    
    
    String sql = "update orders set order_status=?, payment_status=?, trackingID=?, bank_ref_no=?, failure_message=?, payment_mode=?, card_name=?, bank_name=?, status_code=?, currency=? where order_number=?";
    //String sql = "insert into order_detail (sequence, order_number, quotation_id, customer_name, customer_emailid, customer_mobileno, biller_name, biller_emailid, biller_address1, biller_address2, biller_country_name, biller_state_name, biller_city_name, biller_pincode, biller_mobileno, delivery_name, delivery_emailid, delivery_address1, delivery_address2, delivery_country_name, delivery_state_name, delivery_city_name, delivery_pincode, delivery_mobileno, subtotal, total_amount, user_id, order_status, payment_status, delivery_type, tracking_id, bank_reference_number, failure_message, payment_mode, card_name, bank_name, status_code, currency, order_date, created_by, ip_address, order_by) select sequence, order_number, quotation_id, customer_name, customer_emailid, customer_mobileno, biller_name, biller_emailid, biller_address1, biller_address2, biller_country_name, biller_state_name, biller_city_name, biller_pincode, biller_mobileno, delivery_name, delivery_emailid, delivery_address1, delivery_address2, delivery_country_name, delivery_state_name, delivery_city_name, delivery_pincode, delivery_mobileno, subtotal, total_amount, user_id, ?, ?, delivery_type, ?, ?, ?, ?, ?, ?, ?, ?, order_date, created_by, ip_address, order_by from order_detail where order_number=? order by order_detail_id desc limit 0,1";

    Connection conn = null;

    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, orderDetail.getOrderStatus());
        ps.setString(2, orderDetail.getPaymentStatus());
        ps.setString(3, orderDetail.getTrackingId());
        ps.setString(4, orderDetail.getBankReferenceNumber());
        ps.setString(5, orderDetail.getFailureMessage());
        ps.setString(6, orderDetail.getPaymentMode());
        ps.setString(7, orderDetail.getCardName());
        ps.setString(8, orderDetail.getBankName());
        ps.setInt(9, orderDetail.getStatusCode());
        ps.setString(10, orderDetail.getCurrency());
        ps.setString(11, orderDetail.getOrderNumber());

        ps.executeUpdate();
        
        return "Success";
    }

    catch (SQLException e) {
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
  public Order getOrderDetailByOrderNumber(String ordernumber) {
    logger.info("+++++ GET ORDER DETAIL BY ORDER NUMBER +++++");
    Order od = null;
    String sql = "select od.order_id, od.sequence, od.order_number, od.amount_paid, od.user_id, od.order_status, od.payment_status, od.trackingID, od.bank_ref_no, od.failure_message, od.payment_mode, od.card_name, od.bank_name, od.status_code, od.currency, DATE_FORMAT(od.order_date, '%d/%m/%Y %h:%i %p') as order_date, od.created_by, od.created_date, od.ip_address, u.first_name, u.last_name, u.email, u.mobile_no, od.course_id, c.course_title from orders od left join user u on u.user_id = od.user_id left join course c on c.course_id = od.course_id where order_number = ?";

    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, ordernumber);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            od = new Order();

            od.setOrderId(rs.getInt("order_id"));
            od.setSequence(rs.getInt("sequence"));
            od.setOrderNumber(rs.getString("order_number"));
            od.setAmountPaid(rs.getFloat("amount_paid"));
            od.setUserId(rs.getInt("user_id"));
            od.setOrderStatus(rs.getString("order_status"));
            od.setPaymentStatus(rs.getString("payment_status"));
            od.setTrackingId(rs.getString("trackingID"));
            od.setBankReferenceNumber(rs.getString("bank_ref_no"));
            od.setFailureMessage(rs.getString("failure_message"));
            od.setPaymentMode(rs.getString("payment_mode"));
            od.setCardName(rs.getString("card_name"));
            od.setBankName(rs.getString("bank_name"));
            od.setStatusCode(rs.getInt("status_code"));
            od.setCurrency(rs.getString("currency"));
            od.setOrderDate(rs.getString("order_date"));
            od.setCreatedBy(rs.getInt("created_by"));
            od.setCreatedDate(rs.getString("created_date"));
            od.setIpAddress(rs.getString("ip_address"));  
            od.setUserfirstName(rs.getString("first_name"));
            od.setUserlastName(rs.getString("last_name"));
            od.setCourseId(rs.getInt("course_id"));
            od.setCourceTitle(rs.getString("course_title"));
            od.setUserEmail(rs.getString("email"));
            od.setUserMobile(rs.getString("mobile_no"));
        }
        rs.close();
        ps.close();
        return od;
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
  public List<Order> getTransactionsByPage(int pagesize, int startindex) {
    logger.info("+++++ GET Transaction by page +++++");
    Order od = null;
    List<Order> sta = new ArrayList<Order>();
    String s = "y";
    String sql = "select od.order_id, od.order_number, od.amount_paid, od.user_id, u.first_name, u.last_name, od.course_id, c.course_title, od.order_status, od.payment_status, DATE_FORMAT(od.order_date, '%d/%m/%Y %h:%i %p') as order_date from orders od left join user u on u.user_id = od.user_id left join course c on c.course_id = od.course_id where od.status=? order by order_number limit ?,?";

    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, s);
        ps.setInt(2, startindex);
        ps.setInt(3, pagesize);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            od = new Order();

            od.setOrderId(rs.getInt("order_id"));
            od.setOrderNumber(rs.getString("order_number"));
            od.setAmountPaid(rs.getFloat("amount_paid"));
            od.setUserId(rs.getInt("user_id"));
            od.setUserfirstName(rs.getString("first_name"));
            od.setUserlastName(rs.getString("last_name"));
            od.setCourseId(rs.getInt("course_id"));
            od.setCourceTitle(rs.getString("course_title"));
            od.setOrderDate(rs.getString("order_date"));
            od.setOrderStatus(rs.getString("order_status"));
            od.setPaymentStatus(rs.getString("payment_status"));
            
            sta.add(od);
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
  public List<Order> getAllTransactionsByDateAndPage(String fromdate, String todate, int pagesize, int startindex) {
    logger.info("+++++ GET Transaction by DATE AND PAGE +++++");
    Order od = null;
    List<Order> sta = new ArrayList<Order>();
    String s = "y";
    String sql = "select od.order_id, od.order_number, od.amount_paid, od.user_id, u.first_name, u.last_name, od.course_id, c.course_title, od.order_status, od.payment_status, DATE_FORMAT(od.order_date, '%d/%m/%Y %h:%i %p') as order_date from orders od left join user u on u.user_id = od.user_id left join course c on c.course_id = od.course_id where od.status=? and od.order_date between STR_TO_DATE(?,'%d/%m/%Y') and STR_TO_DATE(?,'%d/%m/%Y %H:%i:%s') order by order_number limit ?,?";
    /*select od.order_id, od.order_number, od.amount_paid, od.user_id, u.first_name, u.last_name, od.course_id, c.course_title, od.order_status, od.payment_status, DATE_FORMAT(od.order_date, '%d/%m/%Y %h:%i %p') as order_date from orders od left join user u on u.user_id = od.user_id left join course c on c.course_id = od.course_id where od.status='y' and od.order_date between STR_TO_DATE('12/06/2020','%d/%m/%Y') and STR_TO_DATE('01/06/2020 23:59:59','%d/%m/%Y %H:%i:%s') order by order_number limit 0,100*/
    String datetime = (todate+" "+"23:59:59");
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, s);
        ps.setString(2, fromdate);
        ps.setString(3, datetime);
        ps.setInt(4, startindex);
        ps.setInt(5, pagesize);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            od = new Order();

            od.setOrderId(rs.getInt("order_id"));
            od.setOrderNumber(rs.getString("order_number"));
            od.setAmountPaid(rs.getFloat("amount_paid"));
            od.setUserId(rs.getInt("user_id"));
            od.setUserfirstName(rs.getString("first_name"));
            od.setUserlastName(rs.getString("last_name"));
            od.setCourseId(rs.getInt("course_id"));
            od.setCourceTitle(rs.getString("course_title"));
            od.setOrderDate(rs.getString("order_date"));
            od.setOrderStatus(rs.getString("order_status"));
            od.setPaymentStatus(rs.getString("payment_status"));
            
            sta.add(od);
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
  public List<Order> getTransactionsByPageForUser(int user_id, int pagesize, int startindex) {
    logger.info("+++++ GET Transaction by page for user +++++");
    Order od = null;
    List<Order> sta = new ArrayList<Order>();
    String s = "y";
    String sql = "select od.order_id, od.order_number, od.amount_paid, od.user_id, u.first_name, u.last_name, od.course_id, c.course_title, od.order_status, od.payment_status, DATE_FORMAT(od.order_date, '%d/%m/%Y %h:%i %p') as order_date from orders od left join user u on u.user_id = od.user_id left join course c on c.course_id = od.course_id where od.status=? and od.user_id=? order by order_number limit ?,?";

    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, s);
        ps.setInt(2, user_id);
        ps.setInt(3, startindex);
        ps.setInt(4, pagesize);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            od = new Order();

            od.setOrderId(rs.getInt("order_id"));
            od.setOrderNumber(rs.getString("order_number"));
            od.setAmountPaid(rs.getFloat("amount_paid"));
            od.setUserId(rs.getInt("user_id"));
            od.setUserfirstName(rs.getString("first_name"));
            od.setUserlastName(rs.getString("last_name"));
            od.setCourseId(rs.getInt("course_id"));
            od.setCourceTitle(rs.getString("course_title"));
            od.setOrderDate(rs.getString("order_date"));
            od.setOrderStatus(rs.getString("order_status"));
            od.setPaymentStatus(rs.getString("payment_status"));
            
            sta.add(od);
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
  public List<Order> getParticipantsByPage(int pagesize, int startindex) {
    logger.info("+++++ GET Participants by page +++++");
    Order od = null;
    List<Order> sta = new ArrayList<Order>();
    String s = "y";
    String sql = "select od.order_id, od.order_number, od.amount_paid, od.user_id, u.first_name, u.last_name, od.course_id, c.course_title, od.order_status, od.payment_status, DATE_FORMAT(od.order_date, '%d/%m/%Y %h:%i %p') as order_date from orders od left join user u on u.user_id = od.user_id left join course c on c.course_id = od.course_id where od.status=? and (od.payment_status='Paid' OR od.payment_status='Success' OR od.payment_status='Free Event') order by order_number limit ?,?";

    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, s);
        ps.setInt(2, startindex);
        ps.setInt(3, pagesize);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            od = new Order();

            od.setOrderId(rs.getInt("order_id"));
            od.setOrderNumber(rs.getString("order_number"));
            od.setAmountPaid(rs.getFloat("amount_paid"));
            od.setUserId(rs.getInt("user_id"));
            od.setUserfirstName(rs.getString("first_name"));
            od.setUserlastName(rs.getString("last_name"));
            od.setCourseId(rs.getInt("course_id"));
            od.setCourceTitle(rs.getString("course_title"));
            od.setOrderDate(rs.getString("order_date"));
            od.setOrderStatus(rs.getString("order_status"));
            od.setPaymentStatus(rs.getString("payment_status"));
            
            sta.add(od);
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
  public List<Order> getAllParticipantsByDateAndPage(String fromdate, String todate, int pagesize, int startindex) {
    logger.info("+++++ GET Participants by DATE AND PAGE +++++");
    Order od = null;
    List<Order> sta = new ArrayList<Order>();
    String s = "y";
    String sql = "select od.order_id, od.order_number, od.amount_paid, od.user_id, u.first_name, u.last_name, od.course_id, c.course_title, od.order_status, od.payment_status, DATE_FORMAT(od.order_date, '%d/%m/%Y %h:%i %p') as order_date from orders od left join user u on u.user_id = od.user_id left join course c on c.course_id = od.course_id where od.status=? and od.order_date between STR_TO_DATE(?,'%d/%m/%Y') and STR_TO_DATE(?,'%d/%m/%Y %H:%i:%s') and and (od.payment_status='Paid' OR od.payment_status='Success' OR od.payment_status='Free Event') order by order_number limit ?,?";
    /*select od.order_id, od.order_number, od.amount_paid, od.user_id, u.first_name, u.last_name, od.course_id, c.course_title, od.order_status, od.payment_status, DATE_FORMAT(od.order_date, '%d/%m/%Y %h:%i %p') as order_date from orders od left join user u on u.user_id = od.user_id left join course c on c.course_id = od.course_id where od.status='y' and od.order_date between STR_TO_DATE('12/06/2020','%d/%m/%Y') and STR_TO_DATE('01/06/2020 23:59:59','%d/%m/%Y %H:%i:%s') order by order_number limit 0,100*/
    String datetime = (todate+" "+"23:59:59");
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, s);
        ps.setString(2, fromdate);
        ps.setString(3, datetime);
        ps.setInt(4, startindex);
        ps.setInt(5, pagesize);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            od = new Order();

            od.setOrderId(rs.getInt("order_id"));
            od.setOrderNumber(rs.getString("order_number"));
            od.setAmountPaid(rs.getFloat("amount_paid"));
            od.setUserId(rs.getInt("user_id"));
            od.setUserfirstName(rs.getString("first_name"));
            od.setUserlastName(rs.getString("last_name"));
            od.setCourseId(rs.getInt("course_id"));
            od.setCourceTitle(rs.getString("course_title"));
            od.setOrderDate(rs.getString("order_date"));
            od.setOrderStatus(rs.getString("order_status"));
            od.setPaymentStatus(rs.getString("payment_status"));
            
            sta.add(od);
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
