package com.weflors.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weflors.entity.UserEntity;
import com.weflors.service.UserDetailsServiceImpl;

@Controller
@RequestMapping("/users")
public class UserRoleController {
	
	private UserDetailsServiceImpl userDetailsServiceImpl;
	
	public UserRoleController(UserDetailsServiceImpl userDetailsServiceImpl) {
		this.userDetailsServiceImpl = userDetailsServiceImpl;
	}
	
	@GetMapping
    public String addUsersPage(Model model) {
		model.addAttribute("formName", "Справочник Пользователи");
        return "users";
    }

	@GetMapping("/list")
	@ResponseBody
	public List<UserEntity> getListOfUsers() {
	    return userDetailsServiceImpl.findAllUsers();
	}
	
	@PostMapping("/add")
	@ResponseBody
	public String addUser(@RequestBody UserEntity userEntity) {
		if(userDetailsServiceImpl.findUserByLoginAndEmail(userEntity).isPresent()){
			return "Пользователь с таким Логин и EMail существует в вашей базе данных";
		} else {
			userDetailsServiceImpl.saveUser(userEntity);
			return "Новый пользователь добавлен в вашу базу данных";
		}
	}
	
	@PostMapping("/update")
	@ResponseBody
	public String updateUser(@RequestBody UserEntity userEntity) {
		userDetailsServiceImpl.updateUser(userEntity);
		if(userDetailsServiceImpl.findUserByLoginAndEmail(userEntity).get().getLogin().equals(userEntity.getLogin())  && 
			userDetailsServiceImpl.findUserByLoginAndEmail(userEntity).get().geteMail().equals(userEntity.geteMail())) {
			return "Данные пользователя обновлены в вашей базе данных";
		} else {
			return "Проблема с обновлением данных пользователя в базе данных";
		}
	}

	@DeleteMapping("/delete")
	@ResponseBody
	public String deleteUser(@RequestBody UserEntity userEntity) {
		userDetailsServiceImpl.deleteUser(userEntity);
		return "Пользователь был удален из вашей базы данных";
	}
	
}