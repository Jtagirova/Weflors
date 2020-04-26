package com.weflors.controller;

import com.weflors.entity.ContragentsEntity;
import com.weflors.service.ContragentsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping(value = {"/addproduct"})
public class AddProductController {
    @Autowired
    private ContragentsServiceImpl contragentsServiceImpl;

    @RequestMapping(method = RequestMethod.GET)
    public String addProductPage(Model model, @RequestParam(value="name", required=false, defaultValue="World") String name) {
        model.addAttribute("name", name);
        List<ContragentsEntity> contragents = contragentsServiceImpl.loadContragents();
        model.addAttribute("contragents", contragents);
        return "addproduct";
    }
}
