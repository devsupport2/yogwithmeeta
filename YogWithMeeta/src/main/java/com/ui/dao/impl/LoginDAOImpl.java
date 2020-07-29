package com.ui.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.ui.dao.LoginDAO;
import com.ui.model.User;

public class LoginDAOImpl implements LoginDAO {
	@Autowired
	JdbcTemplate jdbcTemplate;
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	private static final Logger logger = LoggerFactory.getLogger(LoginDAOImpl.class);

	@Override
	public User checkLogin(String email, String password) {
		logger.info("+++++ CHECK LOGIN +++++");
		
		User user = null;
		
		String sql = "select user_id, first_name, last_name, mobile_no, email, user_type_id from user where status=? and email=? and password=?";
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "y");
			ps.setString(2, email);
			ps.setString(3, password);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user = new User();
				
				user.setUserId(rs.getInt("user_id"));
				user.setFirstName(rs.getString("first_name"));
				user.setLastName(rs.getString("last_name"));				
				user.setMobileNo(rs.getString("mobile_no"));
				user.setEmail(rs.getString("email"));
				user.setUserTypeId(rs.getInt("user_type_id"));
			}
			rs.close();
			ps.close();
			return user;
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