package com.weflors.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.sql.Timestamp;

public class SaleEntityPK implements Serializable {
    private int productId;
    private String articul;
    private Timestamp saleDate;

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

    @Column(name = "sale_date", nullable = false, insertable = false, updatable = false)
    @Id
    public Timestamp getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(Timestamp saleDate) {
        this.saleDate = saleDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SaleEntityPK that = (SaleEntityPK) o;

        if (productId != that.productId) return false;
        if (articul != null ? !articul.equals(that.articul) : that.articul != null) return false;
        if (saleDate != null ? !saleDate.equals(that.saleDate) : that.saleDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = productId;
        result = 31 * result + (articul != null ? articul.hashCode() : 0);
        result = 31 * result + (saleDate != null ? saleDate.hashCode() : 0);
        return result;
    }
}
