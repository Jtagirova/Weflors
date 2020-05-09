package com.weflors.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Timestamp;

@Entity
@Table(name = "sale", schema = "flowershop", catalog = "postgres")
public class SaleEntity {
    private int productId;
    private String articul;
    private BigDecimal salePrice;
    private Timestamp saleDate;
    private int quantity;
    private String details;
    private BigDecimal productPrice;
    private ProductEntity productByProductId;
    private ClientEntity clientByClientId;

    public SaleEntity() {
    }

    @Id
    @Column(name = "product_id", nullable = false)
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Basic
    @Column(name = "articul", nullable = false, length = 50)
    public String getArticul() {
        return articul;
    }

    public void setArticul(String articul) {
        this.articul = articul;
    }

    @Basic
    @Column(name = "sale_price", nullable = false, precision = 2)
    public BigDecimal getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(BigDecimal salePrice) {
        this.salePrice = salePrice;
    }

    @Basic
    @Column(name = "sale_date", nullable = false)
    public Timestamp getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(Timestamp saleDate) {
        this.saleDate = saleDate;
    }

    @Basic
    @Column(name = "quantity", nullable = false)
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Basic
    @Column(name = "details", nullable = true, length = 300)
    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    @Basic
    @Column(name = "product_price", nullable = true, precision = 2)
    public BigDecimal getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(BigDecimal productPrice) {
        this.productPrice = productPrice;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SaleEntity that = (SaleEntity) o;

        if (productId != that.productId) return false;
        if (quantity != that.quantity) return false;
        if (articul != null ? !articul.equals(that.articul) : that.articul != null) return false;
        if (salePrice != null ? !salePrice.equals(that.salePrice) : that.salePrice != null) return false;
        if (saleDate != null ? !saleDate.equals(that.saleDate) : that.saleDate != null) return false;
        if (details != null ? !details.equals(that.details) : that.details != null) return false;
        if (productPrice != null ? !productPrice.equals(that.productPrice) : that.productPrice != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = productId;
        result = 31 * result + (articul != null ? articul.hashCode() : 0);
        result = 31 * result + (salePrice != null ? salePrice.hashCode() : 0);
        result = 31 * result + (saleDate != null ? saleDate.hashCode() : 0);
        result = 31 * result + quantity;
        result = 31 * result + (details != null ? details.hashCode() : 0);
        result = 31 * result + (productPrice != null ? productPrice.hashCode() : 0);
        return result;
    }

    @OneToOne
    @JsonBackReference
    @JoinColumn(name = "product_id", referencedColumnName = "product_id", nullable = false)
    public ProductEntity getProductByProductId() {
        return productByProductId;
    }

    public void setProductByProductId(ProductEntity productByProductId) {
        this.productByProductId = productByProductId;
    }
    @ManyToOne
    @JoinColumn(name = "client_id", referencedColumnName = "client_id")
    public ClientEntity getClientByClientId() {
        return clientByClientId;
    }

    public void setClientByClientId(ClientEntity clientByClientId) {
        this.clientByClientId = clientByClientId;
    }

}
