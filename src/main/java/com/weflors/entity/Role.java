package com.weflors.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity 		//указывает, что данный бин (класс) является сущностью.
@Table(name = "role", schema = "flowershop") 	//указывает на имя таблицы, которая будет отображаться в этой сущности.
public class Role {
	
	@Id
    @GeneratedValue
    @Column(name = "role_id", nullable = false) 	////name - название колонки в базе
	private Integer roleID;
	
	
	@Column(name = "role_name", nullable = false)
    private String roleName;


	public Integer getRoleID() {
		return roleID;
	}


	public void setRoleID(Integer roleID) {
		this.roleID = roleID;
	}


	public String getRoleName() {
		return roleName;
	}


	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	

}
