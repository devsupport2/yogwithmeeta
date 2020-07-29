package com.ui.dao;

import java.util.List;

import com.ui.model.Batch;
import com.ui.model.Order;

public interface PaymentDAO {

  Order getLastOrderDetail();

  String addOrder(Order order);

  List<Order> getAllPaymentDetailByUser(int userid);

  String addCcavenueResponse(Order orderDetail);

  Order getOrderDetailByOrderNumber(String ordernumber);

  List<Order> getTransactionsByPage(int pagesize, int startindex);

  List<Order> getAllTransactionsByDateAndPage(String fromdate, String todate, int pagesize, int startindex);

  List<Order> getTransactionsByPageForUser(int user_id, int pagesize, int startindex);

  List<Order> getParticipantsByPage(int pagesize, int startindex);

  List<Order> getAllParticipantsByDateAndPage(String fromdate, String todate, int pagesize, int startindex);

}
