package com.weflors.repository;

import com.weflors.entity.SaleEntity;
import com.weflors.entity.SaleEntityPK;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

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
    
    
	//костыль обыкновенные
    @Query(value = "SELECT b.product_name, b.articul, c.validity_date, a.sale_date, a.product_price, a.sale_price, a.quantity, a.details\n" + 
    		"FROM flowershop.sale a LEFT OUTER JOIN flowershop.product b ON a.product_id = b.product_id LEFT OUTER JOIN flowershop.product_status c " + 
    		"ON a.product_id = c.product_id ORDER BY a.sale_date DESC", nativeQuery = true)
    List<Object> findAllSalesForReport();

    @Modifying
   	@Transactional
   	@Query("update SaleEntity set details = :details where productId = :productId")
    void updateSaleDetailsById(@Param("details") String details, @Param("productId") Integer productId);
}
