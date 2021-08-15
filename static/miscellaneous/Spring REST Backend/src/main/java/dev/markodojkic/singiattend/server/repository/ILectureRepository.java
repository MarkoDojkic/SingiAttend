package dev.markodojkic.singiattend.server.repository;

import dev.markodojkic.singiattend.server.entity.Lecture;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ILectureRepository extends JpaRepository<Lecture, Integer> {
    
}
