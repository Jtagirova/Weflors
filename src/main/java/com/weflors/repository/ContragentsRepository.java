package com.weflors.repository;

import com.weflors.entity.ContragentsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface ContragentsRepository extends JpaRepository<ContragentsEntity, Integer> {

    @Query("select DISTINCT ca from ContragentsEntity ca where ca.contragentId = :contragentID")
    ContragentsEntity findByContragentID(@Param("contragentID") Integer contragentID);
   
    @Query("select true from ContragentsEntity ca where ca.contragentName = :contragentName")
    public Boolean existByName(@Param("contragentName") String contragentName);
    
    @Modifying
    @Transactional
    @Query("delete from ContragentsEntity where contragentId = :contragentId")
//    @Query(value ="delete from flowershop.contragents where contragent_id = :contragentId", nativeQuery = true)
    public void deleteByContragentId(@Param("contragentId") Integer contragentId);
     
}
