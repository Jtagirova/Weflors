package com.weflors.repository;

import com.weflors.entity.SaleEntity;
import com.weflors.entity.SaleEntityPK;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;

public interface SaleRepository extends JpaRepository<SaleEntity, SaleEntityPK> {

    @Query("select sale from SaleEntity sale where sale.productId = :productID")
    List<SaleEntity> findAllSalesByProductID(@Param("productID") Integer productID);

    @Query("select sale from SaleEntity sale where sale.saleDate >= :date")
    List<SaleEntity> findAllSalesByDate(@Param("date") Timestamp date);

    @Query("select sale from SaleEntity sale where sale.productId = :productID and sale.saleDate >= :startDatePeriod and sale.saleDate <= :endDatePeriod")
    List<SaleEntity> findAllSalesByProductIDAndDatePeriod(
            @Param("productID") Integer productID, @Param("startDatePeriod") Timestamp startDatePeriod, @Param("endDatePeriod") Timestamp endDatePeriod);
    
    @Query("select sale from SaleEntity sale where DATE(sale.saleDate) = :localDate ORDER BY sale.saleDate DESC")
	List<SaleEntity> findAllSalesForThisDay(@Param("localDate") LocalDate localDate);

}
