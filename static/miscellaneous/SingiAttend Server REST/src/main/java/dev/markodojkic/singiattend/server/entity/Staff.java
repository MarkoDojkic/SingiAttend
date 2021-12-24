package dev.markodojkic.singiattend.server.entity;

import lombok.Data;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import javax.persistence.*;

@Data
@Document(collection = "Staff")
public class Staff {
    @Id
    private String id;
    @Field("name_surname")
    private String name_surname;
    @Field("email")
    private String email;
    @Field("password_hash")
    private String password_hash;
    @Field("role")
    private String role; //Enum: 'assistant','professor'
}