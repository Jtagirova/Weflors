package com.weflors.repository;

import com.weflors.entity.ProductStatusEntity;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;



public interface ProductStatusRepository extends JpaRepository<ProductStatusEntity, Integer> {
	
	@Modifying
	@Query(value ="update flowershop.product_status set quantity_warehouse = quantity_warehouse - :quantity,"
			+ "quantity_shop_sale = quantity_shop_sale - :quantity,"
			+ "total_quantity_writeoff = :quantity where product_id = :productId", nativeQuery = true)
	void updateQuantities(@Param("quantity") int quantity, @Param("productId") int productId);
								
}
