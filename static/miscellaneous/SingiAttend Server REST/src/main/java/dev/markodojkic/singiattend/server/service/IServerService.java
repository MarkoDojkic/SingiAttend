package dev.markodojkic.singiattend.server.service;

import dev.markodojkic.singiattend.server.entity.*;

import java.util.List;

public interface IServerService {
    Staff addNewStaffMember(Staff newStaff, boolean isUpdate);
    Staff updateStaffMemberById(String id, Staff newStaffData);
    boolean checkPassword(String id, String plainPassword);
    Student addNewStudent(Student newStudent, boolean isUpdate);
    Student updateStudentById(String id, Student newStudentData);
    String checkPasswordStudent(String index, String plainPassword);
    String getNameSurnameStudent(String index);
    List<CourseDataInstance> getCourseData(String index);
    String recordAttendance(String subjectId, String index, boolean isExercise);
    boolean checkPasswordAdmin(String plainPassword);
    List<AttendanceDataInstance> getAttendanceData(String index);
}
