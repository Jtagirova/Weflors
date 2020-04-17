package com.weflors.entity;

import javax.persistence.*;


@Entity 		//указывает, что данный бин (класс) является сущностью.
@Table(name = "product_status", schema = "flowershop") 	//указывает на имя таблицы, которая будет отображаться в этой сущности.
public class Product_status {


	@Id
	@GeneratedValue
	@Column(name = "product_id", nullable = false)
	private Integer productID;

	@Column(name = "articul", nullable = false)
	private Integer articul;

	@Column(name = "quantity_warehouse", nullable = false)
	private String quantityWarehouse;

	@Column(name = "quantity_shop", nullable = false)
	private String quantityShop;

	@Column(name = "total_quantity", nullable = false)
	private String totalQuantity;

	public Integer getArticul() { return articul;	}

	public void setArticul(Integer articul) { this.articul = articul;	}

	public String getQuantityWarehouse() {
		return quantityWarehouse;
	}

	public void setQuantityWarehouse(String quantityWarehouse) {
		this.quantityWarehouse = quantityWarehouse;
	}

	public String getQuantityShop() {
		return quantityShop;
	}

	public void setQuantityShop(String quantityShop) {
		this.quantityShop = quantityShop;
	}

	public String getQuantityTotal() {
		return totalQuantity;
	}

	public void setQuantityTotal(String quantityTotal) {
		this.totalQuantity = quantityTotal;
	}
}


