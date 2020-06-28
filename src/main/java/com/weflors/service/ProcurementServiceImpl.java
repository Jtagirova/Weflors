package com.weflors.service;

import com.weflors.entity.ContragentsEntity;
import com.weflors.entity.ProcurementEntity;
import com.weflors.entity.ProductEntity;
import com.weflors.repository.ProcurementRepository;
import com.weflors.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
@Service
public class ProcurementServiceImpl {

    @Autowired
    private ProcurementRepository procurementRepository;

    public ProcurementEntity findProcurementByProductID(Integer productID) {
        return procurementRepository.findProcurementByProductID(productID);
    }

    public ProcurementEntity saveProcurement(ProcurementEntity procurementEntity){
        return procurementRepository.save(procurementEntity);
    }

    public List<ProcurementEntity> loadAllProcurements() {
        return procurementRepository.findAll();
    }

    public List<ProcurementEntity> findAllProcurementsByProductID(Integer productID) {
        return procurementRepository.findAllProcurementsByProductID(productID);
    }

    public List<ProcurementEntity> findAllProcurementsByDate(Timestamp date) {
        return procurementRepository.findAllProcurementsByDate(date);
    }

    public List<ProcurementEntity> findAllProcurementsByProductDate(Integer productId, Timestamp startDatePeriod, Timestamp endDatePeriod) {
        return procurementRepository.findAllProcurementsByProductIDAndDatePeriod(productId, startDatePeriod, endDatePeriod);
    }



}
