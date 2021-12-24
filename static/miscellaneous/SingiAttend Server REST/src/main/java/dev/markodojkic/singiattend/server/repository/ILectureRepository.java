package dev.markodojkic.singiattend.server.repository;

import dev.markodojkic.singiattend.server.entity.Lecture;
import org.springframework.data.mongodb.repository.Aggregation;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import java.util.List;

public interface ILectureRepository extends MongoRepository<Lecture, String> {
    @Aggregation("{ $addFields: { ended_at: { $toDate: '$ended_at' } } }, { $sort: { ended_at: -1 } }, { $match: { subject_id: ObjectId(?0) } }, { $limit: 1 }")
    Lecture getLast(String subjectId);
    /*@Query(value="{'subject_id': {$regex : ?0, $options: 'i'}}")
    List<Lecture> getAllBySubject(String subjectId);*/
    @Query("{$and: [ {'subject_id': {$regex : ?0, $options: 'i'}}, {'attended_students': {$regex : ?1, $options: 'i'}}]}")
    List<Lecture> getAllAttended(String subjectId, String studentId);
    @Query("{ $match: { subject_id: ObjectId(?0) } }")
    List<Lecture> getAllBySubject(String subjectId);
}
