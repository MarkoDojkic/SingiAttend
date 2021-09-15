package dev.markodojkic.singiattend.server.repository;

import dev.markodojkic.singiattend.server.entity.Faculty;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IFacultyRepository extends JpaRepository<Faculty, Integer> {
    
}
