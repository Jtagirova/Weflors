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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weflors.entity.ContragentsEntity;
import com.weflors.service.ContragentsServiceImpl;


@Controller
@RequestMapping("/addcontragent")
public class AddContragentController {
	
	@Autowired
	private ContragentsServiceImpl contragentsServiceImpl;
		
	@GetMapping
    public String addContragentPage(Model model) {
		model.addAttribute("formName", "Справочник поставщиков");
        return "addcontragent";
    }
	
	@GetMapping("/listContragents")
	@ResponseBody
	public List<ContragentsEntity> addListOfContragents() {
		List<ContragentsEntity> listContragents = contragentsServiceImpl.loadContragents();
	    return listContragents;
	}
	
	@PostMapping("/addNewContagent")
	@ResponseBody
	public String addNewContagent(@RequestBody ContragentsEntity contragentsEntity) {
		
		if(contragentsEntity.getContragentName().isEmpty() || contragentsEntity.getInn().isEmpty() || contragentsEntity.getUnk().isEmpty()) {
			return "Поля Наименования поставщика, ИНН и УНК обязательны к заполнению";
		}
		if(contragentsServiceImpl.existByContragentName(contragentsEntity.getContragentName()) != null) {
			return "Поставщик с таким именем уже существует в БД";
		} else {
			contragentsServiceImpl.saveNewContagent(contragentsEntity);
			return "Новый поставщик добвлен";
		}
	}	
	
	@DeleteMapping("/deleteContragent")
	@ResponseBody
	public String seleteContragents(@RequestParam Integer contragentId) {
		String deleteText = "Поставщик " + " был удален из базы";
		
	    return deleteText;
	}
	
}
