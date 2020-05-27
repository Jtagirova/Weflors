package com.weflors.service;

import com.weflors.entity.ProcurementEntity;
import com.weflors.entity.ProductEntity;
import com.weflors.repository.ProcurementRepository;
import com.weflors.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProcurementServiceImpl {

    @Autowired
    private ProcurementRepository procurementRepository;

    public ProcurementEntity findByProcurementProductID(Integer productID) {
        return procurementRepository.findByProcurementProductID(productID);
    }

    public ProcurementEntity saveProcurement(ProcurementEntity procurementEntity){
        return procurementRepository.save(procurementEntity);
    }


}
