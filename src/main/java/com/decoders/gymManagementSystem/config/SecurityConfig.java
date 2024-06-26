package com.decoders.gymManagementSystem.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.decoders.gymManagementSystem.service.GymUserService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private GymUserService gymUserService;

	@Autowired
	private EncoderConfig encoderConfig;

	@Autowired
	@Override
	protected void configure(AuthenticationManagerBuilder authority) throws Exception {
		authority.userDetailsService(gymUserService).passwordEncoder(encoderConfig.passwordEncoder());
	}

	@Override
	public void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/register/**").permitAll()
		.antMatchers("/").permitAll().anyRequest().authenticated().and().formLogin()
				.loginPage("/loginpage").failureUrl("/loginerror").loginProcessingUrl("/login").permitAll().and()
				.logout().logoutSuccessUrl("/index");
		http.csrf().disable();
	}

}
