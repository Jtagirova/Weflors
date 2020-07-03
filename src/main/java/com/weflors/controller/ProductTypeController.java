package com.weflors.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weflors.entity.ProductTypesEntity;
import com.weflors.service.ProductTypeService;

@Controller
@RequestMapping("/typeproduct")
public class ProductTypeController {
	
	private ProductTypeService productTypeService;
	
	public ProductTypeController(ProductTypeService productTypeService) {
		this.productTypeService = productTypeService;
	}
	
	@GetMapping
    public String addProductTypePage(Model model) {
		model.addAttribute("formName", "Справочник Категории товара");
        return "typeproduct";
    }
	
	@GetMapping("/list")
	@ResponseBody
	public List<ProductTypesEntity> getListOfProductTypes() {
	    return productTypeService.findAllProductType();
	}
	
	@PostMapping("/add")
	@ResponseBody
	public String addProductType(@RequestBody ProductTypesEntity productTypesEntity) {
		if(productTypeService.findByProductName(productTypesEntity.getProductTypeName()).isPresent()) { 
			return "Категория товара с таким именем уже существует в вашей базе данных";
		} else {
			productTypeService.saveNewProductType(productTypesEntity);
			return "Новая категория товара добавлена в вашу базу данных";
		}
	}
	
	@PostMapping("/update")
	@ResponseBody
	public String updateProductType(@RequestBody ProductTypesEntity productTypesEntity) {
		productTypeService.updateProductType(productTypesEntity);
		if(productTypeService.findByProductName(productTypesEntity.getProductTypeName()).isPresent()) { 
			return "Категория товара была обновлена в вашей базе данных";
		} else {
			return "Ошибка обновления данных о категории товара";
		}			
	}
	
	@DeleteMapping("/delete")
	@ResponseBody
	public String deleteProductType(@RequestBody ProductTypesEntity productTypesEntity) {
		productTypeService.deleteProductType(productTypesEntity.getProductTypeId());
		return "Категория товара была удалена из вашей базы данных";
	}
	
}