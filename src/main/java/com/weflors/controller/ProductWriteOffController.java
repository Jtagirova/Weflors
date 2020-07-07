package com.weflors.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.weflors.entity.*;
import com.weflors.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/productwriteoff")
public class ProductWriteOffController {
	
	@Autowired
    private SaleServiceImpl saleServiceImpl;
	
	@Autowired
	private ProductStatusService productStatusService;
	
	@Autowired
	private ProductServiceImpl productService;
	
	@Autowired
    private ClientServiceImpl clientService;
	
	@Autowired
	private ProcurementServiceImpl procurementServiceImpl;
    
	@GetMapping
    public String addWriteOffPage(Model model) {
        List<ProductEntity> products = saleServiceImpl.getAllProduct();
        model.addAttribute("products", products);
        model.addAttribute("allClientsEmail", clientService.getAllClients());
		model.addAttribute("formName", "Списание товара");
        return "productwriteoff";
    }
	
	@PostMapping(value = "/loadproductinfobyproductid", produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
    public ProductEntity loadProductInfoByProductName(@RequestBody ProductEntity productEntity) {
	    return saleServiceImpl.getProductByProductId(productEntity.getProductId());
    }
	
    @PostMapping(value = "/addWriteOffs", produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String addWriteOffProduct(@RequestBody List <SaleEntity> saleEntitylist){
    	Map<Integer, Integer> mapProductId = new HashMap<>();
    	for(SaleEntity entity : saleEntitylist) {
    		if(mapProductId.containsKey(entity.getProductId())) {
    			mapProductId.put(entity.getProductId(),(mapProductId.get(entity.getProductId()) + entity.getQuantity()));
    		}	else {
    			mapProductId.put(entity.getProductId(), entity.getQuantity());
    		}
    	}
    	String responseText = "Вы списали: " + "\n";
    	for(Map.Entry<Integer, Integer> item : mapProductId.entrySet()) {
    		if(item.getValue() > productStatusService.findOneProductStatusEntity(item.getKey()).getQuantityWarehouse()) {
    			return "Вы хотите списать " + productService.findByProductId(item.getKey()).getProductName() + " в количестве " + item.getValue() +
    					" На складе есть: " + productStatusService.findOneProductStatusEntity(item.getKey()).getQuantityWarehouse() + " единиц товара.";
    		} else {
    			productStatusService.updateQuantityWriteoffAndWarehouse(item.getKey(), item.getValue());
    			responseText = responseText +  productService.findByProductId(item.getKey()).getProductName() + " в количестве " + item.getValue() + "\n";
    		}
    		
    	}
		return responseText; 	
    }
}