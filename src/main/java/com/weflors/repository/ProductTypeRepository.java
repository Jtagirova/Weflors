package com.weflors.repository;

import com.weflors.entity.ProductTypesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ProductTypeRepository extends JpaRepository<ProductTypesEntity, Integer> {

    @Query("select pt.productTypeName from ProductTypesEntity pt")
    List<String> getAllProductType();
    
    @Query("select true from ProductTypesEntity pt where pt.productTypeName = :productTypeName")
    public Boolean existByProductTypeName(@Param("productTypeName") String productTypeName);
    
    @Modifying
    @Transactional
    @Query("delete from ProductTypesEntity where productTypeId = :productTypeId")
    public void deleteByProductTypeId(@Param("productTypeId") Integer productTypeId);

}
