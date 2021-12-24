package dev.markodojkic.singiattend.server.repository;

import dev.markodojkic.singiattend.server.entity.CourseDataInstance;
import dev.markodojkic.singiattend.server.entity.Study;
import org.springframework.data.mongodb.repository.Aggregation;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IStudyRepository extends MongoRepository<Study, String> {

}
