package com.weflors.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;


import com.weflors.entity.UserRoleMapEntity;

import com.weflors.entity.UserRoleMapEntityPK;

public interface UserRoleMapRepository extends JpaRepository<UserRoleMapEntity, UserRoleMapEntityPK>{
	
	@Modifying
	@Query(value = "insert into postgres.flowershop.user_role_map(user_id, role_id) values (:userId,:roleId)", nativeQuery = true)
	@Transactional 
	void saveUserRoleMap(@Param("userId") Integer userId, @Param("roleId") Integer roleId);
	
	@Query(value = "select b.roleId from UserRoleMapEntity b where b.userId = :userId")
	List<Integer> getUserRoleId(@Param("userId") Integer userID);
	
	@Modifying
	@Transactional
	@Query(value = "delete from UserRoleMapEntity b where b.userId = :userId")
	void deleteUserRoleById(@Param("userId") Integer userId);
	
}
