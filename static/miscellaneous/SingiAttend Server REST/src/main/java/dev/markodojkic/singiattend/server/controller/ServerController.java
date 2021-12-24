package dev.markodojkic.singiattend.server.controller;

import dev.markodojkic.singiattend.server.entity.AttendanceDataInstance;
import dev.markodojkic.singiattend.server.entity.CourseDataInstance;
import dev.markodojkic.singiattend.server.entity.Staff;
import dev.markodojkic.singiattend.server.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import dev.markodojkic.singiattend.server.service.ServerService;

import java.util.List;

@RestController()
@RequestMapping("api")
public class ServerController {
    @Autowired
    private ServerService serverService;

    @PostMapping("insert/staff")
    @CrossOrigin(origins = {"https://localhost:62812"})
    public Staff addNewStaffMember(@RequestBody Staff newStaff){
        return this.serverService.addNewStaffMember(newStaff, false);
    }

    @RequestMapping(value = "update/staff/{id}", method = RequestMethod.PATCH)
    @CrossOrigin(origins = {"https://localhost:62812"})
    Staff updateStaffMemberById(@PathVariable String id, @RequestBody Staff newStaffData){
        return this.serverService.updateStaffMemberById(id, newStaffData);
    }

    @RequestMapping(value = "checkPassword/staff/{id}", method = RequestMethod.GET)
    @CrossOrigin(origins = {"https://localhost:62812"})
    String checkPassword(@PathVariable String id, @RequestBody String plainPassword){
        return this.serverService.checkPassword(id, plainPassword) ? "VALID\n" : "INVALID\n";
    }

    @PostMapping("insert/student")
    @CrossOrigin(origins = {"https://localhost:62812"})
    Student addNewStudent(@RequestBody Student newStudent){
        return this.serverService.addNewStudent(newStudent, false);
    }

    @RequestMapping(value = "update/student/{id}", method = RequestMethod.PATCH)
    @CrossOrigin(origins = {"https://localhost:62812"})
    Student updateStudentById(@PathVariable String id, @RequestBody Student newStudentData){
        return this.serverService.updateStudentById(id, newStudentData);
    }

    @RequestMapping(value = "checkPassword/student/{index}", method = RequestMethod.POST)
    @CrossOrigin(origins = {"https://localhost:62812"})
    String checkPasswordStudent(@PathVariable String index, @RequestBody String plainPassword){
        return this.serverService.checkPasswordStudent(index, plainPassword);
    }

    @RequestMapping(value = "getStudentName/{index}", method = RequestMethod.GET)
    @CrossOrigin(origins = {"https://localhost:62812"})
    String getNameSurnameStudent(@PathVariable String index){
        return this.serverService.getNameSurnameStudent(index);
    }

    @RequestMapping(value = "getCourseData/{index}", method = RequestMethod.GET)
    @CrossOrigin(origins = {"https://localhost:62812"})
    List<CourseDataInstance> getCourseData(@PathVariable String index){
        return this.serverService.getCourseData(index);
    }

    @RequestMapping(value = "recordAttendance/{index}/{subjectId}/{isExercise}", method = RequestMethod.GET)
    @CrossOrigin(origins = {"https://localhost:62812"})
    String recordAttendance(@PathVariable String subjectId, @PathVariable String index, @PathVariable boolean isExercise){
        return this.serverService.recordAttendance(subjectId, index, isExercise);
    }

    @PostMapping(value = "checkPassword/admin")
    @CrossOrigin(origins = {"https://localhost:62812"})
    String checkPassword(@RequestBody String plainPassword){
        return this.serverService.checkPasswordAdmin(plainPassword) ? "VALID\n" : "INVALID\n";
    }

    @RequestMapping(value = "getAttendanceData/{index}", method = RequestMethod.GET)
    @CrossOrigin(origins = {"https://localhost:62812"})
    List<AttendanceDataInstance> getAttendanceData(@PathVariable String index){
        return this.serverService.getAttendanceData(index);
    }
}
