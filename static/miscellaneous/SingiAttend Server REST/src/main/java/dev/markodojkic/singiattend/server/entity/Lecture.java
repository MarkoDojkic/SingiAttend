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
    private LocalDateTime started_at;
    @Field("ended_at")
    private LocalDateTime ended_at;
    @Type(type = "string-array")
    @Field("attended_students")
    private ArrayList<String> attended_students;
}