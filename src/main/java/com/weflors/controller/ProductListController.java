package com.weflors.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
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
//		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
//	    String productList = ow.writeValueAsString(list);
		model.addAttribute("formName", "Список продуктов");
		model.addAttribute("productList", productList);
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


