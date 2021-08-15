package dev.markodojkic.singiattend.server.repository;

import dev.markodojkic.singiattend.server.entity.Staff;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IStaffRepository extends JpaRepository<Staff, Integer> {
    
}
