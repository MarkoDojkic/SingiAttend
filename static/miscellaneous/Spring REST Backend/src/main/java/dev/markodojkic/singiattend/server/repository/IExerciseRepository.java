package dev.markodojkic.singiattend.server.repository;

import dev.markodojkic.singiattend.server.entity.Exercise;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IExerciseRepository extends JpaRepository<Exercise, Integer> {
    
}
