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

	@Query("select role.roleName from RoleEntity role where role.roleId = :roleId")
	String getRoleNames(@Param("roleId") Integer roleId);
}
