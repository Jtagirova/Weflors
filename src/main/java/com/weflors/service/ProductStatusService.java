package com.weflors.service;

import com.weflors.entity.ProductStatusEntity;
import com.weflors.entity.ProductStatusEntityPK;
import com.weflors.repository.ProductStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
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

    public void updateQuantityShopSaleAndQuantityWarehouse(Integer productId,
                                                           Integer quantityShopSale){
        productStatusRepository.updateQuantityShopSaleAndQuantityWarehouse(productId, quantityShopSale);
    }

    public void updateQuantity(int quantity, int productId){
        productStatusRepository.updateQuantityWriteoff(quantity, productId);
    }

    public ProductStatusEntity getOne(ProductStatusEntityPK productStatusEntityPK){
        return productStatusRepository.getOne(productStatusEntityPK);
    }


}
