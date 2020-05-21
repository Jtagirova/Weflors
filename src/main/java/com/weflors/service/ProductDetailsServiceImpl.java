package com.weflors.service;

import com.weflors.entity.ProductDetailsEntity;
import com.weflors.repository.ProductDetailsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductDetailsServiceImpl {

    @Autowired
    ProductDetailsRepository productDetailsRepository;

    public ProductDetailsEntity saveProductDetail(ProductDetailsEntity productDetailsEntity){
        return productDetailsRepository.save(productDetailsEntity);
    }

}
