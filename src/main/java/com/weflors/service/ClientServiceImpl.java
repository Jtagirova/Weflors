package com.weflors.service;

import com.weflors.entity.ClientEntity;
import com.weflors.repository.ClientRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClientServiceImpl {

    private ClientRepository clientRepository;
    
    public ClientServiceImpl(ClientRepository clientRepository) {
    	this.clientRepository = clientRepository;
    }

    public List<String> getAllClientsEmail(){
        return clientRepository.getAllClientEmail();
    }

    public List<ClientEntity> getAllClients(){
        return clientRepository.findAll();
    }

    public ClientEntity getClientByEmail(String eMail){
        return clientRepository.getClientByEmail(eMail);
    }

    public ClientEntity saveNewClient(ClientEntity clientEntity)  {
        return clientRepository.save(clientEntity);
    }

    public Integer getClientDiscount(String email){
        return clientRepository.getDiscountByClientEmail(email);
    }

    public void deleteClient(Integer clientId) {
        clientRepository.deleteByClientId(clientId);
    }
    
    public void updateClientInfo(ClientEntity clientEntity) {
        clientRepository.updateClientById(clientEntity.getClientName(), clientEntity.getClientSurname(), clientEntity.getDateOfBirth(),
        		clientEntity.geteMail(), clientEntity.getPhone(), clientEntity.getDiscount(), clientEntity.getAddress(),
        		clientEntity.getZipCode(), clientEntity.getClientId());
    }

}