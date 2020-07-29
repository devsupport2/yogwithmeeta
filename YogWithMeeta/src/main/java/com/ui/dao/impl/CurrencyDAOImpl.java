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

import com.ui.dao.CurrencyDAO;
import com.ui.model.Currency;

public class CurrencyDAOImpl implements CurrencyDAO {
  
  private DataSource dataSource;
  
  public void setDataSource(DataSource dataSource)
  {
      this.dataSource = dataSource;
  }
  private static final Logger logger = LoggerFactory.getLogger(CurrencyDAOImpl.class);
  
  public List<Currency> getAllCurrency()
  {
      logger.info("Inside Get All Currency Impl");
      List<Currency> sta = new ArrayList<Currency>();
      String s = "y";
      String sql = "select currency_id, currency_name, currency_code, currency_symbol, description, status, created_by, ip_address  from currency where status=? order by currency_name";
      
      Connection conn = null;
      try
      {
        conn = dataSource.getConnection();
          PreparedStatement ps = conn.prepareStatement(sql);
          
          ps.setString(1, s);

          Currency currency = null;
          
          ResultSet rs = ps.executeQuery();
          
          while (rs.next())
          {
              currency = new Currency();
              
              currency.setCurrencyId(rs.getInt("currency_id"));
              currency.setCurrencyName(rs.getString("currency_name"));
              currency.setCurrencyCode(rs.getString("currency_code"));
              currency.setCurrencySymbol(rs.getString("currency_symbol"));
              currency.setDescription(rs.getString("description"));
              currency.setStatus(rs.getString("status"));
              currency.setCreatedBy(rs.getInt("created_by"));
              currency.setIpAddress(rs.getString("ip_address"));
              
              sta.add(currency);
         }
         rs.close();
         ps.close();
        
         return sta;
      }
      catch (SQLException e)
      {
          throw new RuntimeException(e);
      }
      finally
      {
          if (conn != null)
          {
              try
              {
                  conn.close();
              }
              catch (SQLException e) {}
          }
      }
      
  }

}
