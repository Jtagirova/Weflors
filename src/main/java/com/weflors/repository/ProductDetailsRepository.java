package com.weflors.repository;

import com.weflors.entity.ProcurementEntity;
import com.weflors.entity.ProcurementEntityPK;
import com.weflors.entity.ProductDetailsEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductDetailsRepository extends JpaRepository<ProductDetailsEntity, Integer> {
}
