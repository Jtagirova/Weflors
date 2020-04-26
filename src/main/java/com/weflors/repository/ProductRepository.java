package com.weflors.repository;

import com.weflors.entity.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ProductRepository extends JpaRepository<ProductEntity, Integer> {

    @Query("select prod from ProductEntity prod where prod.productId = :productID")
    ProductEntity findByProductID(@Param("productID") String productID);

    @Query("select prod from ProductEntity prod where prod.productType = :productType")
    ProductEntity findByProductType(@Param("productType") String productType);

    @Query("select prod from ProductEntity prod where prod.articul = :articul")
    ProductEntity findByArticul(@Param("articul") String articul);

    @Query("select prod, prodDetails from ProductEntity prod, ProductDetailsEntity prodDetails where prod.productId = :productID")
    ProductEntity findProductDetailsByProductID(@Param("productID") String productID);
}
