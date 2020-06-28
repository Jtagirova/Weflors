package com.weflors.util;

import java.sql.Timestamp;
import java.util.List;

public class SalesReportHelperBean {

    List<Integer> productIDs;

    Timestamp reportStartDatePeriod;

    Timestamp reportEndDatePeriod;

    public List<Integer> getProductIDs() {
        return productIDs;
    }

    public void setProductIDs(List<Integer> productIDs) {
        this.productIDs = productIDs;
    }

    public Timestamp getReportStartDatePeriod() {
        return reportStartDatePeriod;
    }

    public void setReportStartDatePeriod(Timestamp reportStartDatePeriod) {
        this.reportStartDatePeriod = reportStartDatePeriod;
    }

    public Timestamp getReportEndDatePeriod() {
        return reportEndDatePeriod;
    }

    public void setReportEndDatePeriod(Timestamp reportEndDatePeriod) {
        this.reportEndDatePeriod = reportEndDatePeriod;
    }

}
