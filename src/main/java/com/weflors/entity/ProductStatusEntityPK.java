package com.weflors.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.sql.Date;

public class ProductStatusEntityPK implements Serializable {
    private int productId;
    private Date validityDate;

    public ProductStatusEntityPK(int productId, Date validityDate) {
        this.productId = productId;
        this.validityDate = validityDate;
    }

    public ProductStatusEntityPK(){

    }

    @Column(name = "product_id", nullable = false, insertable = false, updatable = false)
    @Id
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Column(name = "validity_date", nullable = false, insertable = false, updatable = false)
    @Id
    public Date getValidityDate() {
        return validityDate;
    }

    public void setValidityDate(Date validityDate) {
        this.validityDate = validityDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ProductStatusEntityPK that = (ProductStatusEntityPK) o;

        if (productId != that.productId) return false;
        if (validityDate != null ? !validityDate.equals(that.validityDate) : that.validityDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = productId;
        result = 31 * result + (validityDate != null ? validityDate.hashCode() : 0);
        return result;
    }
}
