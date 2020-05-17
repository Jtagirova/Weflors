package com.weflors.service;

import com.weflors.entity.ClientEntity;
import com.weflors.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClientServiceImpl {

    @Autowired
    private ClientRepository clientRepository;

    public List<String> getAllClientsEmail(){
        List<String> allEmails = clientRepository.getAllClientEmail();
        return allEmails;
    }

    public List<ClientEntity> getAllClients(){
        List<ClientEntity> allClients = clientRepository.findAll();
        return allClients;
    }


    public ClientEntity getClientByEmail(String eMail){
        ClientEntity client = clientRepository.getClientByEmail(eMail);
        return client;
    }



    public Integer getClientDiscount(String email){
        return clientRepository.getDiscountByClientEmail(email);
    }



}
