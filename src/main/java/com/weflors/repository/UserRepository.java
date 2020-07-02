package com.weflors.repository;

import com.weflors.entity.UserEntity;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;


//repository- это в спринге аналог DAO
//DAO (Data Access Object) – это слой объектов которые обеспечивают доступ к данным.
//JpaRepository -
public interface UserRepository extends JpaRepository<UserEntity, Integer>{
	
	@Query("select b from UserEntity b where b.login = :login") //hql
	UserEntity findByUsername(@Param("login") String username);
	
    @Modifying
    @Transactional
    @Query("delete from UserEntity where userId = :userId")
    void deleteByUserId(@Param("userId") Integer userId);
    
    @Modifying
	@Transactional
	@Query(value ="update flowershop.user set e_mail = :userEmail, 	user_name = :userName, 	password = :userPass, user_lastname = :userLastName,"
			+ " login = :userLogin, phone = :userPhone  where user_id = :userId",
			nativeQuery = true)
	void updateUserInformation(@Param("userEmail") String userEmail,
								@Param("userName") String userName,
								@Param("userPass") String userPass,
								@Param("userLastName") String userLastName,
								@Param("userLogin") String userLogin,
								@Param("userPhone") String userPhone,
								@Param("userId") Integer userId);
    
    @Query("select b from UserEntity b where b.userId = :userId")
	UserEntity existById(@Param("userId") Integer userId);
    
    @Query("select b from UserEntity b where b.login = :login and b.eMail = :eMail")
	Optional<UserEntity> findUserByLoginAndEmail(@Param("login") String login, @Param("eMail") String eMail);

}
