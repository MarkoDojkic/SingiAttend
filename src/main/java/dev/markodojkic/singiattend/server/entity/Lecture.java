package dev.markodojkic.singiattend.server.entity;

import lombok.Data;
import org.hibernate.annotations.Type;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import javax.persistence.Id;
import java.time.LocalDateTime;
import java.util.ArrayList;

@Data
@Document(collection = "Lectures")
public class Lecture {
    @Id
    private String id;
    @Field("subject_id")
    private String subject_id;
    @Field("started_at")
    private String started_at;
    @Field("ended_at")
    private String ended_at;
    @Type(type = "string-array")
    @Field("attended_students")
    private ArrayList<String> attended_students;

    public Lecture(String subject_id, String started_at, String ended_at, ArrayList<String> attended_students) {
        this.subject_id = subject_id;
        this.started_at = started_at;
        this.ended_at = ended_at;
        this.attended_students = attended_students;
    }
}