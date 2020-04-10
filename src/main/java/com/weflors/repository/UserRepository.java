package com.weflors.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.weflors.entity.User;



//repository- это в спринге аналог DAO
//DAO (Data Access Object) – это слой объектов которые обеспечивают доступ к данным.
public interface UserRepository extends JpaRepository<User, Integer>{
	
	@Query("select b from User b where b.userName = :username")
	User findByUsername(@Param("username") String username);

}
