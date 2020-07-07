package com.weflors.service;

import com.weflors.entity.ProductStatusEntity;
import com.weflors.entity.ProductStatusEntityPK;
import com.weflors.repository.ProductStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ProductStatusService {

    @Autowired
    private ProductStatusRepository productStatusRepository;

    public ProductStatusEntity saveProductStatus(ProductStatusEntity productStatusEntity){
        return productStatusRepository.save(productStatusEntity);
    }

    public List<Date> getValidityDateByProductId(Integer productId){
        return productStatusRepository.getValidityDateByProdictId(productId);
    }

    public void updateQuantityShopSaleAndWarehouse(Integer productId, Integer quantityShopSale){
        productStatusRepository.updateQuantityShopSaleAndWarehouse(productId, quantityShopSale);
    }

    public void updateQuantityWriteoffAndWarehouse(Integer productId, Integer quantityWriteoff){
        productStatusRepository.updateQuantityWriteoffAndWarehouse(productId, quantityWriteoff);
    }

    public ProductStatusEntity getOne(ProductStatusEntityPK productStatusEntityPK){
        return productStatusRepository.getOne(productStatusEntityPK);
    }
    
    public ProductStatusEntity findOneProductStatusEntity(Integer productId){
        return productStatusRepository.findOneById(productId);
    }

}
