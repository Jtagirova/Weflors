package com.weflors.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weflors.entity.UserEntity;
import com.weflors.entity.UserRoleMapEntity;
import com.weflors.service.UserDetailsServiceImpl;


@Controller
@RequestMapping("/users")
public class UserRoleController {
	
	@Autowired
	private UserDetailsServiceImpl userDetailsServiceImpl;
	
	@GetMapping
    public String addUsersPage(Model model) {
		model.addAttribute("formName", "Справочник пользователей");
        return "users";
    }

	@GetMapping("/listUsers")
	@ResponseBody
	public List<UserEntity> addListOfUser() {
	    return userDetailsServiceImpl.getAllUsers();
	}

	@DeleteMapping("/deleteUser")
	@ResponseBody
	public String deleteUser(@RequestBody UserEntity userEntity) {
		userDetailsServiceImpl.deleteUser(userEntity.getUserId());
		return "Пользователь был удалена";
	}
	
	@PostMapping("/updateUser")
	@ResponseBody
	public String updateUserInfo(@RequestBody UserEntity userEntity) {
		if(!userDetailsServiceImpl.existUser(userEntity.getUserId())) {
			return "Такого пользователя нет в базе данных";
		}
		if(userEntity.getUserName().isEmpty() || userEntity.getUserLastname().isEmpty() ||
		   userEntity.geteMail().isEmpty() || userEntity.getPassword().isEmpty() || 
		   userEntity.getUserRoleMapsByUserId().isEmpty() || userEntity.getLogin().isEmpty()) {
			return "Поля Имя, Фамилия, Email, Логин, Пароль и Роль обязательна к заполнению";
		}
		if(userDetailsServiceImpl.updateUser(userEntity) == true) {;
			return "Данные пользователя обновлены в базе";
		}
		return "Проблема с обновлением данных пользователя в базе";
	}
	
}
