package com.weflors.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.weflors.service.UserDetailsServiceImpl;

@Configuration // Данная аннотация говорит  Spring что он является классом конфигурации, поэтому он будет анализирован с помощью  Spring во время запуска данного приложения. 
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	private UserDetailsServiceImpl userDetailsService;
	
	@Autowired
    private DataSource dataSource;

	@Bean
    public BCryptPasswordEncoder passwordEncoder() {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        return bCryptPasswordEncoder;
    }
	
	 @Autowired
	 public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception { 
	 
	        // Setting Service to find User in the database.
	        // And Setting PassswordEncoder
	        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());     
	 
	    }
	 
	    @Override
	    protected void configure(HttpSecurity http) throws Exception {
	 
	        http.csrf().disable();
	 
	        // The pages does not require login
	        http.authorizeRequests().antMatchers("/", "/login", "/logout").permitAll();
	 
	        // /hello(любая другая после админа) page requires login as ROLE_USER or ROLE_ADMIN.
	        // If no login, it will redirect to /login page.
	       //TO_DO
	        http.authorizeRequests().antMatchers("/hello").access("hasAnyRole('user', 'admin')");
	 
	        // For ADMIN only.
	        //TO_DO
	        //http.authorizeRequests().antMatchers("/admin").access("hasRole('admin')");
	 
	        // When the user has logged in as XX.
	        // But access a page that requires role YY,
	        // AccessDeniedException will be thrown.
	       // http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");
	 
	        // Config for Login Form
	        http.authorizeRequests().and().formLogin()//
	                // Submit URL of login page.
	                .loginProcessingUrl("/j_spring_security_check") // Submit URL
	                .loginPage("/login")//
	                .defaultSuccessUrl("/hello")//
	                .failureUrl("/login?error=true")//
	                .usernameParameter("j_username")//
	                .passwordParameter("j_password")
	                // Config for Logout Page
	                .and().logout().logoutUrl("/logout").logoutSuccessUrl("/logoutSuccessful");
	 
	    }
}
