package com.weflors.entity;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity 		//указывает, что данный бин (класс) является сущностью.
@Table(name = "user", schema = "flowershop") 	//указывает на имя таблицы, которая будет отображаться в этой сущности.
public class User{
	
	
	@Id
    @GeneratedValue
    @Column(name = "user_id", nullable = false) //name - название колонки в базе
	private Integer userID;
	
	@Column(name = "user_mail", nullable = false)
    private String userEmail;
	
	@Column(name = "user_name", nullable = false)
    private String userName;
	
	@Column(name = "password", nullable = false)
    private String password;

//	public Integer getUserID() {
//		return userID;
//	}
//
//	public void setUserID(Integer userID) {
//		this.userID = userID;
//	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	
	

}
