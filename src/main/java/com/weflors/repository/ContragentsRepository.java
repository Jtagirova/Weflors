package com.weflors.repository;

import com.weflors.entity.ContragentsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ContragentsRepository extends JpaRepository<ContragentsEntity, Integer> {

    @Query("select ca from ContragentsEntity ca where ca.contragentId = :contragentID")
    ContragentsEntity findByContragentID(@Param("contragentID") Integer contragentID);



}
