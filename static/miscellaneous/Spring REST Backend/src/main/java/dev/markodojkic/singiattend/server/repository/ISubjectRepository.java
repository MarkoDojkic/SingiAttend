package dev.markodojkic.singiattend.server.repository;

import dev.markodojkic.singiattend.server.entity.Subject;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ISubjectRepository extends JpaRepository<Subject, Integer> {
    
}
