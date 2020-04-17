package com.weflors.entity;

import javax.persistence.*;


@Entity 		//указывает, что данный бин (класс) является сущностью.
@Table(name = "procurement", schema = "flowershop") 	//указывает на имя таблицы, которая будет отображаться в этой сущности.
public class Procurement {


	@Id
	@GeneratedValue
	@Column(name = "product_id", nullable = false)
	private Integer productID;

	@Column(name = "articul", nullable = false)
	private Integer articul;

	@Column(name = "procurement_price", nullable = false)
	private String procurementPrice;

	@Column(name = "procurement_date", nullable = false)
	private String procurementDate;

	@Column(name = "quantity", nullable = false)
	private String quantity;

	@Column(name = "procurement_details", nullable = false)
	private String procurementDetails;

	/*public Integer getProductID() {
		return productID;
	}

	public void setProductID(Integer productID) {
		this.productID = productID;
	}*/

	public Integer getArticul() {
		return articul;
	}

	public void setArticul(Integer articul) {
		this.articul = articul;
	}

	public String getProcurementPrice() {
		return procurementPrice;
	}

	public void setProcurementPrice(String procurementPrice) {
		this.procurementPrice = procurementPrice;
	}

	public String getProcurementDate() {
		return procurementDate;
	}

	public void setProcurementDate(String procurementDate) {
		this.procurementDate = procurementDate;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getProcurementDetails() {
		return procurementDetails;
	}

	public void setProcurementDetails(String procurementDetails) {
		this.procurementDetails = procurementDetails;
	}
}


