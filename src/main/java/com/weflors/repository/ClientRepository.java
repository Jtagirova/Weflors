package com.weflors.repository;

import com.weflors.entity.ClientEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.List;

public interface ClientRepository extends JpaRepository<ClientEntity, Integer> {

    @Query("select b.eMail from ClientEntity b")
    List<String> getAllClientEmail();

    @Query("select c.discount from ClientEntity c where c.eMail = :eMail")
    Integer getDiscountByClientEmail(@Param("eMail") String eMail);

    @Query("select c from ClientEntity c where c.eMail = :eMail")
    ClientEntity getClientByEmail(@Param("eMail") String eMail);

    @Modifying
    @Transactional
    @Query("delete from ClientEntity where clientId = :clientId")
    void deleteByClientId(@Param("clientId") Integer clientId);
    
    @Modifying
	@Transactional
	@Query("update ClientEntity set clientName = :clientName, clientSurname = :clientSurname, dateOfBirth = :dateOfBirth, eMail = :eMail,"
			+ "phone = :phone, discount = :discount, address = :address, zipCode = :zipCode where clientId = :clientId")
	void updateClientById(@Param("clientName") String clientName, 
							@Param("clientSurname") String clientSurname,
							@Param("dateOfBirth") Date dateOfBirth, 
							@Param("eMail") String eMail,
							@Param("phone") String phone, 
							@Param("discount") Integer discount, 
							@Param("address") String address,
							@Param("zipCode") String zipCode,
							@Param("clientId") Integer clientId);
}