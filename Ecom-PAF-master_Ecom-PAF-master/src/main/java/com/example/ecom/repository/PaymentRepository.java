package com.example.ecom.repository;

import com.example.ecom.model.Payment;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface PaymentRepository extends JpaRepository<Payment, Long>{

    Optional<Payment> findById(Long pollId);


    List<Payment> findByIdIn(List<Long> pollIds);

    List<Payment> findByIdIn(List<Long> pollIds, Sort sort);

}
