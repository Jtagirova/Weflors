package com.weflors.repository;

import com.weflors.entity.ContragentsEntity;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface ContragentsRepository extends JpaRepository<ContragentsEntity, Integer> {

    @Query("select DISTINCT ca from ContragentsEntity ca where ca.contragentId = :contragentID")
    ContragentsEntity findByContragentID(@Param("contragentID") Integer contragentID);
   
    @Query("select ca from ContragentsEntity ca where ca.contragentName = :contragentName")
    Optional<ContragentsEntity> findByContragentName(@Param("contragentName") String contragentName);
    
    @Modifying
    @Transactional
    @Query("delete from ContragentsEntity where contragentId = :contragentId")
    void deleteByContragentId(@Param("contragentId") Integer contragentId);
    
    @Modifying
	@Transactional
	@Query(value ="update flowershop.contragents set address = :address, contragent_name = :contragentName, phone_1 = :phone1, phone_2 = :phone2,"
			+ "unk = :unk, inn = :inn, zip_code = :zipCode where contragent_id = :contragentId",
			nativeQuery = true)
	void updateContragentById(@Param("address") String address, 
							@Param("contragentName") String contragentName,
							@Param("phone1") String phone1, 
							@Param("phone2") String phone2,
							@Param("unk") String unk, 
							@Param("inn") String inn, 
							@Param("zipCode") String zipCode,
							@Param("contragentId") Integer contragentId);
     
}
