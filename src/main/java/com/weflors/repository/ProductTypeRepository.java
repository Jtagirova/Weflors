package com.weflors.repository;

import com.weflors.entity.ProductTypesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

public interface ProductTypeRepository extends JpaRepository<ProductTypesEntity, Integer> {

    @Query("select pt.productTypeName from ProductTypesEntity pt")
    List<String> getAllProductType();
    
    @Query("select pt from ProductTypesEntity pt where pt.productTypeName = :productTypeName")
    Optional<ProductTypesEntity> findByProductTypeName(@Param("productTypeName") String productTypeName);
    
    @Modifying
    @Transactional
    @Query("delete from ProductTypesEntity where productTypeId = :productTypeId")
    void deleteByProductTypeById(@Param("productTypeId") Integer productTypeId);
    
    @Modifying
   	@Transactional
   	@Query(value ="update flowershop.product_types set product_type_name = :productTypeName where product_type_id = :productTypeId", nativeQuery = true)
   	void updateProductTypeById(@Param("productTypeName") String productTypeName, @Param("productTypeId") Integer productTypeId);

}