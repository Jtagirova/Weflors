package com.weflors.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.sql.Timestamp;

public class ProcurementEntityPK implements Serializable {
    private int productId;
    private String articul;
    private Timestamp procurementDate;

    @Column(name = "product_id", nullable = false, insertable = false, updatable = false)
    @Id
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Column(name = "articul", nullable = false, length = 50, insertable = false, updatable = false)
    @Id
    public String getArticul() {
        return articul;
    }

    public void setArticul(String articul) {
        this.articul = articul;
    }

    @Column(name = "procurement_date", nullable = false, insertable = false, updatable = false)
    @Id
    public Timestamp getProcurementDate() {
        return procurementDate;
    }

    public void setProcurementDate(Timestamp procurementDate) {
        this.procurementDate = procurementDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ProcurementEntityPK that = (ProcurementEntityPK) o;

        if (productId != that.productId) return false;
        if (articul != null ? !articul.equals(that.articul) : that.articul != null) return false;
        if (procurementDate != null ? !procurementDate.equals(that.procurementDate) : that.procurementDate != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = productId;
        result = 31 * result + (articul != null ? articul.hashCode() : 0);
        result = 31 * result + (procurementDate != null ? procurementDate.hashCode() : 0);
        return result;
    }
}
