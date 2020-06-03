package com.weflors.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	@Autowired
	private ProductTypeService productTypeService;
	
	@GetMapping
    public String addProductTypePage(Model model) {
		model.addAttribute("formName", "Справочник Категории товара");
        return "typeproduct";
    }
	
	@GetMapping("/listProductTypes")
	@ResponseBody
	public List<ProductTypesEntity> addListOfProductTypes() {
	    return productTypeService.getAllProductType();
	}
	
	@PostMapping("/addNewProductType")
	@ResponseBody
	public String addNewProductType(@RequestBody ProductTypesEntity productTypesEntity) {
		if(productTypesEntity.getProductTypeName().isEmpty()) {
			return "Поле Наименование категории обязательно к заполнению";
		}
		if(productTypeService.existByProductName(productTypesEntity.getProductTypeName())  != null) { 
			return "Категория товара с таким именем уже существует в БД";
		} else {
			productTypeService.saveNewProductType(productTypesEntity);
			return "Новая категория товара добавлена";
		}
	}
	
	@DeleteMapping("/deleteProductType")
	@ResponseBody
	public String deleteProductType(@RequestBody ProductTypesEntity productTypesEntity) {
		productTypeService.deleteProductType(productTypesEntity.getProductTypeId());
		return "Категория товара была удалена";
	}
	
}


