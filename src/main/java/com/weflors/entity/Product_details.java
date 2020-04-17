package com.weflors.entity;

import javax.persistence.*;


@Entity 		//указывает, что данный бин (класс) является сущностью.
@Table(name = "product_details", schema = "flowershop") 	//указывает на имя таблицы, которая будет отображаться в этой сущности.
public class Product_details {


	@Id
	@GeneratedValue
	@Column(name = "product_id", nullable = false)
	private Integer productID;

	@Column(name = "description", nullable = false)
	private String description;

	@Column(name = "height", nullable = false)
	private String height;

	@Column(name = "length", nullable = false)
	private String length;

	@Column(name = "width", nullable = false)
	private String width;

	@Column(name = "color", nullable = false)
	private String color;

	/*public Integer getProductID() {
		return productID;
	}

	public void setProductID(Integer productID) {
		this.productID = productID;
	}*/

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
}


