package com.weflors.repository;

import com.weflors.entity.ContragentsEntity;
import com.weflors.entity.ProcurementEntity;
import com.weflors.entity.ProcurementEntityPK;
import com.weflors.entity.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public interface ProcurementRepository extends JpaRepository<ProcurementEntity, ProcurementEntityPK> {

    @Query("select procurement from ProcurementEntity procurement where procurement.productId = :productID")
    ProcurementEntity findProcurementByProductID(@Param("productID") Integer productID);

    @Query("select procurement from ProcurementEntity procurement where procurement.productId = :productID")
    List<ProcurementEntity> findAllProcurementsByProductID(@Param("productID") Integer productID);

    @Query("select procurement from ProcurementEntity procurement where procurement.procurementDate >= :date")
    List<ProcurementEntity> findAllProcurementsByDate(@Param("date") Timestamp date);

    @Query("select procurement from ProcurementEntity procurement where procurement.productId = :productID and " +
            "procurement.procurementDate >= :startDatePeriod and procurement.procurementDate <= :endDatePeriod")
    List<ProcurementEntity> findAllProcurementsByProductIDAndDatePeriod(@Param(
            "productID") Integer productID, @Param("startDatePeriod") Timestamp startDatePeriod, @Param("endDatePeriod") Timestamp endDatePeriod);

}
