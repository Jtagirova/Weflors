package com.weflors.repository;

import com.weflors.entity.ContragentsEntity;
import com.weflors.entity.ProcurementEntity;
import com.weflors.entity.ProcurementEntityPK;
import com.weflors.entity.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ProcurementRepository extends JpaRepository<ProcurementEntity, ProcurementEntityPK> {

    @Query("select procurement from ProcurementEntity procurement where procurement.productId = :productID")
    ProcurementEntity findByProcurementProductID(@Param("productID") Integer productID);
}
