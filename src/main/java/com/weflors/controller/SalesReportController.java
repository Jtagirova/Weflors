package com.weflors.controller;

import com.weflors.entity.ContragentsEntity;
import com.weflors.entity.ProcurementEntity;
import com.weflors.entity.ProductEntity;
import com.weflors.entity.SaleEntity;
import com.weflors.service.ProcurementServiceImpl;
import com.weflors.service.SaleServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class SalesReportController {

    @Autowired
    private ProcurementServiceImpl procurementRepository;

    @Autowired
    private SaleServiceImpl saleServiceImpl;

    @RequestMapping(method = RequestMethod.GET)
    public String salesReportPage(Model model) {
        return "salesreport";
    }

    @RequestMapping(value = {"/salesreport"}, method = RequestMethod.GET)
    public String addProductPage(Model model) {
        model.addAttribute("allproducts", saleServiceImpl.getAllProduct());
        model.addAttribute("formName", "Отчет о продажах");
        return "salesreport";
    }

    @RequestMapping(value = "/getAllProcurementsByProduct", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    List<ProcurementEntity> getAllProcurements(@RequestBody Integer productId) {
        return procurementRepository.loadAllProcurements();
    }

    @RequestMapping(value = "/getAllSalesByProductID", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    List<SaleEntity> getAllSalesByProductID(@RequestBody Integer productID) {
        return saleServiceImpl.findAllSalesByProductID(productID);
    }

}


