package dev.markodojkic.singiattend.server.service;

import dev.markodojkic.singiattend.server.entity.Staff;
import dev.markodojkic.singiattend.server.entity.Student;
import dev.markodojkic.singiattend.server.repository.*;
import org.apache.tools.ant.DirectoryScanner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.Time;
import java.time.LocalDateTime;
import java.util.*;

@Service
public class ServerService implements IServerService {
    @Autowired
    private IExerciseRepository exerciseRepository;
    @Autowired
    private IFacultyRepository facultyRepository;
    @Autowired
    private ILectureRepository lectureRepository;
    @Autowired
    private IStaffRepository staffRepository;
    @Autowired
    private IStudentRepository studentRepository;
    @Autowired
    private IStudyRepository studyRepository;
    @Autowired
    private ISubjectRepository subjectRepository;

    @Override
    public Staff addNewStaffMember(Staff newStaff) {
        newStaff.setPassword_hash(this.encryptPassword(newStaff.getPassword_hash()));
        return this.staffRepository.saveAndFlush(newStaff);
    }

    @Override
    public Staff updateStaffMemberById(int id, Staff newStaffData) {
        Staff staff = staffRepository.findById(id).isPresent() ? staffRepository.findById(id).get() : null;
        if(staff == null) return null;
        if(!newStaffData.getEmail().isBlank()) staff.setEmail(newStaffData.getEmail());
        if(!newStaffData.getName_surname().isBlank()) staff.setName_surname(newStaffData.getName_surname());
        if(!newStaffData.getRole().isBlank()) staff.setRole(newStaffData.getRole());
        if(!newStaffData.getPassword_hash().isBlank()) staff.setPassword_hash(this.encryptPassword(newStaffData.getPassword_hash()));
        return this.addNewStaffMember(newStaffData);
    }

    @Override
    public boolean checkPassword(int id, String plainPassword) {
        return this.encryptPassword(plainPassword).equals(this.staffRepository.findById(id).get().getPassword_hash());
    }

    @Override
    public Student addNewStudent(Student newStudent) {
        return this.studentRepository.saveAndFlush(newStudent);
    }



    @Override
    public Student updateStudentById(int id, Student newStudentData) {
        Student student = studentRepository.findById(id).isPresent() ? studentRepository.findById(id).get() : null;
        if(student == null) return null;
        if(!newStudentData.getYear().isBlank()) student.setYear(newStudentData.getYear());
        if(!newStudentData.getEmail().isBlank()) student.setEmail(newStudentData.getEmail());
        if(!newStudentData.getName_surname().isBlank()) student.setName_surname(newStudentData.getName_surname());
        if(!newStudentData.getIndex().isBlank()) student.setIndex(newStudentData.getIndex());
        if(!newStudentData.getPassword_hash().isBlank()) student.setPassword_hash(this.encryptPassword(newStudentData.getPassword_hash()));
        if(newStudentData.getStudyId() != 0) student.setStudyId(newStudentData.getStudyId());
        return this.addNewStudent(newStudentData);
    }

    @Override
    public boolean checkPasswordStudent(int id, String plainPassword) {
        return this.encryptPassword(plainPassword).equals(this.studentRepository.findById(id).get().getPassword_hash());
    }

    @Override
    public String getNameSurnameStudent(String index) {
        return studentRepository.getNameSurname(index);
    }

    @Override
    public String getCourseData(String index) {
        return this.studyRepository.getCourseData(index);
        /*
                        $dbData = $conn->query($query);
                        $courses_json = array();

                        while($courses = $dbData->fetch_assoc()){
                            array_push($courses_json,array(
                                "nameSurnameT"=>$courses['nameSurnameT'],
                                "nameSurnameA"=>$courses['nameSurnameA'],
                                "predmet"=>$courses['predmet'],
                                "predmet_eng"=>$courses['predmet_eng'],
                                "attendedLectures"=>$courses['attendedLectures'],
                                "attendedPractices"=>$courses['attendedPractices'],
                                "totalLectures"=>$courses['totalLectures'],
                                "totalPractices"=>$courses['totalPractices'],
                                "isCourseEnded"=>$courses['isCourseEnded']
                            ));
                        }
                        $klijent->write(json_encode($courses_json) . "\n");
                        return;
         */
    }

    @Override
    public String recordAttendance(int subjectId, String index, boolean isExercise) {
        String baseDir = "/Volumes/Podaci/Web/XAMPP/SingiAttend/static/miscellaneous/" + (isExercise ? "exercise" : "lecture") + "Logs";
        DirectoryScanner directoryScanner = new DirectoryScanner();
        directoryScanner.setBasedir(baseDir);
        directoryScanner.setIncludes(new String[]{subjectId + "_*.log"});
        directoryScanner.setCaseSensitive(false);
        directoryScanner.scan();
        String[] logFiles = directoryScanner.getIncludedFiles();

        String data = this.getNameSurnameStudent(index) + " " + index + " " + LocalDateTime.now().getHour() + ":" + LocalDateTime.now().getMinute() + "\n";

        for (String logFileString:logFiles) {
            try {
                File logFile = new File(baseDir + logFileString);
                Scanner scanner = new Scanner(logFile); //Don't know if needed to include base_dir
                Boolean isWrongFile = false;
                while (scanner.hasNextLine()){
                    if(scanner.nextLine().equals("----------------------------------------")) isWrongFile = true;
                }
                if(!isWrongFile){
                    FileWriter fileWriter = new FileWriter(logFile);
                    fileWriter.append(data);
                }
            } catch (IOException e) { }
        }

        return "RECORDED ATTENDANCE \n"; //doesn't do anything (just information)
    }

    @Override
    public boolean checkPasswordAdmin(String plainPassword) {
        return this.encryptPassword(plainPassword).equals("S5TZZQ2lw6FNeOJZKbh1TYkOYyuJX6fR2Z+Xrj1g5CQ=");
    }

    private String encryptPassword(String plain) {
        try {
            byte[] decodedKey = Base64.getDecoder().decode("8p6pyFULk8j3DV/yHJaGzw==");
            SecretKey secretKey = new SecretKeySpec(decodedKey, 0, decodedKey.length, "AES");
            Cipher cipher = Cipher.getInstance("AES");
            cipher.init(1, secretKey);
            return Base64.getEncoder().encodeToString(cipher.doFinal(plain.getBytes(StandardCharsets.UTF_8)));
        } catch (NoSuchPaddingException | NoSuchAlgorithmException | InvalidKeyException | IllegalBlockSizeException | BadPaddingException e) {
            return "";
        }
    }
}
