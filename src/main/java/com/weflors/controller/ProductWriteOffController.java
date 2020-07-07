package com.weflors.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.weflors.entity.*;
import com.weflors.service.*;
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
	
    private SaleServiceImpl saleServiceImpl;
	
	private ProductStatusService productStatusService;
	
	private ProductServiceImpl productService;

	private ClientServiceImpl clientService;
	
	private ProcurementServiceImpl procurementServiceImpl;
	
	ProductWriteOffController(SaleServiceImpl saleServiceImpl, ProductStatusService productStatusService, 
			ProductServiceImpl productService, ClientServiceImpl clientService, ProcurementServiceImpl procurementServiceImpl){
		this.saleServiceImpl = saleServiceImpl;
		this.productStatusService = productStatusService;
		this.productService = productService;
		this.clientService = clientService;
		this.procurementServiceImpl = procurementServiceImpl;
	}
	
	@GetMapping
    public String addWriteOffPage(Model model) {
        List<ProductEntity> products = saleServiceImpl.getAllProduct();
        model.addAttribute("products", products);
        model.addAttribute("allClientsEmail", clientService.findAllClients());
		model.addAttribute("formName", "Списание товара");
        return "productwriteoff";
    }
	
	@PostMapping(value = "/loadproductinfobyproductid", produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
    public ProductEntity loadProductInfoByProductName(@RequestBody ProductEntity productEntity) {
	    ProductEntity selectedProduct = saleServiceImpl.getProductByProductId(productEntity.getProductId());
	    ProcurementEntity selectedProductPocurementInfo = procurementServiceImpl.findProcurementByProductID(productEntity.getProductId());
        ArrayList<ProcurementEntity> procurementEntityArrayList = new ArrayList<ProcurementEntity>();
        procurementEntityArrayList.add(selectedProductPocurementInfo);
        selectedProduct.setProcurementsByProductId(procurementEntityArrayList);
	    return selectedProduct;
    }
	
    @PostMapping("/addWriteOffs")
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
    		if(item.getValue() > productStatusService.findProductStatusEntity(item.getKey()).getQuantityWarehouse()) {
    			return "Вы хотите списать " + productService.findByProductId(item.getKey()).getProductName() + " в количестве " + item.getValue() +
    					" На складе есть: " + productStatusService.findProductStatusEntity(item.getKey()).getQuantityWarehouse() + " единиц товара.";
    		} else {
    			productStatusService.updateQuantity(item.getValue(),item.getKey());
    			responseText = responseText +  productService.findByProductId(item.getKey()).getProductName() + " в количестве " + item.getValue() + "\n";
    		}
    		
    	}
		return responseText; 	
    }
}