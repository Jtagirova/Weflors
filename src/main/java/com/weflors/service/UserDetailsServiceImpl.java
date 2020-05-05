package com.weflors.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import com.weflors.entity.RoleEntity;
import com.weflors.entity.UserEntity;
import com.weflors.entity.UserRoleMapEntity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.weflors.repository.RoleRepository;
import com.weflors.repository.UserRepository;
import com.weflors.repository.UserRoleMapRepository;

@Service//сказать  Spring управлять им как  Spring BEAN.
//UserDetailsService это центральный интерфейс в  Spring Security. Это сервис для поиска  "Аккаунт пользователя и роли того пользователя". Используется  Spring Security каждый раз, когда пользователь входит в систему. 
public class UserDetailsServiceImpl implements UserDetailsService{

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
    RoleRepository roleRepository;
	
	@Autowired
	UserRoleMapRepository userRoleMapRepository;
	
	@Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
		//List<User> users = userRepository.findAll();
		UserEntity user = userRepository.findByUsername(login);
  
        // [ROLE_USER, ROLE_ADMIN,..]
        //@TO_DO
        List<String> roleNames = new ArrayList<String>();//написать потом с базой
        roleNames.add("user");
       // roleNames.add("admin");
        //this.appRoleDAO.getRoleNames(user.getUserId());
 
        List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
        if (roleNames != null) {
            for (String role : roleNames) {
                // ROLE_USER, ROLE_ADMIN,..
                GrantedAuthority authority = new SimpleGrantedAuthority(role);
                grantList.add(authority);
            }
        }
 
        UserDetails userDetails = (UserDetails) new org.springframework.security.core.userdetails.User(user.getUserName(), 
        		user.getPassword(), grantList);
 
        return userDetails;
	}
	
	public boolean saveUser(UserEntity user) {
		UserEntity userFromDB = userRepository.findByUsername(user.getLogin());
        if (userFromDB != null) {
            return false;
        }

        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        
        userRepository.save(user);
        userRoleMapRepository.saveUserRoleMap(user.getUserId(), 2);
        return true;
    }

}
