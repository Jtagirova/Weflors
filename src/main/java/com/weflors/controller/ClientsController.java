package com.weflors.controller;


import com.weflors.entity.ClientEntity;
import com.weflors.entity.ContragentsEntity;
import com.weflors.service.ClientServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/clients")
public class ClientsController {

    @Autowired
    private ClientServiceImpl clientsServiceImpl;

    @GetMapping
    public String addClientPage(Model model) {
        model.addAttribute("formName", "Справочник Клиенты");
        return "clients";
    }

    @GetMapping("/listClients")
    @ResponseBody
    public List<ClientEntity> addListOfContragents() {
        return clientsServiceImpl.getAllClients();
    }

    @PostMapping("/addNewClient")
    @ResponseBody
    public String addNewClient(@RequestBody ClientEntity clientEntity) {
        if(clientEntity.geteMail().isEmpty()) {
            return "Поля E-Mail обязательны к заполнению";
        }
        if(clientsServiceImpl.existByClientEMail(clientEntity.geteMail()) != null) {
            return "Клиент с таким E-mail уже существует в БД";
        } else {
            clientsServiceImpl.saveNewClient(clientEntity);
            return "Новый клент добавлен";
        }
    }

    @DeleteMapping("/deleteClient")
    @ResponseBody
    public String deleteClient(@RequestBody ClientEntity clientEntity) {
        clientsServiceImpl.deleteClient(clientEntity.getClientId());
        return "Клиент был удален";
    }
}


