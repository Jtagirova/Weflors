package com.weflors.entity;

import javax.persistence.*;


@Entity 		//указывает, что данный бин (класс) является сущностью.
@Table(name = "product", schema = "flowershop") 	//указывает на имя таблицы, которая будет отображаться в этой сущности.
public class Product {
	
	
	@Id
    @GeneratedValue
    @Column(name = "product_id", nullable = false)
	private Integer productID;

	@OneToOne(mappedBy = "product")
	private ProductDetails productDetails;

	@Column(name = "product_name", nullable = false)
    private String productName;
	
	@Column(name = "product_type", nullable = false)
    private String productType;
	
	@Column(name = "articul", nullable = false)
    private String articul;

	@Column(name = "picture_url", nullable = false)
	private String pictureUrl;

	@Column(name = "contragent_id", nullable = false)
	private Integer contragentID;

	public Product() {
	}

	public Integer getProductID() {	return productID;}

	public void setProductID(Integer productID) { this.productID = productID;	}

	public String getProductName() { return productName;	}

	public void setProductName(String productName) { this.productName = productName;	}

	public String getProductType() { return productType;	}

	public void setProductType(String productType) { this.productType = productType;	}

	public String getArticul() { return articul;	}

	public void setArticul(String articul) { this.articul = articul;	}

	public String getPictureUrl() { return pictureUrl;	}

	public void setPictureUrl(String pictureUrl) { this.pictureUrl = pictureUrl;	}

	public Integer getContragentID() {	return contragentID;}

	public void setContragentID(Integer contragentID) { this.contragentID = contragentID;	}
}
