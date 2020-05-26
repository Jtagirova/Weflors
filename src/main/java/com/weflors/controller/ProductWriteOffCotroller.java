package com.weflors.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weflors.entity.ProcurementEntity;
import com.weflors.entity.ProductEntity;
import com.weflors.entity.SaleEntity;
import com.weflors.repository.ProductRepository;
import com.weflors.repository.ProductStatusRepository;
import com.weflors.service.ClientServiceImpl;
import com.weflors.service.ProcurementServiceImpl;
import com.weflors.service.SaleServiceImpl;

@Controller
@RequestMapping("/productWriteOff")
public class ProductWriteOffCotroller {
	
	@Autowired
    private SaleServiceImpl saleServiceImpl;
	
	@Autowired
	private ProductStatusRepository productStatusRepository;
	
	@Autowired
	private ProductRepository productRepository;
	
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
	
	@PostMapping(value = "/loadProductInfoByProduct", produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
    public ProductEntity loadProductInfoByProductName(@RequestBody ProductEntity productEntity) {
	    ProductEntity selectedProduct = saleServiceImpl.getProductByProductId(productEntity.getProductId());
	    ProcurementEntity selectedProductPocurementInfo = procurementServiceImpl.findByProcurementProductID(productEntity.getProductId());
        ArrayList<ProcurementEntity> procurementEntityArrayList = new ArrayList<ProcurementEntity>();
        procurementEntityArrayList.add(selectedProductPocurementInfo);
        selectedProduct.setProcurementsByProductId(procurementEntityArrayList);
	    return selectedProduct;
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
    	
    	for(Map.Entry<Integer, Integer> item : mapProductId.entrySet()) {
    		if(item.getValue() > productStatusRepository.getOne(item.getKey()).getQuantityWarehouse()) {
    			return "Вы хотите списать " + productRepository.findByProductID(item.getKey()).getProductName() + " в количестве " + item.getValue() +
    					" На складе есть: " + productStatusRepository.getOne(item.getKey()).getQuantityWarehouse() + " единиц товара.";
    		} else {
    			productStatusRepository.updateQuantities(item.getValue(),item.getKey());
    		}
    		
    	}
		return "Товар Списан"; 	
}  
    
    
    
    
    
    
    
    
   /* 
    @PostMapping(value = "/addWriteOffs", produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public boolean addWriteOffProduct(@RequestBody List <SaleEntity> saleEntitylist) throws IOException { 
    	
//    	List <SaleEntity> newSaleEntitylist ;
    	for(SaleEntity saleEntity : saleEntitylist) {
    		int quantityWarehouse = productStatusRepository.getOne(saleEntity.getProductId()).getQuantityWarehouse();
    		if(quantityWarehouse - saleEntity.getQuantity() < 0) {
    			return false;
    		} else {
    		//если quantityWarehouse меньше чем поступающая, то вернуть в форму уведомление о нехватке
//    		productStatusRepository.updateQuantities(saleEntity.getQuantity(),saleEntity.getProductId());
    		saleServiceImpl.addAllToSales(saleEntitylist);
    		}
    	}
    	return true;
    } 
    
 */  
    
    
    
    
    
    
    
    
    
    
}
