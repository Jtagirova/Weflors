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
    public void deleteByContragentId(@Param("contragentId") Integer contragentId);
    
    @Modifying
	@Transactional
	@Query(value ="update flowershop.contragents set address = :address, contragent_name = :contragentName, phone_1 = :phone1, phone_2 = :phone2,"
			+ "unk = :unk, inn = :inn, zip_code = :zipCode where contragent_id = :contragentId",
			nativeQuery = true)
	void updateContragentById(@Param("address") String address, 
							@Param("contragentName") String contragentName,
							@Param("phone1") String string, 
							@Param("phone2") String string2,
							@Param("unk") String string3, 
							@Param("inn") String string4, 
							@Param("zipCode") String string5,
							@Param("contragentId") Integer contragentId);
     
}
