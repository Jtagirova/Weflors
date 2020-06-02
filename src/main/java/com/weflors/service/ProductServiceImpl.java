package com.weflors.service;

import com.weflors.entity.ProductEntity;
import com.weflors.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

@Service
public class ProductServiceImpl {

    @Autowired
    private ProductRepository productRepository;

    public ProductEntity saveProduct(ProductEntity productEntity){
        return productRepository.save(productEntity);
    }

    public List<Integer> getAllProductId(){
        return productRepository.getAllProductId();
    }

    public ProductEntity findByProductId(Integer productId){
        return productRepository.findByProductID(productId);
    }
    
    public List<ProductEntity> getFullListOfProducts(){
    	List<ProductEntity> productList = productRepository.findAll();
        return productList;
    }

}

/*
List<ProductEntity> productList = new ArrayList<>();
productList = list.stream().map(a -> new ProductEntity(a.getProductId(), a.getProductName(), 
		a.getArticul(), a.getProductPrice(), a.getProcurementsByProductId(),a.getContragentsByContragentId(),
		a.getProductTypesByProductTypeId(), a.getProductDetailsByProductId(), a.getProductStatusByProductId(), 
		a.getSalesByProductId())).collect(Collectors.toList());
*/