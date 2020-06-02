package com.weflors.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Collection;

@Entity
@Table(name = "product", schema = "flowershop", catalog = "postgres")
public class ProductEntity {
	
//	@JsonProperty("myProductId")
    private int productId;
    private String productName;
    private String articul;
    private String pictureUrl;
//    private Integer contragentId;
    private String originOfProduct;
    private String invoiceNumber;
    private BigDecimal productPrice;
//    private int productTypeId;
    private Collection<ProcurementEntity> procurementsByProductId;
    private ContragentsEntity contragentsByContragentId;
    private ProductTypesEntity productTypesByProductTypeId;
    private ProductDetailsEntity productDetailsByProductId;
    private Collection<ProductStatusEntity> productStatusByProductId;
    private Collection<SaleEntity> salesByProductId;
   // private SaleEntity saleByProductId;

//    @Autowired
//    ContragentsRepository contragentsRepository;
//
//    public ProductEntity(String productName, String productType, String articul, String pictureUrl, String originOfProduct, Collection<ProcurementEntity> procurementsByProductId, Integer contragentsByContragentId, ProductDetailsEntity productDetailsByProductId, ProductStatusEntity productStatusByProductId, Collection<SaleEntity> salesByProductId) {
//        this.productName = productName;
//        this.productType = productType;
//        this.articul = articul;
//        this.pictureUrl = pictureUrl;
//        this.originOfProduct = originOfProduct;
//        this.procurementsByProductId = procurementsByProductId;
//        this.contragentsByContragentId = contragentsRepository.findByContragentID(contragentsByContragentId);
//        this.productDetailsByProductId = productDetailsByProductId;
//        this.productStatusByProductId = productStatusByProductId;
//        this.salesByProductId = salesByProductId;
//    }

    public ProductEntity() {
    }
 
    
/*
    public ProductEntity(int productId, String productName, String articul,  BigDecimal productPrice, 
    	Collection<ProcurementEntity> procurementsByProductId,
		ContragentsEntity contragentsByContragentId, ProductTypesEntity productTypesByProductTypeId,
		ProductDetailsEntity productDetailsByProductId, Collection<ProductStatusEntity> productStatusByProductId,
		Collection<SaleEntity> salesByProductId) {
		this.productId = productId;
		this.productName = productName;
		this.articul = articul;
		this.productPrice = productPrice;
		this.procurementsByProductId = procurementsByProductId;
		this.contragentsByContragentId = contragentsByContragentId;
		this.productTypesByProductTypeId = productTypesByProductTypeId;
		this.productDetailsByProductId = productDetailsByProductId;
		this.productStatusByProductId = productStatusByProductId;
		this.salesByProductId = salesByProductId;
    }
*/
	@Id
   // @SequenceGenerator(name = "hibernateSeq", sequenceName = "HIBERNATE_SEQUENCE")
    @GeneratedValue( strategy = GenerationType.AUTO)//, generator = "hibernateSeq")
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id", unique=true, nullable = false)
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

//    @Basic
//    @Column(name = "contragent_id", nullable = true)
//    public Integer getContragentId() {
//        return contragentId;
//    }
//
//    public void setContragentId(Integer contragentId) {
//        this.contragentId = contragentId;
//    }

    @Basic
    @Column(name = "origin_of_product", nullable = true, length = 50)
    public String getOriginOfProduct() {
        return originOfProduct;
    }

    public void setOriginOfProduct(String originOfProduct) {
        this.originOfProduct = originOfProduct;
    }

    @Basic
    @Column(name = "invoice_number", nullable = false, length = 30)
    public String getInvoiceNumber() {
        return invoiceNumber;
    }

    public void setInvoiceNumber(String invoiceNumber) {
        this.invoiceNumber = invoiceNumber;
    }

    @Basic
    @Column(name = "product_price", nullable = false, precision = 2)
    public BigDecimal getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(BigDecimal productPrice) {
        this.productPrice = productPrice;
    }

//    @Basic
//    @Column(name = "product_type_id", nullable = false)
//    public int getProductTypeId() {
//        return productTypeId;
//    }
//
//    public void setProductTypeId(int productTypeId) {
//        this.productTypeId = productTypeId;
//    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ProductEntity that = (ProductEntity) o;

        if (productId != that.productId) return false;
        //if (productTypeId != that.productTypeId) return false;
        if (productName != null ? !productName.equals(that.productName) : that.productName != null) return false;
        if (articul != null ? !articul.equals(that.articul) : that.articul != null) return false;
        if (pictureUrl != null ? !pictureUrl.equals(that.pictureUrl) : that.pictureUrl != null) return false;
       // if (contragentId != null ? !contragentId.equals(that.contragentId) : that.contragentId != null) return false;
        if (originOfProduct != null ? !originOfProduct.equals(that.originOfProduct) : that.originOfProduct != null)
            return false;
        if (invoiceNumber != null ? !invoiceNumber.equals(that.invoiceNumber) : that.invoiceNumber != null)
            return false;
        if (productPrice != null ? !productPrice.equals(that.productPrice) : that.productPrice != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = productId;
        result = 31 * result + (productName != null ? productName.hashCode() : 0);
        result = 31 * result + (articul != null ? articul.hashCode() : 0);
        result = 31 * result + (pictureUrl != null ? pictureUrl.hashCode() : 0);
       // result = 31 * result + (contragentId != null ? contragentId.hashCode() : 0);
        result = 31 * result + (originOfProduct != null ? originOfProduct.hashCode() : 0);
        result = 31 * result + (invoiceNumber != null ? invoiceNumber.hashCode() : 0);
        result = 31 * result + (productPrice != null ? productPrice.hashCode() : 0);
       // result = 31 * result + productTypeId;
        return result;
    }

//    @OneToOne(mappedBy = "productByProductId")
//    @JsonManagedReference(value = "product-procurement")
//    //@Column(insertable=false, updatable=false)
//    public ProcurementEntity getProcurementByProductId() {
//        return procurementByProductId;
//    }
//
//    public void setProcurementByProductId(ProcurementEntity procurementByProductId) {
//        this.procurementByProductId = procurementByProductId;
//    }

    @OneToMany(mappedBy = "productByProductId", orphanRemoval = true)
    @JsonManagedReference(value = "product-procurement")
    //@Column(insertable=false, updatable=false)
    public Collection<ProcurementEntity> getProcurementsByProductId() {
        return procurementsByProductId;
    }

    public void setProcurementsByProductId(Collection<ProcurementEntity> procurementsByContragentId) {
        this.procurementsByProductId = procurementsByContragentId;
    }

    @ManyToOne
    @JsonBackReference(value = "contragents-product")
    @JoinColumn(name = "contragent_id", referencedColumnName = "contragent_id")
    public ContragentsEntity getContragentsByContragentId() {
        return contragentsByContragentId;
    }

    public void setContragentsByContragentId(ContragentsEntity contragentsByContragentId) {
        this.contragentsByContragentId = contragentsByContragentId;
    }

    @ManyToOne
    @JsonBackReference(value = "product_types-product")
    @JoinColumn(name = "product_type_id", referencedColumnName = "product_type_id", nullable = false)
    public ProductTypesEntity getProductTypesByProductTypeId() {
        return productTypesByProductTypeId;
    }

    public void setProductTypesByProductTypeId(ProductTypesEntity productTypesByProductTypeId) {
        this.productTypesByProductTypeId = productTypesByProductTypeId;
    }

    @OneToOne(mappedBy = "productByProductId" , orphanRemoval = true)
    @JsonManagedReference(value = "product-product_details")
   //@Column(insertable=false, updatable=false)
    public ProductDetailsEntity getProductDetailsByProductId() {
        return productDetailsByProductId;
    }

    public void setProductDetailsByProductId(ProductDetailsEntity productDetailsByProductId) {
        this.productDetailsByProductId = productDetailsByProductId;
    }

    @OneToMany(mappedBy = "productByProductId", fetch = FetchType.EAGER)
    @JsonManagedReference(value = "product-product_status")
   // @Column(insertable=false, updatable=false)
    public Collection<ProductStatusEntity> getProductStatusByProductId() {
        return productStatusByProductId;
    }

    public void setProductStatusByProductId(Collection<ProductStatusEntity> productStatusByProductId) {
        this.productStatusByProductId = productStatusByProductId;
    }

    @OneToMany(mappedBy = "productByProductId")
    @JsonManagedReference(value = "product-sale")
    public Collection<SaleEntity> getSalesByProductId() {
        return salesByProductId;
    }

    public void setSalesByProductId(Collection<SaleEntity> salesByProductId) {
        this.salesByProductId = salesByProductId;
    }
}
