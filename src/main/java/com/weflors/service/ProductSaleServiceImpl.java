package com.weflors.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weflors.entity.ProductEntity;
import com.weflors.repository.ProductRepository;

@Service
public class ProductSaleServiceImpl {

	@Autowired
	private ProductRepository productRepository;

	public List<ProductEntity> getAllProduct() {
		List<ProductEntity> products = productRepository.findAll();
		return products;
	}
}
