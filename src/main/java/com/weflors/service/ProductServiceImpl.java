package com.weflors.service;

import com.weflors.entity.ProductEntity;
import com.weflors.repository.ProductRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl {

    private ProductRepository productRepository;
    
    public ProductServiceImpl(ProductRepository productRepository) {
    	this.productRepository = productRepository;
    }

    public ProductEntity saveProduct(ProductEntity productEntity){
        return productRepository.save(productEntity);
    }

    public List<Integer> getAllProductId(){
        return productRepository.getAllProductId();
    }

    public ProductEntity findByProductId(Integer productId){
        return productRepository.findByProductID(productId);
    }

    public List<ProductEntity> findAllProductsByProductId(List<Integer> productIDs) {
        return productRepository.findAllById(productIDs);
    }
    
    public List<ProductEntity> getFullListOfProducts(){
    	List<ProductEntity> productList = productRepository.findAll();
        return productList;
    }
    
    public void deleteProduct(Integer productId) {
    	productRepository.deleteByProductId(productId);
    }
}