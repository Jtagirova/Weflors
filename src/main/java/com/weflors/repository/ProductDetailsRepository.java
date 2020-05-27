package com.weflors.repository;

import com.weflors.entity.ProcurementEntity;
import com.weflors.entity.ProcurementEntityPK;
import com.weflors.entity.ProductDetailsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface ProductDetailsRepository extends JpaRepository<ProductDetailsEntity, Integer> {

    @Modifying
    @Query(value = "insert into postgres.flowershop.product_details(product_id, product_description, height, length, width, color) " +
            "values (:productId,:productDescription,:height,:length,:width,:color)", nativeQuery = true)
    @Transactional
    void saveProductDetail(@Param("productId") Integer productId, @Param("productDescription") String productDescription,
                         @Param("height") Integer height, @Param("length") Integer length,
                         @Param("width") Integer width,@Param("color") String color);
}
