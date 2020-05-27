package com.weflors.service;

import com.weflors.entity.ProductTypesEntity;
import com.weflors.repository.ProductTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProductTypeService {
    @Autowired
    private ProductTypeRepository productTypeRepository;

    public List<String> getProductType(){
        return productTypeRepository.getAllProductType();
    }

    public List<ProductTypesEntity> getAllProductType(){
        return productTypeRepository.findAll();
    }

}
