package com.weflors.service;

import com.weflors.entity.ProductEntity;
import com.weflors.repository.ProductRepository;
import com.weflors.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl {

    @Autowired
    private ProductRepository productRepository;

    public List<String> getAllUniqProductType(){
        return productRepository.getAllUniqProductType();
    }

    public ProductEntity saveProduct(ProductEntity productEntity){
        return productRepository.save(productEntity);
    }

    public List<Integer> getAllProductId()
    {
        return productRepository.getAllProductId();
    }

}
