package dev.markodojkic.singiattend.server.repository;

import dev.markodojkic.singiattend.server.entity.Student;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

public interface IStudentRepository extends MongoRepository<Student, String> {
    @Query(value="{'index': {$regex : ?0, $options: 'i'}")
    Student getByIndex(String index);
}
