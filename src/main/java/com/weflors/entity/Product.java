package com.weflors.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity 		//указывает, что данный бин (класс) является сущностью.
@Table(name = "product", schema = "flowershop") 	//указывает на имя таблицы, которая будет отображаться в этой сущности.
public class Product {
	
	
	@Id
    @GeneratedValue
    @Column(name = "product_id", nullable = false)
	private Integer productID;
	
	@Column(name = "product_name", nullable = false)
    private String product_name;
	
	@Column(name = "product_type", nullable = false)
    private String product_type;
	
	@Column(name = "articul", nullable = false)
    private String articul;

	@Column(name = "picture_url", nullable = false)
	private String pictureUrl;


	/*public Integer getProductID() {	return productID;	}

	public void setProductID(Integer productID) { this.productID = productID;	}*/

	public String getProduct_name() { return product_name;	}

	public void setProduct_name(String product_name) { this.product_name = product_name;	}

	public String getProduct_type() { return product_type;	}

	public void setProduct_type(String product_type) { this.product_type = product_type;	}

	public String getArticul() { return articul;	}

	public void setArticul(String articul) { this.articul = articul;	}

	public String getPicture_url() { return pictureUrl;	}

	public void setPicture_url(String picture_url) { this.pictureUrl = picture_url;	}
}
