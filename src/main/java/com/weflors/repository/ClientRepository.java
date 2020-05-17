package com.weflors.repository;

import com.weflors.entity.ClientEntity;
import com.weflors.entity.ContragentsEntity;
import com.weflors.entity.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ClientRepository extends JpaRepository<ClientEntity, Integer> {

    @Query("select b.eMail from ClientEntity b")
    List<String> getAllClientEmail();

    @Query("select c.discount from ClientEntity c where c.eMail = :eMail")
    Integer getDiscountByClientEmail(@Param("eMail") String eMail);

    @Query("select c from ClientEntity c where c.eMail = :eMail")
    ClientEntity getClientByEmail(@Param("eMail") String eMail);
}
