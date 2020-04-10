package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.entity.Role;


public interface RoleRepository extends CrudRepository<Role, Integer>{

	//@Query("select b from UserRoleMap b where b.userName = :userId")
	//написать запрос к базе 
	List<String> getRoleNames(@Param("userId") String userId);
}
