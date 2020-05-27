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

import com.weflors.repository.ProductRepository;
import com.weflors.repository.ProductStatusRepository;

@Controller
@RequestMapping("/productwriteoff")
public class ProductWriteOffCotroller {
	
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
	
	@PostMapping(value = "/loadproductinfobyproduct", produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
    public ProductEntity loadProductInfoByProductName(@RequestBody ProductEntity productEntity) {
	    ProductEntity selectedProduct = saleServiceImpl.getProductByProductId(productEntity.getProductId());
	    ProcurementEntity selectedProductPocurementInfo = procurementServiceImpl.findByProcurementProductID(productEntity.getProductId());
        ArrayList<ProcurementEntity> procurementEntityArrayList = new ArrayList<ProcurementEntity>();
        procurementEntityArrayList.add(selectedProductPocurementInfo);
        selectedProduct.setProcurementsByProductId(procurementEntityArrayList);
	    return selectedProduct;
    }
	    
    @PostMapping(value = "/addwriteoffs", produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String addWriteOffProduct(@RequestBody List <SaleEntity> saleEntityList){

		saleServiceImpl.addAllToSales(saleEntityList);

		for (SaleEntity saleEntity:
				saleEntityList) {
			for (ProductStatusEntity productStatusEntity:
					saleEntity.getProductByProductId().getProductStatusByProductId()) {
				ProductStatusEntityPK productStatusEntityPK = new ProductStatusEntityPK(productStatusEntity.getProductId(), productStatusEntity.getValidityDate());
				if(productStatusEntity.getTotalQuantityWriteoff() > productStatusService.getOne(productStatusEntityPK).getQuantityWarehouse()) {
					return "Вы хотите списать " + productService.findByProductId(productStatusEntity.getProductId()).getProductName() + " в количестве " + productStatusEntity.getTotalQuantityWriteoff() +
							" На складе есть: " + productStatusService.getOne(productStatusEntityPK).getQuantityWarehouse() + " единиц товара.";
				}else {
					productStatusService.updateQuantity(
							productStatusEntity.getTotalQuantityWriteoff(), productStatusEntity.getProductId());
				}
			}
		}

//    	Map<Integer, Integer> mapProductId = new HashMap<>();
//    	for(SaleEntity entity : saleEntityList) {
//    		if(mapProductId.containsKey(entity.getProductId())) {
//    			mapProductId.put(entity.getProductId(),(mapProductId.get(entity.getProductId()) + entity.getQuantity()));
//    		}	else {
//    			mapProductId.put(entity.getProductId(), entity.getQuantity());
//    		}
//    	}
//
//
//
//    	for(Map.Entry<Integer, Integer> item : mapProductId.entrySet()) {
//    		if(item.getValue() != productStatusRepository.getOne(item.getKey()).getQuantityWarehouse()) {
//    			return "Вы хотите списать " + productRepository.findByProductID(item.getKey()).getProductName() + " в количестве " + item.getValue() +
//    					" На складе есть: " + productStatusRepository.getOne(item.getKey()).getQuantityWarehouse() + " единиц товара.";
//    		} else {
//    			productStatusRepository.updateQuantities(item.getValue(),item.getKey());
//    		}
		return "Товар Списан";
    	}










 /*
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
*/

    
    
    
    
    
    
    
    
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
