package com.weflors.service;

import com.weflors.entity.ContragentsEntity;
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
    
    public ProductTypesEntity saveNewProductType(ProductTypesEntity productTypesEntity)  {
        return productTypeRepository.save(productTypesEntity);
    }
    
    public Boolean existByProductName(String productTypeName) {
    	Boolean exist = productTypeRepository.existByProductTypeName(productTypeName);
    	return exist;
    }
    
    public void deleteProductType(Integer productTypeId) {
    	productTypeRepository.deleteByProductTypeId(productTypeId);
    }

}
