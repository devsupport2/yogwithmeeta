package com.ui.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ui.dao.PaymentDAO;
import com.ui.dao.UserDAO;
import com.ui.model.Batch;
import com.ui.model.Order;
import com.ui.model.User;

@RestController
public class PaymentController {
  
  @Autowired
  UserDAO userdao;
  
  @Autowired
  PaymentDAO paymentdao;

  User u;
  
  private static final Logger logger = LoggerFactory.getLogger(PaymentController.class); 
  
  @GetMapping(value = "/getAllPaymentDetailByUserId")
  public List<Order> getAllPaymentDetailByUser(int userid, HttpServletRequest request) {
      logger.info("***** GET ALL PAYMENT OF USER *****");
      return paymentdao.getAllPaymentDetailByUser(userid);
  }
  
  @GetMapping(value = "/getTransactionsByPageForUser")
  public List<Order> getTransactionsByPageForUser(int userID, int pagesize, int startindex, HttpServletRequest request) {
      logger.info("***** GET ALL TRANSACTIONS BY PAGE FOR USER *****");
      return paymentdao.getTransactionsByPageForUser(userID, pagesize, startindex);
  }
  
  @GetMapping(value = "/getTransactionsByPage")
  public List<Order> getTransactionsByPage(int pagesize, int startindex, HttpServletRequest request) {
      logger.info("***** GET ALL TRANSACTIONS BY PAGE *****");
      return paymentdao.getTransactionsByPage(pagesize, startindex);
  }
  
  @GetMapping(value = "/getParticipantsByPage")
  public List<Order> getParticipantsByPage(int pagesize, int startindex, HttpServletRequest request) {
      logger.info("***** GET ALL TRANSACTIONS BY PAGE *****");
      return paymentdao.getParticipantsByPage(pagesize, startindex);
  }
  
  @GetMapping(value = "/getAllTransactionsByDateAndPage")
  public List<Order> getAllTransactionsByDateAndPage(String fromdate, String todate,int pagesize, int startindex, HttpServletRequest request) {
      logger.info("***** GET ALL TRANSACTIONS BY DATE & PAGE *****");
      return paymentdao.getAllTransactionsByDateAndPage(fromdate, todate, pagesize, startindex);
  }
  
  @GetMapping(value = "/getAllParticipantsByDateAndPage")
  public List<Order> getAllParticipantsByDateAndPage(String fromdate, String todate,int pagesize, int startindex, HttpServletRequest request) {
      logger.info("***** GET ALL TRANSACTIONS BY DATE & PAGE *****");
      return paymentdao.getAllParticipantsByDateAndPage(fromdate, todate, pagesize, startindex);
  }
  
  @GetMapping(value = "/getOrderDetailByOrderNumber")
  public Order getOrderDetailByOrderNumber(String ordernumber, HttpServletRequest request) {
      logger.info("***** GET ORDER DETAIL *****");
      Order od = paymentdao.getOrderDetailByOrderNumber(ordernumber);

      return od;
  }
  
  @PostMapping(value = "payPaymentOnline")
  public String payPaymentOnline(int courseId, int userid, float amount, HttpServletRequest request,
          HttpSession session) {
      logger.info("***** ADD ORDER *****");
      

      String IpAddress = request.getHeader("X-FORWARDED-FOR");
      String result = null;
      if (IpAddress == null) {
          IpAddress = request.getRemoteAddr();
      }

      String orderno = null;
      String ordernumber = null;
      
      u = userdao.getUserDetailById(userid);
      
      int sequence = 0;

      Order od = paymentdao.getLastOrderDetail();


      if (od == null) {
          sequence = 1;
          orderno = "YWM-" + "ORD" + "-00001";

      } else {


          sequence = od.getSequence();

          if (sequence == 0) {
              sequence = 1;
              orderno = "YWM-" + "ORD" + "-00001";
          } else {

              if (sequence >= 1 && sequence < 10) {
                  orderno = "YWM-" + "ORD"+ "-0000" + Integer.toString(sequence);
              } else if (sequence >= 10 && sequence < 100) {
                  orderno = "YWM-" + "ORD"+ "-000" + Integer.toString(sequence);
              } else if (sequence >= 100 && sequence < 1000) {
                  orderno = "YWM-" + "ORD" + "-00" + Integer.toString(sequence);
              } else if (sequence >= 1000 && sequence < 10000) {
                  orderno = "YWM-" + "ORD" + "-0" + Integer.toString(sequence);
              } else if (sequence >= 10000 && sequence < 100000) {
                  orderno = "YWM-" + "ORD" + Integer.toString(sequence);
              }
          }
      }
      Order order = new Order();

      order.setSequence(sequence + 1);
      order.setOrderNumber(orderno);
      order.setUserId(userid);
      order.setCourseId(courseId);
      order.setOrderStatus("Incomplete");
      order.setPaymentStatus("Unpaid");
      order.setPaymentMode("To Be Selected");
      order.setAmountPaid(amount);
      order.setCreatedBy(userid);
      order.setIpAddress(IpAddress);
      
      if(amount == 0.0){
        order.setOrderStatus("Paid");
        order.setPaymentStatus("Free Event");
        order.setPaymentMode("No Payment");
        session.setAttribute("orderStatus", order.getOrderStatus());
      }
      
      session.setAttribute("totalamount", amount);
      session.setAttribute("billingname", u.getFirstName()+" "+u.getLastName());
      session.setAttribute("billingemail", u.getEmail());
      session.setAttribute("billingaddress1", u.getAddress());
      session.setAttribute("billingcountryname", u.getCountryName());
      session.setAttribute("billingstatename", u.getStateName());
      session.setAttribute("billingcityname", u.getCity());
      session.setAttribute("billingpincode", u.getPincode());
      session.setAttribute("billingmobileno", u.getMobileNo());

      paymentdao.addOrder(order);

      ordernumber = paymentdao.getLastOrderDetail().getOrderNumber();

      session.setAttribute("ordernumber", ordernumber);
      result = "Success";
      if(amount == 0.0){
        result = "Paid";
      }
      return result;
  }
  
  @PostMapping(value = "ccavenueResponse")
  public String ccavenueResponse(String orderid, String trackingid, String bankrefnumber, String orderstatus,
          String failuremessage, String paymentmode, String cardname, String statuscode, String statusmessage,
          String currency, String createddate, String createdtime, HttpSession session, HttpServletRequest request,
          HttpServletResponse res) {
      logger.info("***** ADD CCAVENUE RESPONSE *****");

      trackingid = trackingid.equalsIgnoreCase("null") ? "" : trackingid;
      bankrefnumber = bankrefnumber.equalsIgnoreCase("null") ? "" : bankrefnumber;
      orderstatus = orderstatus.equalsIgnoreCase("null") ? "" : orderstatus;
      failuremessage = failuremessage.equalsIgnoreCase("null") ? "" : failuremessage;
      paymentmode = paymentmode.equalsIgnoreCase("null") ? "" : paymentmode;
      cardname = cardname.equalsIgnoreCase("null") ? "" : cardname;
      statuscode = statuscode.equalsIgnoreCase("null") ? "" : statuscode;
      currency = currency.equalsIgnoreCase("null") ? "" : currency;

      Order orderDetail = new Order();
      orderDetail.setOrderNumber(orderid);
      orderDetail.setTrackingId(trackingid.isEmpty() ? "" : trackingid);
      orderDetail.setBankReferenceNumber(bankrefnumber.isEmpty() ? "" : bankrefnumber);
      orderDetail.setOrderStatus("New");
      orderDetail.setFailureMessage(failuremessage.isEmpty() ? "" : failuremessage);
      orderDetail.setPaymentStatus(orderstatus.isEmpty() ? "" : orderstatus);
      orderDetail.setPaymentMode(paymentmode.isEmpty() ? "" : paymentmode);
      orderDetail.setCardName(cardname.isEmpty() ? "" : cardname);
      orderDetail.setBankName(cardname.isEmpty() ? "" : cardname);
      orderDetail.setStatusCode(statuscode.isEmpty() ? 0 : Integer.parseInt(statuscode));
      orderDetail.setCurrency(currency.isEmpty() ? "" : currency);

      session.setAttribute("orderStatus", orderstatus);
      session.setAttribute("trackingid", trackingid);

      paymentdao.addCcavenueResponse(orderDetail);

      return "Success";

  }
  
  
}
