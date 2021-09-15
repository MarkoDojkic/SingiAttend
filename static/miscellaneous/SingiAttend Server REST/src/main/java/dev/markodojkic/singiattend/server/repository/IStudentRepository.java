package dev.markodojkic.singiattend.server.repository;

import dev.markodojkic.singiattend.server.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface IStudentRepository extends JpaRepository<Student, Integer> {
    @Query(value="SELECT name_surname FROM student WHERE `index` = ?1", nativeQuery = true)
    String getNameSurname(String index);
}
