package com.weflors.service;

import com.weflors.entity.ProductEntity;
import com.weflors.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl {

    @Autowired
    private ProductRepository productRepository;



    public ProductEntity saveProduct(ProductEntity productEntity){
        return productRepository.save(productEntity);
    }

    public List<Integer> getAllProductId()
    {
        return productRepository.getAllProductId();
    }

    public ProductEntity findByProductId(Integer productId){
        return productRepository.findByProductID(productId);
    }

}
