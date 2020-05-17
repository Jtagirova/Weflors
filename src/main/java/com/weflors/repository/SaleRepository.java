package com.weflors.repository;

import com.weflors.entity.ClientEntity;
import com.weflors.entity.SaleEntity;
import com.weflors.entity.SaleEntityPK;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SaleRepository extends JpaRepository<SaleEntity, SaleEntityPK> {
}
