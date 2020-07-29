package com.ui.dao;

import java.util.List;

import com.ui.model.Cource;

public interface CourseDAO {

  String addCourse(Cource course);

  List<Cource> getCourseByPage(int pagesize, int startindex);

  Cource getCourseDetailById(int id);

  String editCourse(Cource course);

  List<Cource> getThreeCourseFront();

  void deleteCourse(int courseid);

  List<Cource> getAllCourseFront();

  List<Cource> getAllCourseName();

}
