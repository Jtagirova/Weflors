package com.weflors.entity;

import javax.persistence.*;

@Entity
@Table(name = "product", schema = "flowershop", catalog = "postgres")
public class ProductEntity {
    private int productId;
    private String productName;
    private String productType;
    private String articul;
    private String pictureUrl;
    private String originOfProduct;
    private ProcurementEntity procurementByProductId;
    private ContragentsEntity contragentsByContragentId;
    private ProductDetailsEntity productDetailsByProductId;
    private ProductStatusEntity productStatusByProductId;
    private SaleEntity saleByProductId;

    @Id
    @Column(name = "product_id", nullable = false)
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Basic
    @Column(name = "product_name", nullable = false, length = 50)
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    @Basic
    @Column(name = "product_type", nullable = false, length = 50)
    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
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
    @Column(name = "picture_url", nullable = true, length = 100)
    public String getPictureUrl() {
        return pictureUrl;
    }

    public void setPictureUrl(String pictureUrl) {
        this.pictureUrl = pictureUrl;
    }

    @Basic
    @Column(name = "origin_of_product", nullable = true, length = 50)
    public String getOriginOfProduct() {
        return originOfProduct;
    }

    public void setOriginOfProduct(String originOfProduct) {
        this.originOfProduct = originOfProduct;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ProductEntity that = (ProductEntity) o;

        if (productId != that.productId) return false;
        if (productName != null ? !productName.equals(that.productName) : that.productName != null) return false;
        if (productType != null ? !productType.equals(that.productType) : that.productType != null) return false;
        if (articul != null ? !articul.equals(that.articul) : that.articul != null) return false;
        if (pictureUrl != null ? !pictureUrl.equals(that.pictureUrl) : that.pictureUrl != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = productId;
        result = 31 * result + (productName != null ? productName.hashCode() : 0);
        result = 31 * result + (productType != null ? productType.hashCode() : 0);
        result = 31 * result + (articul != null ? articul.hashCode() : 0);
        result = 31 * result + (pictureUrl != null ? pictureUrl.hashCode() : 0);
        return result;
    }

    @OneToOne(mappedBy = "productByProductId")
    public ProcurementEntity getProcurementByProductId() {
        return procurementByProductId;
    }

    public void setProcurementByProductId(ProcurementEntity procurementByProductId) {
        this.procurementByProductId = procurementByProductId;
    }

    @ManyToOne
    @JoinColumn(name = "contragent_id", referencedColumnName = "contragent_id")
    public ContragentsEntity getContragentsByContragentId() {
        return contragentsByContragentId;
    }

    public void setContragentsByContragentId(ContragentsEntity contragentsByContragentId) {
        this.contragentsByContragentId = contragentsByContragentId;
    }

    @OneToOne(mappedBy = "productByProductId")
    public ProductDetailsEntity getProductDetailsByProductId() {
        return productDetailsByProductId;
    }

    public void setProductDetailsByProductId(ProductDetailsEntity productDetailsByProductId) {
        this.productDetailsByProductId = productDetailsByProductId;
    }

    @OneToOne(mappedBy = "productByProductId")
    public ProductStatusEntity getProductStatusByProductId() {
        return productStatusByProductId;
    }

    public void setProductStatusByProductId(ProductStatusEntity productStatusByProductId) {
        this.productStatusByProductId = productStatusByProductId;
    }

    @OneToOne(mappedBy = "productByProductId")
    public SaleEntity getSaleByProductId() {
        return saleByProductId;
    }

    public void setSaleByProductId(SaleEntity saleByProductId) {
        this.saleByProductId = saleByProductId;
    }
}
