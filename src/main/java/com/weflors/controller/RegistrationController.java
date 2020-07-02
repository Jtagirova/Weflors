package com.weflors.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.weflors.entity.UserEntity;
import com.weflors.service.UserDetailsServiceImpl;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = { "/registration" })
public class RegistrationController {

	@Autowired
	private UserDetailsServiceImpl userService;

	@RequestMapping(method = RequestMethod.GET)
	public String registration(Model model) {
		model.addAttribute("userForm", new UserEntity());

		return "registration";
	}

	@RequestMapping(params = "backtologin", method = RequestMethod.POST)
	public String backToLogin(HttpServletRequest request) {
		return "redirect:/login";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String addUser(@ModelAttribute("userForm") UserEntity userForm, Model model) {
/*
		if (!userForm.getPassword().equals(userForm.getPasswordConfirm())) {
			model.addAttribute("passwordError", "Пароли не совпадают");
			return "registration";
		}
*/		
		if (!userService.saveUser(userForm)) {
			model.addAttribute("usernameError", "Пользователь с таким именем уже существует");
			return "registration";
		}

		return "redirect:/login";//To do
	}

}
