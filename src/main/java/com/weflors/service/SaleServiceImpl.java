package com.weflors.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import com.weflors.entity.SaleEntity;
import com.weflors.repository.SaleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weflors.entity.ProductEntity;
import com.weflors.repository.ProductRepository;

@Service
public class SaleServiceImpl {

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private SaleRepository saleRepository;

	public List<ProductEntity> getAllProduct() {
		List<ProductEntity> products = productRepository.findAll();
		return products;
	}

	public ProductEntity getProductByProductId(int id) {
		ProductEntity product = productRepository.findByProductID(id);
		return product;
	}

	public boolean addAllToSales(List<SaleEntity> saleEntity){
		saleRepository.saveAll(saleEntity);
		return true;
	}

	public boolean addSale(SaleEntity saleEntity){
		saleRepository.save(saleEntity);
		return true;
	}

	public List<SaleEntity> findAllSalesByProductID(Integer productID) {
		return saleRepository.findAllSalesByProductID(productID);
	}

	public List<SaleEntity> findAllSalesByDate(Timestamp date) {
		return saleRepository.findAllSalesByDate(date);
	}

	public List<SaleEntity> findAllSalesByProductDate(Integer productId, Timestamp date) {
		return saleRepository.findAllSalesByProductIDAndDate(productId, date);
	}

	public List<SaleEntity> getSalesForThisDay() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
	    LocalDateTime currentDateAndTime = LocalDateTime.now();
		return saleRepository.findAllSalesForThisDay(currentDateAndTime);
	}

}
