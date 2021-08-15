package dev.markodojkic.singiattend.server.controller;

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
        return this.serverService.addNewStaffMember(newStaff);
    }

    @RequestMapping(value = "update/staff/{id}", method = RequestMethod.PATCH)
    @CrossOrigin(origins = {"https://localhost:62812"})
    Staff updateStaffMemberById(@PathVariable int id, @RequestBody Staff newStaffData){
        return this.serverService.updateStaffMemberById(id, newStaffData);
    }

    @RequestMapping(value = "checkPassword/staff/{id}", method = RequestMethod.GET)
    @CrossOrigin(origins = {"https://localhost:62812"})
    String checkPassword(@PathVariable int id, @RequestBody String plainPassword){
        return this.serverService.checkPassword(id, plainPassword) ? "VALID\n" : "INVALID\n";
    }

    @PostMapping("insert/student")
    @CrossOrigin(origins = {"https://localhost:62812"})
    Student addNewStudent(@RequestBody Student newStudent){
        return this.serverService.addNewStudent(newStudent);
    }

    @RequestMapping(value = "update/student/{id}", method = RequestMethod.PATCH)
    @CrossOrigin(origins = {"https://localhost:62812"})
    Student updateStudentById(@PathVariable int id, @RequestBody Student newStudentData){
        return this.serverService.updateStudentById(id, newStudentData);
    }

    @RequestMapping(value = "checkPassword/student/{id}", method = RequestMethod.GET)
    @CrossOrigin(origins = {"https://localhost:62812"})
    String checkPasswordStudent(@PathVariable int id, @RequestBody String plainPassword){
        return this.serverService.checkPasswordStudent(id, plainPassword) ? "VALID\n" : "INVALID\n";
    }

    @GetMapping(value = "getStudentName")
    @CrossOrigin(origins = {"https://localhost:62812"})
    String getNameSurnameStudent(@RequestBody String index){
        return this.serverService.getNameSurnameStudent(index);
    }

    @GetMapping(value = "getCourseData")
    @CrossOrigin(origins = {"https://localhost:62812"})
    String getCourseData(@RequestBody String index){
        return this.serverService.getCourseData(index);
    }

    @RequestMapping(value = "recordAttendance/{subjectId}/{isExercise}", method = RequestMethod.GET)
    @CrossOrigin(origins = {"https://localhost:62812"})
    void recordAttendance(@PathVariable int subjectId, @RequestBody String index, @PathVariable boolean isExercise){
        System.out.println(this.serverService.recordAttendance(subjectId, index, isExercise));
    }

    @PostMapping(value = "checkPassword/admin")
    @CrossOrigin(origins = {"https://localhost:62812"})
    String checkPassword(@RequestBody String plainPassword){
        return this.serverService.checkPasswordAdmin(plainPassword) ? "VALID\n" : "INVALID\n";
    }
}
