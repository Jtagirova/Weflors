package com.weflors.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = {"/salesreport"})
public class SalesReportController {

    @RequestMapping(method = RequestMethod.GET)
    public String salesReportPage(Model model) {
        return "salesreport";
    }
}
