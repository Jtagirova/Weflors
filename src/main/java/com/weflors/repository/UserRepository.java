package com.weflors.repository;

import com.weflors.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;



//repository- это в спринге аналог DAO
//DAO (Data Access Object) – это слой объектов которые обеспечивают доступ к данным.
//JpaRepository -
public interface UserRepository extends JpaRepository<UserEntity, Integer>{
	
	@Query("select b from UserEntity b where b.userName = :username") //hql
	UserEntity findByUsername(@Param("username") String username);

}
