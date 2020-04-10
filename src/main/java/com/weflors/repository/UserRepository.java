package com.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.entity.User;

//repository- это в спринге аналог DAO
//DAO (Data Access Object) – это слой объектов которые обеспечивают доступ к данным.
public interface UserRepository extends CrudRepository<User, Integer>{
	
	@Query("select b from User b where b.userName = :username")
	User findByUsername(@Param("username") String username);

}
