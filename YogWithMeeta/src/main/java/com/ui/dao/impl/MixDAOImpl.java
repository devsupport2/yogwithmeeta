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

import com.ui.dao.MixDAO;
import com.ui.model.AllCount;

public class MixDAOImpl implements MixDAO {

  private DataSource dataSource;

  public void setDataSource(DataSource dataSource) {
      this.dataSource = dataSource;
  }

  private static final Logger logger = LoggerFactory.getLogger(MixDAOImpl.class);

  
  @Override
  public AllCount getAllCounts() {
    logger.info("+++++ GET ALL COUNTER +++++");
    AllCount allCount = null;
    Connection con = null;

    String sql = "select (select count(schedule_id) from schedule where status = 'y') as schedule_row_count, (select count(course_id) from course where status = 'y') as course_row_count, (select count(batch_id) from batch where status = 'y') as batch_row_count,(select count(order_id) from orders where status = 'y') as transaction_count";
    try {
        con = dataSource.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            allCount = new AllCount();
            allCount.setBatchCount(rs.getInt("batch_row_count"));
            allCount.setCourseCount(rs.getInt("course_row_count"));
            allCount.setScheduleCount(rs.getInt("schedule_row_count"));
            allCount.setTransactionCount(rs.getInt("transaction_count"));
        }
        rs.close();
        ps.close();

        return allCount;
    } catch (SQLException e1) {
        throw new RuntimeException(e1);
    } finally {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e1) {
            }
        }
    }
  }

}
