package com.weflors.repository;

import com.weflors.entity.SaleEntity;
import com.weflors.entity.SaleEntityPK;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;

public interface SaleRepository extends JpaRepository<SaleEntity, SaleEntityPK> {

    @Query("select sale from SaleEntity sale where sale.productId = :productID and sale.salePrice <> 0")
    List<SaleEntity> findAllSalesByProductID(@Param("productID") Integer productID);

    @Query("select sale from SaleEntity sale where sale.saleDate >= :date")
    List<SaleEntity> findAllSalesByDate(@Param("date") Timestamp date);

    @Query("select sale from SaleEntity sale where sale.productId = :productID and sale.saleDate >= :startDatePeriod and sale.saleDate <= :endDatePeriod and sale.salePrice <> 0")
    List<SaleEntity> findAllSalesByProductIDAndDatePeriod(
            @Param("productID") Integer productID, @Param("startDatePeriod") Timestamp startDatePeriod, @Param("endDatePeriod") Timestamp endDatePeriod);
    
    @Query("select sale from SaleEntity sale where DATE(sale.saleDate) = :localDate  and sale.salePrice <> 0 ORDER BY sale.saleDate DESC")
	List<SaleEntity> findAllSalesForThisDay(@Param("localDate") LocalDate localDate);

    @Query("select sale from SaleEntity sale where sale.salePrice = :salePrice ORDER BY sale.articul, sale.saleDate DESC")
    List<SaleEntity> findAllSalesBySalePrice(@Param("salePrice") BigDecimal salePrice);

    @Modifying
   	@Transactional
   	@Query("update SaleEntity set details = :details where productId = :productId")
    void updateSaleDetailsById(@Param("details") String details, @Param("productId") Integer productId);
}
