package com.weflors.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.weflors.entity.ProductEntity;
import com.weflors.service.ProductServiceImpl;


@Controller
@RequestMapping("/productslist")
public class ProductListController {
	
	@Autowired
	private ProductServiceImpl productServiceImpl;
	
	@GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public String addProductListPage(Model model) throws JsonProcessingException {
		List<ProductEntity> productList = productServiceImpl.getFullListOfProducts();
		model.addAttribute("formName", "Список товаров");
		model.addAttribute("productList", productList);
        return "productslist";
    }

	@DeleteMapping("/deleteProduct")
	@ResponseBody
	public String deleteProduct(@RequestBody ProductEntity productEntity) {
		productServiceImpl.deleteProduct(productEntity.getProductId());
		return "Товар был удален";
	}
	
}


