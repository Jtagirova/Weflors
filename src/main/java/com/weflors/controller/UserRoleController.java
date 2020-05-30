package com.weflors.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.weflors.entity.UserEntity;
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

/*	
	@GetMapping("/listUsers")
	@ResponseBody
	public List<UserEntity> addListOfUser() {
		List<UserEntity> listUsers = userDetailsServiceImpl.getAllUsers();
	    return listUsers;
	}
*/
	
	
	
	
/*	
	@PostMapping("/addNewUser")
	@ResponseBody
	public String addNewProductType(@RequestBody ProductTypesEntity productTypesEntity) {
		if(productTypesEntity.getProductTypeName().isEmpty()) {
			return "Поле Категория товара обязательна к заполнению";
		}
		if(productTypeService.existByProductName(productTypesEntity.getProductTypeName())  != null) { 
			return "Категория товара с таким именем уже существует в БД";
		} else {
			productTypeService.saveNewProductType(productTypesEntity);
			return "Новая категория товара добавлена";
		}
	}
	
	@DeleteMapping("/deleteUser")
	@ResponseBody
	public String deleteProductType(@RequestBody ProductTypesEntity productTypesEntity) {
		productTypeService.deleteProductType(productTypesEntity.getProductTypeId());
		return "Категория товара была удалена";
	}
	*/
	
}
