package com.weflors.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.weflors.service.ProductServiceImpl;
import com.weflors.service.SaleServiceImpl;

@Controller
@RequestMapping("/productwriteoffreport")
public class ProductWriteOffReportController {
	
	private SaleServiceImpl saleServiceImpl;
	
	private ProductServiceImpl productServiceImpl;

	public ProductWriteOffReportController(SaleServiceImpl saleServiceImpl, ProductServiceImpl productServiceImpl) {
		this.saleServiceImpl = saleServiceImpl;
		this.productServiceImpl = productServiceImpl;
	}

	@GetMapping
    public String addProductListPage(Model model) throws JsonProcessingException {
		model.addAttribute("formName", "Отчет о списании товаров");
		//костыль обыкновенный
		model.addAttribute("writeOffProductList", saleServiceImpl.findAllSalesForReport());
        return "productwriteoffreport";
    }

}