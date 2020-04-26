package com.weflors.entity;

import javax.persistence.*;

@Entity
@Table(name = "product_status", schema = "flowershop", catalog = "postgres")
public class ProductStatusEntity {
    private int productId;
    private String articul;
    private int quantityWarehouse;
    private int quantityShop;
    private int totalQuantity;
    private ProductEntity productByProductId;

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
    @Column(name = "quantity_warehouse", nullable = false)
    public int getQuantityWarehouse() {
        return quantityWarehouse;
    }

    public void setQuantityWarehouse(int quantityWarehouse) {
        this.quantityWarehouse = quantityWarehouse;
    }

    @Basic
    @Column(name = "quantity_shop", nullable = false)
    public int getQuantityShop() {
        return quantityShop;
    }

    public void setQuantityShop(int quantityShop) {
        this.quantityShop = quantityShop;
    }

    @Basic
    @Column(name = "total_quantity", nullable = false)
    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ProductStatusEntity that = (ProductStatusEntity) o;

        if (productId != that.productId) return false;
        if (quantityWarehouse != that.quantityWarehouse) return false;
        if (quantityShop != that.quantityShop) return false;
        if (totalQuantity != that.totalQuantity) return false;
        if (articul != null ? !articul.equals(that.articul) : that.articul != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = productId;
        result = 31 * result + (articul != null ? articul.hashCode() : 0);
        result = 31 * result + quantityWarehouse;
        result = 31 * result + quantityShop;
        result = 31 * result + totalQuantity;
        return result;
    }

    @OneToOne
    @JoinColumn(name = "product_id", referencedColumnName = "product_id", nullable = false)
    public ProductEntity getProductByProductId() {
        return productByProductId;
    }

    public void setProductByProductId(ProductEntity productByProductId) {
        this.productByProductId = productByProductId;
    }
}
