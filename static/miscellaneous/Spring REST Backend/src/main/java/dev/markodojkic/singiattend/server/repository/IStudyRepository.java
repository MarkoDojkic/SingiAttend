package dev.markodojkic.singiattend.server.repository;

import dev.markodojkic.singiattend.server.entity.Study;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

public interface IStudyRepository extends JpaRepository<Study, Integer> {
    @Query(value="SELECT  subject_id,  staff.name_surname AS nameSurname,  CONCAT( `subject`.title, '-предавања' ) AS `subject`,  CONCAT( `subject`.title_english, '-lecture' ) AS subject_english,  TIME( last_lecture_at ) AS begin_time,  TIME(  ADDTIME( last_lecture_at, '00:45:00' )) AS end_time   FROM  `subject` INNER JOIN staff ON `subject`.professor_id = staff.staff_id  WHERE  subject_id IN (  SELECT   subject_id   FROM   subject_study   WHERE   study_id IN ( SELECT study_id FROM student WHERE `index` = ?1 )    AND `year` =(   SELECT    `year`    FROM    student    WHERE    `index` = ?1   ))   AND TIMEDIFF ( NOW(), last_lecture_at ) BETWEEN TIME ( '00:00:00' )   AND TIME ( '00:45:00' ) UNION SELECT  subject_id,  staff.name_surname AS nameSurname,  CONCAT( `subject`.title, '-вежбе' ) AS `subject`,  CONCAT( `subject`.title_english, '-practice' ) AS subject_english,  TIME( last_exercise_at ) AS begin_time,  TIME(  ADDTIME( last_exercise_at, '00:45:00' )) AS end_time FROM  `subject` INNER JOIN staff ON `subject`.assistant_id = staff.staff_id  WHERE subject_id IN (  SELECT   subject_id   FROM   subject_study   WHERE   study_id IN ( SELECT study_id FROM student WHERE `index` = ?1 )    AND `year` = (   SELECT    `year`    FROM    student    WHERE    `index` = ?1   ))   AND TIMEDIFF ( NOW(), last_exercise_at ) BETWEEN TIME ( '00:00:00' )   AND TIME ( '00:45:00' );", nativeQuery = true)
    String getCourseData(String index);
}
