package com.weflors.controller;

import com.weflors.entity.*;
import com.weflors.service.*;
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
    private ProcurementServiceImpl procurementRepository;

    @Autowired
    private ProductDetailsServiceImpl productDetailsService;

    @Autowired
    private ProductStatusService productStatusService;

    @Autowired
    private ProductTypeService productTypeService;

    private CheckForNull check = param -> {
        if(param == null)
            return 0;
        else return param;
    };

    @RequestMapping(value = {"/addproduct"}, method = RequestMethod.GET)
    public String addProductPage(Model model, @RequestParam(value="name", required=false, defaultValue="World") String name) {
        model.addAttribute("name", name);
        List<ContragentsEntity> contragents = contragentsServiceImpl.findAllContragents();
        model.addAttribute("contragents", contragents);
        List<ProductTypesEntity> productTypeList = productTypeService.findAllProductTypes();
        model.addAttribute("productTypeList", productTypeList);
        model.addAttribute("formName", "Добавить товар");

        return "addproduct";
    }

    private void saveProcurementEntity(ProductEntity saveProduct){
        for (ProcurementEntity procurementEntity:
                saveProduct.getProcurementsByProductId()) {
            procurementEntity.setProductId(saveProduct.getProductId());
            procurementRepository.saveProcurement(procurementEntity);
        }
    }

    private void saveProductDetailsEntity(ProductEntity saveProduct, ProductDetailsEntity productDetailsEntity){

        productDetailsEntity.setProductId(saveProduct.getProductId());
        productDetailsEntity = validateProductDetailsEntityForNulls(productDetailsEntity);
        productDetailsService.saveProductDetail(productDetailsEntity);
    }

//    private boolean validateProductStatus(ProductEntity saveProduct){
//        for (Integer productId:
//        productService.getAllProductId()) {
//            if(productId.equals(saveProduct.getProductId()))
//                return false; // если есть запись, то апдейтим
//        }
//        return true; // если нет записи, то сохраняем
//    }

    private void saveProductStatus(ProductEntity saveProduct){
        for (ProductStatusEntity productStatusEntity:
                saveProduct.getProductStatusByProductId()) {
            productStatusEntity.setProductId(saveProduct.getProductId());
            productStatusService.saveProductStatus(productStatusEntity);
        }
    }


    private ProductDetailsEntity validateProductDetailsEntityForNulls(ProductDetailsEntity productDetailsEntity) {

        productDetailsEntity.setHeight(check.checkForNull(productDetailsEntity.getHeight()));
        productDetailsEntity.setLength(check.checkForNull(productDetailsEntity.getLength()));
        productDetailsEntity.setWidth(check.checkForNull(productDetailsEntity.getWidth()));
//        if (productDetailsEntity.getHeight() == null) productDetailsEntity.setHeight(0);
//        if (productDetailsEntity.getLength() == null) productDetailsEntity.setLength(0);
//        if (productDetailsEntity.getWidth() == null) productDetailsEntity.setWidth(0);

        return productDetailsEntity;
    }

    @RequestMapping(value = "/addproduct", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    ProductEntity addProduct(@RequestBody ProductEntity productEntity) {
        ProductDetailsEntity productDetailsEntity = productEntity.getProductDetailsByProductId();
        productEntity.setProductDetailsByProductId(null);
        ProductEntity saveProduct = productService.saveProduct(productEntity);
        saveProcurementEntity(saveProduct);
        saveProductDetailsEntity(saveProduct, productDetailsEntity);
        saveProductStatus(saveProduct);
        return saveProduct;
    }

    @RequestMapping(value = "/getContragentById", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    ContragentsEntity getContragentById(@RequestBody Integer contragentId) {
        ContragentsEntity a = contragentsServiceImpl.loadContragentByContragentID(contragentId);
        return a;
    }
}

@FunctionalInterface
interface CheckForNull{
    Integer checkForNull(Integer param);
}
