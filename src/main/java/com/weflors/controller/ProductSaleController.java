package com.weflors.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.weflors.entity.ProductEntity;

import com.weflors.service.ProductSaleServiceImpl;

@Controller
@RequestMapping(value = {"/productsale"})
public class ProductSaleController {
	@Autowired
	ProductSaleServiceImpl productSaleServiceImpl;
	
	@RequestMapping(method = RequestMethod.GET)
    public String addProductPage(Model model) {
        List<ProductEntity> products = productSaleServiceImpl.getAllProduct();
        model.addAttribute("products", products);
        return "productsale";
    }

}
