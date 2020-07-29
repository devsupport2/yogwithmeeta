package com.ui.dao;

import java.util.List;

import com.ui.model.User;

public interface UserDAO {

  String editUser(User user);

  User getUserByEmail(String email);

  String addUser(User user);

  int isEmailUnique(String email);

  User getUserDetailById(int userid);

  int getLastUserId();

  User getMemberDetailByMemberId(int id);

  void setforgotpassflag(String string, String email);

  Object getforgotpassflag(String email);

  String UpdatePass(User user);

  List<User> getUserByPage(int pagesize, int startindex);

  List<User> searchUser(String keyword);

  void deleteUser(int userid);

}
