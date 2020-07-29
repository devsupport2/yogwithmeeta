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
import com.ui.dao.CountryDAO;
import com.ui.model.Country;
import com.ui.model.State;

public class CountryDAOImpl implements CountryDAO {
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	private static final Logger logger = LoggerFactory.getLogger(CountryDAOImpl.class);

	public List<Country> getAllCountry() {
		logger.info("Inside Get All Country Impl");
		List<Country> Country = new ArrayList<Country>();
		String s = "y";
		String sql = "select country_id, country_name, country_code from country where status=?";
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, s);

			Country country = null;

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				country = new Country(rs.getInt("country_id"), rs.getString("country_name"),
						rs.getString("country_code"));
				Country.add(country);
			}
			rs.close();
			ps.close();

			return Country;
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
	public List<State> getRelatedState(long countryId) {
		logger.info("Inside Get Related State Impl");

		List<State> State = new ArrayList<State>();

		String s = "y";

		String sql = "select state_id, state_name, country_id from state where status=? and country_id=?";

		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, s);
			ps.setLong(2, countryId);

			State state = null;

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				state = new State(rs.getInt("state_id"), rs.getString("state_name"), rs.getInt("country_id"));

				State.add(state);
			}
			rs.close();
			ps.close();

			return State;
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
