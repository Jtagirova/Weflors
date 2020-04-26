package com.weflors.service;

import com.weflors.entity.ContragentsEntity;
import com.weflors.repository.ContragentsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.ArrayList;
import java.util.List;
@Service
public class ContragentsServiceImpl {

    @Autowired
    private ContragentsRepository contragentsRepository;

    public List<ContragentsEntity> loadContragents() {
       // contragentsRepository.findByContragentID(1);
        List<ContragentsEntity> contragents = contragentsRepository.findAll();
        return contragents;
    }

    public ContragentsEntity loadContragentByContragentID(Integer contragentId)  {
        ContragentsEntity contragent = contragentsRepository.findByContragentID(contragentId);
        return contragent;
    }
}
