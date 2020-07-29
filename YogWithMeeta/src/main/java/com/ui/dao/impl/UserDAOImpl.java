package com.ui.dao.impl;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ui.dao.UserDAO;
import com.ui.model.Order;
import com.ui.model.User;

public class UserDAOImpl implements UserDAO {

  private DataSource dataSource;

  public void setDataSource(DataSource dataSource) {
      this.dataSource = dataSource;
  }

  private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);
  @Override
  public String editUser(User u) {
    logger.info("+++++ EDIT USER +++++");
    String sql = "update user set user_type_id=?, first_name=?, last_name=?, user_image=?, email=?, mobile_no=?, gender=?, date_of_birth=STR_TO_DATE(?,'%d/%m/%Y'), address=?, country_id=?, state_id=?, city=?, pincode=?, status=?, created_by=?, ip_address=? where user_id=?";
    Connection conn = null;
    try {
      
      
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, u.getUserTypeId());
        ps.setString(2, u.getFirstName());
        ps.setString(3, u.getLastName());
        ps.setString(4, u.getUserImage());
        ps.setString(5, u.getEmail());
        ps.setString(6, u.getMobileNo());
        ps.setString(7, u.getGender());
        ps.setString(8, u.getDateOfBirth());
        ps.setString(9, u.getAddress());
        ps.setInt(10, u.getCountryId());
        ps.setInt(11, u.getStateId());
        ps.setString(12, u.getCity());
        ps.setString(13, u.getPincode());
        ps.setString(14, u.getStatus());
        ps.setInt(15, u.getCreatedBy());
        ps.setString(16, u.getIpAddress());
        ps.setInt(17, u.getUserId());
        ps.executeUpdate();
        return "Success";
    } catch (SQLException e) {
        return e.getMessage();
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
  public User getUserByEmail(String email) {
    logger.info("+++++ GET USER BY EMAIL +++++");
    User u = null;
    String sql = "select user_id, user_type_id, first_name, last_name, user_image, email, password, mobile_no, gender, DATE_FORMAT(date_of_birth,'%d/%m/%Y') as date_of_birth, login_by, status from user where email=?";

    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            u = new User();

            u.setUserId(rs.getInt("user_id"));
            u.setUserTypeId(rs.getInt("user_type_id"));
            u.setFirstName(rs.getString("first_name"));
            u.setLastName(rs.getString("last_name"));
            u.setUserImage(rs.getString("user_image"));
            u.setEmail(rs.getString("email"));
            u.setPassword(rs.getString("password"));
            u.setMobileNo(rs.getString("mobile_no"));
            u.setGender(rs.getString("gender"));
            u.setDateOfBirth(rs.getString("date_of_birth"));
            u.setLoginBy(rs.getString("login_by"));
            u.setStatus(rs.getString("status"));
        }
        rs.close();
        ps.close();

        return u;
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
  public String addUser(User u) {
    logger.info("+++++ ADD USER +++++");
    String sql = "insert into user (user_type_id, business_type_id, company_name, first_name, last_name, user_image, email, password, mobile_no, gender, date_of_birth, login_by, address, country_id, state_id, city, pincode, status, created_by, ip_address, any_health_problems, requirement_from_workshop) values (?,?,?,?,?,?,?,?,?,?,STR_TO_DATE(?,'%Y-%m-%d'),?,?,?,?,?,?,?,?,?,?,?)";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, u.getUserTypeId());
        ps.setInt(2, u.getBusinessTypeId());
        ps.setString(3, u.getCompanyName());
        ps.setString(4, u.getFirstName());
        ps.setString(5, u.getLastName());
        ps.setString(6, u.getUserImage());
        ps.setString(7, u.getEmail());
        ps.setString(8, u.getPassword());
        ps.setString(9, u.getMobileNo());
        ps.setString(10, u.getGender());
        ps.setString(11, u.getDateOfBirth());
        ps.setString(12, u.getLoginBy());
        ps.setString(13, u.getAddress());
        ps.setInt(14, u.getCountryId());
        ps.setInt(15, u.getStateId());
        ps.setString(16, u.getCity());
        ps.setString(17, u.getPincode());
        ps.setString(18, u.getStatus());
        ps.setInt(19, u.getCreatedBy());
        ps.setString(20, u.getIpAddress());
        ps.setString(21, u.getHealthProblem());
        ps.setString(22, u.getSpecificRequirement());
        
        ps.executeUpdate();
        return "Success";
    } catch (SQLException e) {
        return "Data not saved!"+e;
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
  public int isEmailUnique(String email) {

    logger.info("+++++ IS EMAIL UNIQUE +++++");
    String sql = "select user_id from user where status=? and email=?";
    int id = 0;
    String s = "y";
    Connection conn = null;

    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, s);
        ps.setString(2, email);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            id = rs.getInt("user_id");
        }
        rs.close();
        ps.close();
        return id;
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
  public User getUserDetailById(int userid) {
    logger.info("+++++ GET USER BY userid +++++");
    User u = null;
    String sql = "select u.user_id, u.user_type_id, u.first_name, u.last_name, u.user_image, u.email, u.password, u.mobile_no, u.gender, DATE_FORMAT(u.date_of_birth,'%d/%m/%Y') as date_of_birth, u.login_by, u.country_id, u.state_id, u.status, u.address, u.city, u.pincode, c.country_name, s.state_name from user u left join country c on c.country_id = u.country_id left join state s on s.state_id = u.state_id where u.user_id=?";

    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, userid);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            u = new User();

            u.setUserId(rs.getInt("user_id"));
            u.setUserTypeId(rs.getInt("user_type_id"));
            u.setFirstName(rs.getString("first_name"));
            u.setLastName(rs.getString("last_name"));
            u.setUserImage(rs.getString("user_image"));
            u.setEmail(rs.getString("email"));
            u.setPassword(rs.getString("password"));
            u.setMobileNo(rs.getString("mobile_no"));
            u.setGender(rs.getString("gender"));
            u.setDateOfBirth(rs.getString("date_of_birth"));
            u.setLoginBy(rs.getString("login_by"));
            u.setStatus(rs.getString("status"));
            u.setCountryName(rs.getString("country_name"));
            u.setCountryId(rs.getInt("country_id"));
            u.setStateId(rs.getInt("state_id"));
            u.setStateName(rs.getString("state_name"));
            u.setAddress(rs.getString("address"));
            u.setCity(rs.getString("city"));
            u.setPincode(rs.getString("pincode"));
        }
        rs.close();
        ps.close();

        return u;
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
  public int getLastUserId() {
    logger.info("+++++ GET LAST USER ID +++++");
    int user_id = 0;
    String sql = "select user_id from user order by user_id desc limit 0,1";

    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {

            user_id = rs.getInt("user_id");
        }
        rs.close();
        ps.close();
        return user_id;
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
  public User getMemberDetailByMemberId(int id) {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public void setforgotpassflag(String flag, String email) {
    logger.info("+++++ Update forgot pass flag+++++");
    String sql = "update user set reset_pass_flag=? where email=?";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, flag);
        ps.setString(2, email);
        ps.executeUpdate();
    } catch (SQLException e) {
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
  public String getforgotpassflag(String email) {
      String result = null;
      logger.info("+++++ get forgot pass flag+++++");
      String sql = "select reset_pass_flag from user where email=?";
      Connection conn = null;
      try {
          conn = dataSource.getConnection();
          PreparedStatement ps = conn.prepareStatement(sql);
          ps.setString(1, email);
          ResultSet rs = ps.executeQuery();
          while (rs.next()) {
              result=rs.getString("reset_pass_flag");
              logger.info("+++++ get forgot pass flag"+result);
          }
          rs.close();
          ps.close();
          return result;
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
  public String UpdatePass(User u) {
    logger.info("+++++ Update Pass+++++");
    String sql = "update user set password=? where email=?";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, u.getPassword());
        ps.setString(2, u.getEmail());
        ps.executeUpdate();
        return "Success";
    } catch (SQLException e) {
        return e.getMessage();
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
  public List<User> getUserByPage(int pagesize, int startindex) {
    logger.info("+++++ GET USER BY PAGE +++++");
    List<User> sta = new ArrayList<User>();
    String s = "y";
    String sql = "select u.user_id, u.company_name, u.first_name, u.last_name, u.user_image, u.email, u.mobile_no, u.address, ut.user_type_name from user u left join user_type ut on u.user_type_id = ut.user_type_id where u.status=? and ut.user_type_id != 1 order by u.company_name limit ?,?";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, s);
        ps.setInt(2, startindex);
        ps.setInt(3, pagesize);
        User user = null;
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            user = new User();
            user.setUserId(rs.getInt("user_id"));
            user.setCompanyName(rs.getString("company_name"));
            user.setFirstName(rs.getString("first_name"));
            user.setLastName(rs.getString("last_name"));
            user.setUserImage(rs.getString("user_image"));
            user.setEmail(rs.getString("email"));
            user.setMobileNo(rs.getString("mobile_no"));
            user.setAddress(rs.getString("address"));
            user.setUserTypeName(rs.getString("user_type_name"));
            sta.add(user);
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
  public List<User> searchUser(String keyword) {
    logger.info("+++++ SERACH USER +++++");
    List<User> sta = new ArrayList<User>();
    String s = "y";
    String sql = "select u.user_id, u.company_name, u.first_name, u.last_name, u.user_image, u.email, u.mobile_no, ut.user_type_name from user u left join user_type ut on u.user_type_id = ut.user_type_id where u.status=? and concat(u.company_name, '', u.first_name, '', u.last_name, '', u.email, '', u.mobile_no, '', ut.user_type_name) like ? order by u.company_name";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, s);
        ps.setString(2, '%' + keyword + '%');
        User user = null;
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            user = new User();
            user.setUserId(rs.getInt("user_id"));
            user.setCompanyName(rs.getString("company_name"));
            user.setFirstName(rs.getString("first_name"));
            user.setLastName(rs.getString("last_name"));
            user.setUserImage(rs.getString("user_image"));
            user.setEmail(rs.getString("email"));
            user.setMobileNo(rs.getString("mobile_no"));
            user.setUserTypeName(rs.getString("user_type_name"));
            sta.add(user);
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
  public void deleteUser(int userid) {
    logger.info("+++++ DELETE USER +++++");
    String status = "n";
    String sql = "update user set status=? where user_id=?";
    Connection conn = null;
    try {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, status);
        ps.setInt(2, userid);
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
