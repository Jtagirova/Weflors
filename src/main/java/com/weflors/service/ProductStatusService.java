package com.weflors.service;

import com.weflors.entity.ProductStatusEntity;
import com.weflors.repository.ProductStatusRepository;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ProductStatusService {

    private ProductStatusRepository productStatusRepository;
    
    public ProductStatusService(ProductStatusRepository productStatusRepository){
    	this.productStatusRepository = productStatusRepository;
    }

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
/*
    public ProductStatusEntity getOne(ProductStatusEntityPK productStatusEntityPK){
        return productStatusRepository.getOne(productStatusEntityPK);
    }
 */   
    public ProductStatusEntity findProductStatusEntity(Integer productId){
        return productStatusRepository.findOneById(productId);
    }

}
