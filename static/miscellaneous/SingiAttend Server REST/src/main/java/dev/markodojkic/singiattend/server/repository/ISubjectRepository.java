package dev.markodojkic.singiattend.server.repository;

import dev.markodojkic.singiattend.server.entity.AttendanceSubobjectInstance;
import dev.markodojkic.singiattend.server.entity.Subject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ISubjectRepository extends JpaRepository<Subject, Integer> {
    @Query(value="SELECT  subject_id AS subjectId, teacher.name_surname AS nameT,  assistant.name_surname AS nameA,  `subject`.title,  `subject`.title_english AS titleEnglish,  `subject`.is_inactive AS isInactive FROM  `subject` LEFT JOIN staff teacher ON  `subject`.professor_id = teacher.staff_id LEFT JOIN staff assistant ON  `subject`.assistant_id = assistant.staff_id WHERE  `subject`.subject_id IN   (SELECT subject_id FROM subject_study   WHERE subject_study.study_id = (SELECT study_id FROM student WHERE `index` = ?1) AND subject_study.`year` = (SELECT `year` FROM student WHERE `index` = ?1))",nativeQuery = true)
    List<AttendanceSubobjectInstance> getSubobjectdata(String index);
}
