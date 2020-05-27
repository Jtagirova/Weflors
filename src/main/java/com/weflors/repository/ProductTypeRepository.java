package com.weflors.repository;

import com.weflors.entity.ProductStatusEntity;
import com.weflors.entity.ProductTypesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductTypeRepository extends JpaRepository<ProductTypesEntity, Integer> {

    @Query("select b.productTypeName from ProductTypesEntity b")
    List<String> getAllProductType();

}
