package dev.markodojkic.singiattend.server.service;

import dev.markodojkic.singiattend.server.entity.Staff;
import dev.markodojkic.singiattend.server.entity.Student;

import java.util.List;
import java.util.NoSuchElementException;

public interface IServerService {
    Staff addNewStaffMember(Staff newStaff);
    Staff updateStaffMemberById(int id, Staff newStaffData);
    boolean checkPassword(int id, String plainPassword);
    Student addNewStudent(Student newStudent);
    Student updateStudentById(int id, Student newStudentData);
    boolean checkPasswordStudent(int id, String plainPassword);
    String getNameSurnameStudent(String index);
    String getCourseData(String index);
    String recordAttendance(int subjectId, String index, boolean isExercise);
    boolean checkPasswordAdmin(String plainPassword);
}
