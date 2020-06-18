package com.weflors.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = {"/", "/login"})
public class LoginController {
	
	@RequestMapping(method = RequestMethod.GET)
    public String loginPage(Model model) {
 
        return "login";
    }

    @RequestMapping(params = "registernewuser", method = RequestMethod.POST)
    public String registerNewUser(HttpServletRequest request) {
        return "redirect:/registration";
    }

}
