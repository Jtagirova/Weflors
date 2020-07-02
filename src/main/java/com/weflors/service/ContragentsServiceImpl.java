package com.weflors.service;

import com.weflors.entity.ContragentsEntity;
import com.weflors.repository.ContragentsRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ContragentsServiceImpl {

    private ContragentsRepository contragentsRepository;
    
    public ContragentsServiceImpl(ContragentsRepository contragentsRepository) {
    	this.contragentsRepository = contragentsRepository;
    }
    
    public List<ContragentsEntity> loadContragents() {
        return contragentsRepository.findAll();
    }

    public ContragentsEntity loadContragentByContragentID(Integer contragentId)  {
        return contragentsRepository.findByContragentID(contragentId);
    }
    
    public ContragentsEntity saveNewContragent(ContragentsEntity contragentsEntity)  {
        return contragentsRepository.save(contragentsEntity);
    }
    
    public Optional<ContragentsEntity> findByName(String contragentName) {
    	return contragentsRepository.findByContragentName(contragentName);
    }
    
    public void deleteContragent(Integer contragentId) {
    	contragentsRepository.deleteByContragentId(contragentId);
    }
    
    public void updateContragentInfo(ContragentsEntity contragentsEntity) {
    	contragentsRepository.updateContragentById(contragentsEntity.getAddress(), contragentsEntity.getContragentName(), contragentsEntity.getPhone1(),
    			contragentsEntity.getPhone2(), contragentsEntity.getUnk(), contragentsEntity.getInn(),contragentsEntity.getZipCode(), contragentsEntity.getContragentId());
    }
}
