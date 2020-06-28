package com.weflors.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	@Autowired
	private UserDetailsServiceImpl userDetailsServiceImpl;
	
	@GetMapping
    public String addUsersPage(Model model) {
		model.addAttribute("formName", "Справочник Пользователи");
        return "users";
    }

	@GetMapping("/listUsers")
	@ResponseBody
	public List<UserEntity> addListOfUser() {
		List<UserEntity> list = userDetailsServiceImpl.getAllUsers();
	    return list;
	}
	
	@PostMapping("/saveUser")
	@ResponseBody
	public String saveUser(@RequestBody UserEntity userEntity) {
		if(userDetailsServiceImpl.saveUser(userEntity)) {;
			return "Новый пользователь добавлен в вашу базу данных";
		} else {
			return "Ошибка добавления нового пользователя";
		}
	}
	
	@PostMapping("/updateUser")
	@ResponseBody
	public String updateUserInfo(@RequestBody UserEntity userEntity) {
		userDetailsServiceImpl.updateUser(userEntity);
		if(userDetailsServiceImpl.loadUserByUsername(userEntity.getLogin()) == userEntity ) {
			return "Данные пользователя обновлены в вашей базе данных";
		} else {
			return "Проблема с обновлением данных пользователя в базе данных";
		}
	}

	@DeleteMapping("/deleteUser")
	@ResponseBody
	public String deleteUser(@RequestBody UserEntity userEntity) {
		userDetailsServiceImpl.deleteUser(userEntity.getUserId());
		return "Пользователь был удален из вашей базы данных";
	}
	
}