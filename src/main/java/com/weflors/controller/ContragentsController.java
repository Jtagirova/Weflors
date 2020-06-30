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

import com.weflors.entity.ContragentsEntity;
import com.weflors.service.ContragentsServiceImpl;


@Controller
@RequestMapping("/contragents")
public class ContragentsController {
	
	@Autowired
	private ContragentsServiceImpl contragentsServiceImpl;
		
	@GetMapping
    public String addContragentPage(Model model) {
		model.addAttribute("formName", "Справочник Поставщики");
        return "contragents";
    }
	
	@GetMapping("/listContragents")
	@ResponseBody
	public List<ContragentsEntity> addListOfContragents() {
	    return contragentsServiceImpl.loadContragents();
	}
	
	@PostMapping(path = "/addNewContragent")
	@ResponseBody
	public String addNewContragent(@RequestBody ContragentsEntity contragentsEntity) {
		if(contragentsServiceImpl.existByContragentName(contragentsEntity.getContragentName()) != null) {
			return "Поставщик с таким именем уже существует в вашей базе данных";			
		} 
		contragentsServiceImpl.saveNewContragent(contragentsEntity);
		return "Новый поставщик добавлен в вашу базу данных";
	}	
	
	@PostMapping("/updateContragent")
	@ResponseBody
	public String updateContragent(@RequestBody ContragentsEntity contragentsEntity) {
		contragentsServiceImpl.updateContragentInfo(contragentsEntity);
		if(contragentsServiceImpl.loadContragentByContragentID(contragentsEntity.getContragentId()).equals(contragentsEntity)) {
			return "Данные о поставщике обновлены в вашей базе данных";
		} else {
			return "Ошибка обновления данных о поставщике";
		}		
	}
	
	@DeleteMapping("/deleteContragent")
	@ResponseBody
	public String deleteContragent(@RequestBody ContragentsEntity contragentsEntity) {
		contragentsServiceImpl.deleteContragent(contragentsEntity.getContragentId());
		return "Поставщик был удален из вашей базы данных";
	}
	
}
