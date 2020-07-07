package com.weflors.controller;


import com.weflors.entity.ProcurementEntity;
import com.weflors.entity.ProductEntity;
import com.weflors.entity.SaleEntity;
import com.weflors.service.ProcurementServiceImpl;
import com.weflors.service.ProductServiceImpl;
import com.weflors.service.SaleServiceImpl;
import com.weflors.util.SalesReportHelperBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Controller
public class SalesReportController {

    @Autowired
    private ProcurementServiceImpl procurementServiceImpl;

    @Autowired
    private SaleServiceImpl saleServiceImpl;

    @Autowired
    private ProductServiceImpl productServiceImpl;

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
        return procurementServiceImpl.loadAllProcurements();
    }

    @RequestMapping(value = "/getAllSalesByProductID", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    List<SaleEntity> getAllSalesByProductID(@RequestBody Integer productID) {
        return saleServiceImpl.findAllSalesByProductID(productID);
    }

/*    private Date getCorrectDateFormat(String incorrectDate) throws ParseException {
*//*        DateTimeFormatter dateTimeFormat = DateTimeFormatter.ofPattern("yyyy-mm-dd");
        String formattedString = incorrectDate.format(dateTimeFormat);*//*

        //String str = incorrectDate.toString().trim();
        // SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        //return Date.from(newDate.toInstant());
        return new SimpleDateFormat("yyyy-mm-dd").parse(incorrectDate);
    }*/

    @RequestMapping(value = "/updateSalesReportView", method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    List<ProductEntity> updateSalesReport(@RequestBody SalesReportHelperBean salesReportHelperBean) throws ParseException {

        //Date date = getCorrectDateFormat(salesReportHelperBean.getReportStartDatePeriod());
        List<ProductEntity> products = new ArrayList<ProductEntity>();
        List<Integer> productIDs = salesReportHelperBean.getProductIDs();

        if (productIDs != null && productIDs.size() == 0) {
            return productServiceImpl.findListOfProducts();
        }

        if (productIDs != null && productIDs.size() > 0 && salesReportHelperBean.getReportStartDatePeriod() == null) {
            return productServiceImpl.findAllProductsByProductId(productIDs);
        }

        for (int productID: productIDs) {
            ProductEntity productEntity = productServiceImpl.findByProductId(productID);
            List<ProcurementEntity> procurementEntities = procurementServiceImpl.findAllProcurementsByProductDate
                    (productID, salesReportHelperBean.getReportStartDatePeriod(),salesReportHelperBean.getReportEndDatePeriod());
            List<SaleEntity> salesEntities = saleServiceImpl.findAllSalesByProductDatePeriod
                    (productID, salesReportHelperBean.getReportStartDatePeriod(), salesReportHelperBean.getReportEndDatePeriod());
            productEntity.setProcurementsByProductId(procurementEntities);
            productEntity.setSalesByProductId(salesEntities);

            products.add(productEntity);

        }

        return products;
    }


}


