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

import com.weflors.entity.ContragentsEntity;
import com.weflors.entity.ProductEntity;
import com.weflors.service.ContragentsServiceImpl;
import com.weflors.service.ProductServiceImpl;


@Controller
@RequestMapping("/productslist")
public class ProductListController {
	
	@Autowired
	private ProductServiceImpl productServiceImpl;
	
	@GetMapping
    public String addProductListPage(Model model) {
		List<ProductEntity> productList = productServiceImpl.getFullListOfProducts();
		model.addAttribute("formName", "Список продуктов");
//		model.addAttribute("productList", productList);
        return "productslist";
    }
/*	
	@GetMapping("/listOfProducts")
	@ResponseBody
	public List<ProductEntity> addFullListProducts() {
		List<ProductEntity> list = productServiceImpl.getFullListOfProducts();
	    return list;
	}
*/	
}


