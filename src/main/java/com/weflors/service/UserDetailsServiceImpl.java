package com.weflors.service;

import java.util.ArrayList;
import java.util.List;

import com.weflors.entity.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.weflors.repository.UserRepository;

@Service//сказать  Spring управлять им как  Spring BEAN.
//UserDetailsService это центральный интерфейс в  Spring Security. Это сервис для поиска  "Аккаунт пользователя и роли того пользователя". Используется  Spring Security каждый раз, когда пользователь входит в систему. 
public class UserDetailsServiceImpl implements UserDetailsService{

	@Autowired
	private UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		//List<User> users = userRepository.findAll();
		UserEntity user = userRepository.findByUsername(username);
  
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

}
