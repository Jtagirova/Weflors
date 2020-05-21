package com.weflors.controller;

import com.weflors.entity.*;
import com.weflors.repository.ProcurementRepository;
import com.weflors.service.ContragentsServiceImpl;
import com.weflors.service.ProductDetailsServiceImpl;
import com.weflors.service.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class AddProductController {
    @Autowired
    private ContragentsServiceImpl contragentsServiceImpl;

    @Autowired
    private ProductServiceImpl productService;

    @Autowired
    private ProcurementRepository procurementRepository;

    @Autowired
    private ProductDetailsServiceImpl productDetailsService;

    @RequestMapping(value = {"/addproduct"}, method = RequestMethod.GET)
    public String addProductPage(Model model, @RequestParam(value="name", required=false, defaultValue="World") String name) {
        model.addAttribute("name", name);
        List<ContragentsEntity> contragents = contragentsServiceImpl.loadContragents();
        model.addAttribute("contragents", contragents);
        List<String> productTypeList = productService.getAllUniqProductType();
        model.addAttribute("productTypeList", productTypeList);
        return "addproduct";
    }

    private void saveProcurementEntity(ProductEntity saveProduct){
        for (ProcurementEntity procurementEntity:
                saveProduct.getProcurementsByProductId()) {
            procurementEntity.setProductId(saveProduct.getProductId());
            procurementRepository.save(procurementEntity);
        }
    }

    private void saveProductDetailsEntity(ProductEntity saveProduct){
        ProductDetailsEntity productDetailsEntity = saveProduct.getProductDetailsByProductId();
        productDetailsEntity.setProductId(saveProduct.getProductId());
        productDetailsService.saveProductDetail(productDetailsEntity);
    }

    @RequestMapping(value = "/addproduct", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    ProductEntity addSaleProduct(@RequestBody ProductEntity productEntity) {
        ProductEntity saveProduct = productService.saveProduct(productEntity);
        saveProcurementEntity(saveProduct);
        saveProductDetailsEntity(saveProduct);
        return saveProduct;
    }

    @RequestMapping(value = "/getContragentById", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    ContragentsEntity getContragentById(@RequestBody Integer contagentId) {
        ContragentsEntity a = contragentsServiceImpl.loadContragentByContragentID(contagentId);
        return a;
    }
}
