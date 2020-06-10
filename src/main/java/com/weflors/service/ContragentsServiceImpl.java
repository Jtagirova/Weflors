package com.weflors.service;

import com.weflors.entity.ContragentsEntity;
import com.weflors.repository.ContragentsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContragentsServiceImpl {

    @Autowired
    private ContragentsRepository contragentsRepository;

    public List<ContragentsEntity> loadContragents() {
        return contragentsRepository.findAll();
    }

    public ContragentsEntity loadContragentByContragentID(Integer contragentId)  {
        return contragentsRepository.findByContragentID(contragentId);
    }
    
    public ContragentsEntity saveNewContragent(ContragentsEntity contragentsEntity)  {
        return contragentsRepository.save(contragentsEntity);
    }
    
    public Boolean existByContragentName(String contragentName) {
    	Boolean exist = contragentsRepository.existByName(contragentName);
    	return exist;
    }
    
    public void deleteContragent(Integer contragentId) {
    	contragentsRepository.deleteByContragentId(contragentId);
    }
    
    public void updateContragentInfo(ContragentsEntity contragentsEntity) {
    	contragentsRepository.updateContragentById(contragentsEntity.getAddress(), contragentsEntity.getContragentName(), contragentsEntity.getPhone1(),
    			contragentsEntity.getPhone2(), contragentsEntity.getUnk(), contragentsEntity.getInn(),contragentsEntity.getZipCode(), contragentsEntity.getContragentId());
    }
}
