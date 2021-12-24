package dev.markodojkic.singiattend.server.entity;

import lombok.Data;
import org.hibernate.annotations.Type;
import org.springframework.data.annotation.TypeAlias;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import javax.persistence.*;
import java.sql.Time;
import java.time.LocalDateTime;
import java.util.ArrayList;

@Data
@Document(collection = "Exercises")
public class Exercise {
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