package dev.markodojkic.singiattend.server.entity;

import lombok.Data;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Date;

@Data
@Document(collection = "Subjects")
public class Subject {
    @Id
    private int id;
    @Field("title")
    private String title;
    @Field("title_english")
    private String title_english;
    @Field("professor_id")
    private String professorId;
    @Field("assistant_id")
    private String assistantId;
    @Field("last_lecture_at")
    private String lastLectureAt;
    @Field("last_exercise_at")
    private String lastExerciseAt;
    @Field("is_inactive")
    private boolean isInactive;
}