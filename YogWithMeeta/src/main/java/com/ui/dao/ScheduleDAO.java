package com.ui.dao;

import java.util.List;

import com.ui.model.Batch;
import com.ui.model.Schedule;

public interface ScheduleDAO {

  String addSchedule(Schedule schedule);

  List<Schedule> getScheduleByPage(int pagesize, int startindex);

  Schedule getScheduleDetailById(int scheduleid);

  String editSchedule(Schedule schedule);

  List<Schedule> getAllSchedulesName();

  void deleteSchedule(int scheduleid);

}
