package dev.markodojkic.singiattend.server.entity;

import javax.persistence.*;

@Entity
@Table(name = "staff")
public class Staff {
    @Id
    @Column(name = "staff_id")
    private int id;
    @Column(name = "name_surname")
    private String name_surname;
    @Column(name = "email")
    private String email;
    @Column(name = "password_hash")
    private String password_hash;
    @Column(name = "role")
    private String role; //Enum: 'assistant','professor'

    public Staff() { }

    public Staff(int id, String name_surname, String email, String password_hash, String role) {
        this.id = id;
        this.name_surname = name_surname;
        this.email = email;
        this.password_hash = password_hash;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName_surname() {
        return name_surname;
    }

    public void setName_surname(String name_surname) {
        this.name_surname = name_surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword_hash() {
        return password_hash;
    }

    public void setPassword_hash(String password_hash) {
        this.password_hash = password_hash;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
