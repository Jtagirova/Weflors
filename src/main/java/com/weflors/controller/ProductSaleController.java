package com.weflors.controller;

import java.util.ArrayList;
import java.util.List;

import com.weflors.entity.ClientEntity;
import com.weflors.entity.ProcurementEntity;
import com.weflors.entity.SaleEntity;
import com.weflors.service.ClientServiceImpl;
import com.weflors.service.ProcurementServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.weflors.entity.ProductEntity;

import com.weflors.service.SaleServiceImpl;

@Controller
public class ProductSaleController {
	@Autowired
    SaleServiceImpl saleServiceImpl;

    @Autowired
    ProcurementServiceImpl procurementServiceImpl;

    @Autowired
    ClientServiceImpl clientService;

	@RequestMapping(value = {"/productsale"}, method = RequestMethod.GET)
    public String addProductPage(Model model) {
        List<ProductEntity> products = saleServiceImpl.getAllProduct();


        model.addAttribute("products", products);
        model.addAttribute("allClientsEmail", clientService.getAllClients());
        model.addAttribute("saleForm", new SaleEntity());
        return "productsale";
    }

    @RequestMapping(value = "/loadProductInfoByProductName", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    ProductEntity loadProductInfoByProductName(@RequestBody ProductEntity productEntity) {
	    ProductEntity selectedProduct = saleServiceImpl.getProductByProductId(productEntity.getProductId());
	    ProcurementEntity selectedProductPocurementInfo = procurementServiceImpl.findByProcurementProductID(productEntity.getProductId());
	   // selectedProduct.setProcurementsByProductId(selectedProductPocurementInfo);
        ArrayList<ProcurementEntity> procurementEntityArrayList = new ArrayList<ProcurementEntity>();
        procurementEntityArrayList.add(selectedProductPocurementInfo);
        selectedProduct.setProcurementsByProductId(procurementEntityArrayList);
	    return selectedProduct;
    }

    @RequestMapping(value = "/loadClientDiscont", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    ClientEntity loadClientDiscont(@RequestBody String eMail) {
        return clientService.getClientByEmail(eMail);
    }



    @RequestMapping(value = "/addSaleProduct", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody boolean addSaleProduct(@RequestBody List<SaleEntity> saleEntityList) {

        return saleServiceImpl.addAllToSales(saleEntityList);
    }



}
