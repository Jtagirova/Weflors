package com.weflors.controller;

import com.weflors.entity.ClientEntity;
import com.weflors.service.ClientServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/clients")
public class ClientsController {
	
    private ClientServiceImpl clientsServiceImpl;

    @Autowired
    public ClientsController(ClientServiceImpl clientsServiceImpl) {
    	this.clientsServiceImpl = clientsServiceImpl;
    }

    @GetMapping
    public String addClientPage(Model model) {
        model.addAttribute("formName", "Справочник Клиенты");
        return "clients";
    }

    @GetMapping("/list")
    @ResponseBody
    public List<ClientEntity> findListOfContragents() {
        return clientsServiceImpl.findAllClients();
    }

    @PostMapping("/add")
    @ResponseBody
    public String addNewClient(@RequestBody ClientEntity clientEntity) {
        if(clientsServiceImpl.getClientByEmail(clientEntity.geteMail()) != null) {
            return "Клиент с таким E-mail уже существует в вашей базе данных";
        } else {
            clientsServiceImpl.saveClient(clientEntity);
            return "Новый клиент добавлен в вашу базу данных";
        }
    }
    
    @PostMapping("/update")
    @ResponseBody
    public String updateClient(@RequestBody ClientEntity clientEntity) {
    	clientsServiceImpl.updateClient(clientEntity);
        if(clientsServiceImpl.getClientByEmail(clientEntity.geteMail()) != null) {
            return "Информация о клиенте была обновлена в вашей базе данных";
        } else {
            return "Ошибка обновления данных клиента";
        }
    }

    @DeleteMapping("/delete")
    @ResponseBody
    public String deleteClient(@RequestBody Integer clientID) {
        clientsServiceImpl.deleteClient(clientID);
        return "Клиент был удален из вашей базы данных";
    }
}