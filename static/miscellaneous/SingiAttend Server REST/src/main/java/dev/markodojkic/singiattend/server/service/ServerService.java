package dev.markodojkic.singiattend.server.service;

import dev.markodojkic.singiattend.server.entity.*;
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
    public Staff addNewStaffMember(Staff newStaff, boolean isUpdate) {
        if(!isUpdate) newStaff.setPassword_hash(this.encryptPassword(newStaff.getPassword_hash()));
        return this.staffRepository.saveAndFlush(newStaff);
    }

    @Override
    public Staff updateStaffMemberById(int id, Staff newStaffData) {
        Staff staff = staffRepository.findById(id).isPresent() ? staffRepository.findById(id).get() : null;
        if(staff == null) return null;
        if(newStaffData.getEmail() != null && !newStaffData.getEmail().isBlank()) staff.setEmail(newStaffData.getEmail());
        if(newStaffData.getName_surname() != null && !newStaffData.getName_surname().isBlank()) staff.setName_surname(newStaffData.getName_surname());
        if(newStaffData.getRole() != null && !newStaffData.getRole().isBlank()) staff.setRole(newStaffData.getRole());
        if(newStaffData.getPassword_hash() != null && !newStaffData.getPassword_hash().isBlank()) staff.setPassword_hash(this.encryptPassword(newStaffData.getPassword_hash()));
        return this.addNewStaffMember(staff, true);
    }

    @Override
    public boolean checkPassword(int id, String plainPassword) {
        return this.encryptPassword(plainPassword).equals(this.staffRepository.findById(id).get().getPassword_hash());
    }

    @Override
    public Student addNewStudent(Student newStudent, boolean isUpdate) {
        if(!isUpdate) newStudent.setPassword_hash(this.encryptPassword(newStudent.getPassword_hash()));
        return this.studentRepository.saveAndFlush(newStudent);
    }

    @Override
    public Student updateStudentById(int id, Student newStudentData) {
        Student student = studentRepository.findById(id).isPresent() ? studentRepository.findById(id).get() : null;
        if(student == null) return null;
        if(newStudentData.getYear() != null && newStudentData.getYear().isEmpty()) student.setYear(newStudentData.getYear());
        if(newStudentData.getEmail() != null && !newStudentData.getEmail().isEmpty()) student.setEmail(newStudentData.getEmail());
        if(newStudentData.getName_surname() != null && !newStudentData.getName_surname().isEmpty()) student.setName_surname(newStudentData.getName_surname());
        if(newStudentData.getIndex() != null && !newStudentData.getIndex().isEmpty()) student.setIndex(newStudentData.getIndex());
        if(newStudentData.getPassword_hash() != null && !newStudentData.getPassword_hash().isEmpty()) student.setPassword_hash(this.encryptPassword(newStudentData.getPassword_hash()));
        if(newStudentData.getStudyId() != 0) student.setStudyId(newStudentData.getStudyId());
        return this.addNewStudent(student, true);
    }

    @Override
    public String checkPasswordStudent(String index, String plainPassword) {
        final String index_ = index.substring(0, index.length() - 6) + "/" + index.substring(index.length() - 6);
        Optional<Student> optionalStudent = this.studentRepository.findAll().stream().filter(s -> s.getIndex().equals(index_)).findAny();
        if(!optionalStudent.isPresent()) return "UNKNOWN";
        int id = optionalStudent.get().getId();
        return this.encryptPassword(plainPassword).equals(this.studentRepository.findById(id).get().getPassword_hash()) ? "VALID" : "INVALID";
    }

    @Override
    public String getNameSurnameStudent(String index) {
        final String index_ = index.substring(0, index.length() - 6) + "/" + index.substring(index.length() - 6);
        return studentRepository.getNameSurname(index_) == null || studentRepository.getNameSurname(index_).isEmpty() ? "-???-" : studentRepository.getNameSurname(index_);
    }

    @Override
    public List<CourseDataInstance> getCourseData(String index) {
        final String index_ = index.substring(0, index.length() - 6) + "/" + index.substring(index.length() - 6);
        return this.studyRepository.getCourseData(index_);
    }

    @Override
    public String recordAttendance(int subjectId, String index, boolean isExercise) {
        final String index_ = index.substring(0, index.length() - 6) + "/" + index.substring(index.length() - 6);
        String baseDir = "/Volumes/Podaci/Web/XAMPP/SingiAttend/static/miscellaneous/" + (isExercise ? "exercise" : "lecture") + "Logs";
        DirectoryScanner directoryScanner = new DirectoryScanner();
        directoryScanner.setBasedir(baseDir);
        directoryScanner.setIncludes(new String[]{subjectId + "_*.log"});
        directoryScanner.setCaseSensitive(false);
        directoryScanner.scan();
        String[] logFiles = directoryScanner.getIncludedFiles();
        String data = this.getNameSurnameStudent(index).replace(" ", "_") + " " + index_ + " ";

        for (String logFileString:logFiles) {
            try {
                File logFile = new File(baseDir + "/" + logFileString);
                Scanner scanner = new Scanner(logFile); 
                Boolean isWrongFile = false;
                while (scanner.hasNextLine()){
                    String nextLine = scanner.nextLine();
                    if(nextLine.contains(data)) return "0*" + nextLine.split(data)[1]; //Already recorded attendance, send record time
                    else if(nextLine.equals("----------------------------------------")) isWrongFile = true;
                }
                if(!isWrongFile){
                    String recordTime = "";
                    recordTime += LocalDateTime.now().getHour() < 10 ? "0" + LocalDateTime.now().getHour() + ":" : LocalDateTime.now().getHour() + ":";
                    recordTime += LocalDateTime.now().getMinute() < 10 ? "0" + LocalDateTime.now().getMinute() : LocalDateTime.now().getMinute();
                    FileWriter fileWriter = new FileWriter(logFile, true);
                    fileWriter.append(data + recordTime + "\n");
                    fileWriter.flush();
                    fileWriter.close();
                    return "1*"+recordTime; //Recorded attendance at
                }
            } catch (IOException e) { }
        }

        return ""; //Unknown error while recording attendance
    }

    @Override
    public boolean checkPasswordAdmin(String plainPassword) {
        return this.encryptPassword(plainPassword).equals("S5TZZQ2lw6FNeOJZKbh1TYkOYyuJX6fR2Z+Xrj1g5CQ=");
    }

    @Override
    public List<AttendanceDataInstance> getAttendanceData(String index) {
        List<AttendanceDataInstance> output = new ArrayList<>();
        final String index_ = index.substring(0, index.length() - 6) + "/" + index.substring(index.length() - 6);
        List<AttendanceSubobjectInstance> attendanceSubobjectInstances = this.subjectRepository.getSubobjectdata(index_);
        for (AttendanceSubobjectInstance attendanceSubobjectInstance:attendanceSubobjectInstances) {
            int al = this.getAttendedLectures(attendanceSubobjectInstance.getSubjectId(), index_);
            int ap = this.getAttendedPractices(attendanceSubobjectInstance.getSubjectId(), index_);
            int tl = this.getTotalLectures(attendanceSubobjectInstance.getSubjectId());
            int tp = this.getTotalPractices(attendanceSubobjectInstance.getSubjectId());
            output.add(new AttendanceDataInstance(attendanceSubobjectInstance, al, ap, tl, tp));
        }
        return output;
    }

    private int getTotalPractices(int subjectId) {
        String baseDir = "/Volumes/Podaci/Web/XAMPP/SingiAttend/static/miscellaneous/exerciseLogs";
        DirectoryScanner directoryScanner = new DirectoryScanner();
        directoryScanner.setBasedir(baseDir);
        directoryScanner.setIncludes(new String[]{subjectId + "_*.log"});
        directoryScanner.setCaseSensitive(false);
        directoryScanner.scan();
        return directoryScanner.getIncludedFilesCount();
    }

    private int getTotalLectures(int subjectId) {
        String baseDir = "/Volumes/Podaci/Web/XAMPP/SingiAttend/static/miscellaneous/lectureLogs";
        DirectoryScanner directoryScanner = new DirectoryScanner();
        directoryScanner.setBasedir(baseDir);
        directoryScanner.setIncludes(new String[]{subjectId + "_*.log"});
        directoryScanner.setCaseSensitive(false);
        directoryScanner.scan();
        return directoryScanner.getIncludedFilesCount();
    }

    private int getAttendedPractices(int subjectId, String index) {
        String baseDir = "/Volumes/Podaci/Web/XAMPP/SingiAttend/static/miscellaneous/exerciseLogs";
        DirectoryScanner directoryScanner = new DirectoryScanner();
        directoryScanner.setBasedir(baseDir);
        directoryScanner.setIncludes(new String[]{subjectId + "_*.log"});
        directoryScanner.setCaseSensitive(false);
        directoryScanner.scan();
        return countAttendancesFromFolder(index, baseDir, directoryScanner);
    }

    private int getAttendedLectures(int subjectId, String index) {
        String baseDir = "/Volumes/Podaci/Web/XAMPP/SingiAttend/static/miscellaneous/lectureLogs";
        DirectoryScanner directoryScanner = new DirectoryScanner();
        directoryScanner.setBasedir(baseDir);
        directoryScanner.setIncludes(new String[]{subjectId + "_*.log"});
        directoryScanner.setCaseSensitive(false);
        directoryScanner.scan();
        return countAttendancesFromFolder(index, baseDir, directoryScanner);
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

    private int countAttendancesFromFolder(String index, String baseDir, DirectoryScanner directoryScanner) {
        String[] logFiles = directoryScanner.getIncludedFiles();
        int output = 0;

        for (String logFileString:logFiles) {
            try {
                File logFile = new File(baseDir + "/" + logFileString);
                Scanner scanner = new Scanner(logFile);
                while (scanner.hasNextLine()){
                    String nextLine = scanner.nextLine();
                    if(nextLine.contains(index)) output++;
                }
            } catch (IOException e) { }
        }

        return output;
    }
}
