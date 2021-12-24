package dev.markodojkic.singiattend.server.repository;

import dev.markodojkic.singiattend.server.entity.AttendanceSubobjectInstance;
import dev.markodojkic.singiattend.server.entity.CourseDataInstance;
import dev.markodojkic.singiattend.server.entity.Subject;
import org.springframework.data.mongodb.repository.Aggregation;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

import static org.springframework.data.mongodb.core.aggregation.Aggregation.*;

import java.util.List;

@EnableMongoRepositories
public interface ISubjectRepository extends MongoRepository<Subject, String> {
    @Aggregation("{ $match : { 'enroled_students' : { $eq: ?0 } } } }, {$lookup: {from:'Staff',localField:'professor_id',foreignField:'_id',as:'professor'}},{$lookup: {from:'Staff',localField:'assistant_id',foreignField:'_id',as:'assistant'}}])})")
    List<CourseDataInstance> getCourseData(String index);
    @Aggregation("{ $lookup: {from:'Staff',localField:'professor_id',foreignField:'_id',as:'professor'}},{$lookup: {from:'Staff',localField:'assistant_id',foreignField:'_id',as:'assistant'}},{$match: {enroled_students: {$eq: ?0}} }")
    List<AttendanceSubobjectInstance> getSubobjectdata(String index);
}
