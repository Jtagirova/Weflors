package com.weflors.repository;

import java.util.Collection;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.weflors.entity.RoleEntity;
import com.weflors.entity.UserRoleMapEntity;


public interface RoleRepository extends JpaRepository<RoleEntity, Integer>{

//	@Query("select b from RoleEntity b where b.userRoleMapsByUserId = :userRoleMapsByUserId")
//	//написать запрос к базе 
//	//TO_DO
//	List<String> getRoleNames(@Param("userRoleMapsByUserId") Collection<UserRoleMapEntity> userId);
}
