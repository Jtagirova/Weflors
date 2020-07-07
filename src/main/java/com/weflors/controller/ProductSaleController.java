package com.weflors.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.weflors.entity.*;
import com.weflors.service.ClientServiceImpl;
import com.weflors.service.ProcurementServiceImpl;
import com.weflors.service.ProductStatusService;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.weflors.service.SaleServiceImpl;

@Controller
public class ProductSaleController {
	
    private SaleServiceImpl saleServiceImpl;

    private ProcurementServiceImpl procurementServiceImpl;

    private ClientServiceImpl clientService;

    private ProductStatusService productStatusService;
    
    public ProductSaleController(SaleServiceImpl saleServiceImpl, ProcurementServiceImpl procurementServiceImpl, 
    		ClientServiceImpl clientService, ProductStatusService productStatusService) {
    	this.saleServiceImpl = saleServiceImpl;
    	this.procurementServiceImpl = procurementServiceImpl;
    	this.clientService = clientService;
    	this.productStatusService = productStatusService;
    }

	private static LocalDate getCurrentDate(){
	    LocalDate currentDate = LocalDate.now();
	    return currentDate;
	}

	@RequestMapping(value = {"/productsale"}, method = RequestMethod.GET)
    public String addProductPage(Model model) {
        model.addAttribute("salesForThisDay", saleServiceImpl.findSalesForThisDay(getCurrentDate()));
        model.addAttribute("currentDate",getCurrentDate());
        model.addAttribute("products", saleServiceImpl.getAllProduct());
        model.addAttribute("allClientsEmail", clientService.findAllClients());
        model.addAttribute("saleForm", new SaleEntity());
        model.addAttribute("formName", "Продажа товара");
        return "productsale";
    }

    @RequestMapping(value = "/loadroductinfobyproductid", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    ProductEntity loadProductInfoByProductName(@RequestBody ProductEntity productEntity) {
	    ProductEntity selectedProduct = saleServiceImpl.getProductByProductId(productEntity.getProductId());
	    ProcurementEntity selectedProductPocurementInfo = procurementServiceImpl.findProcurementByProductID(productEntity.getProductId());
        ArrayList<ProcurementEntity> procurementEntityArrayList = new ArrayList<ProcurementEntity>();
        procurementEntityArrayList.add(selectedProductPocurementInfo);
        selectedProduct.setProcurementsByProductId(procurementEntityArrayList);
	    return selectedProduct;
    }

    @RequestMapping(value = "/loadClientDiscont", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    ClientEntity loadClientDiscont(@RequestBody String eMail) {
        return clientService.getClientByEmail(eMail);
    }

    @RequestMapping(value = "/addSaleProduct", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public boolean addSaleProduct(@RequestBody List<SaleEntity> saleEntityList) {

        for (SaleEntity saleEntity : saleEntityList) {
            for (ProductStatusEntity productStatusEntity : saleEntity.getProductByProductId().getProductStatusByProductId()) {
                 productStatusService.updateQuantityShopSaleAndQuantityWarehouse(productStatusEntity.getProductId(), productStatusEntity.getQuantityShopSale());
            }
        }
//        for (ProductEntity product:
//        productEntityList) {
//            saleServiceImpl.addAllToSales(new ArrayList<SaleEntity>(product.getSalesByProductId()));
//            for (ProductStatusEntity productStatusEntity:
//            product.getProductStatusByProductId()) {
//                productStatusService.updateQuantityShopSaleAndQuantityWarehouse(productStatusEntity.getProductId(),
//                        productStatusEntity.getQuantityWarehouse(), productStatusEntity.getQuantityShopSale());
//            }
//        }
        return saleServiceImpl.addAllToSales(saleEntityList);
    }



}