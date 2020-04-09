package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity 		//указывает, что данный бин (класс) является сущностью.
@Table(name = "user_role_map") 	//указывает на имя таблицы, которая будет отображаться в этой сущности.
public class UserRoleMap {
	
	@Column(name = "user_Id", nullable = false)
	private Integer userID;
	
	@Column(name = "role_id", nullable = false)
	private Integer roleID;

}
