package edu.poly;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import edu.poly.dao.AccountDAO;
import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class AuthConfig {
//	private final UserDetailsService userDetailsService;
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.csrf(csrf -> csrf.disable()).cors(cors -> cors.disable())
				.authorizeHttpRequests(authz -> authz.anyRequest().permitAll())
				.formLogin(login -> login.loginPage("/account/login/form").loginProcessingUrl("/account/login")
						.defaultSuccessUrl("/home", false).failureUrl("/account/login/error")
						.usernameParameter("username").passwordParameter("password"))
				.rememberMe(remem -> remem.rememberMeParameter("remember"))
				.logout(logout -> logout.logoutUrl("/account/logout").logoutSuccessUrl("/home"));
		http.exceptionHandling(ex -> ex.accessDeniedPage("/account/access/denied"));
//		http.csrf(csrf -> csrf.disable()).authorizeHttpRequests(auth -> auth
//		        .requestMatchers("/cart/**").hasAnyAuthority("USER", "ADMIN")
//		        .anyRequest().permitAll()
//		    )
//	  .oauth2Login(auth -> auth.loginPage("/account/login/form")
//			  .defaultSuccessUrl("/account/login/success", true)
//			  
//			  .authorizationEndpoint( t -> t.baseUri("/oauth2/authorization")
//					  
//					  )
//			  )
//
//			.formLogin(form -> form.loginPage("/account/login/form").loginProcessingUrl("/account/login/form")
//					.defaultSuccessUrl("/home", true)
//					)
//			;
		return http.build();
	}
	@Bean
  UserDetailsService userDetailManager() {    	
		return new InMemoryUserDetailsManager(
				User.withUsername("ND01").password(passwordEncoder().encode("123")).roles("USER").build(),
				User.withUsername("ND02").password(passwordEncoder().encode("123")).roles("USER").build(),
				User.withUsername("ND03").password(passwordEncoder().encode("123")).roles("USER").build(),
				User.withUsername("ND04").password(passwordEncoder().encode("123")).roles("USER").build(),
				User.withUsername("ND05").password(passwordEncoder().encode("123")).roles("USER").build(),
				User.withUsername("ND06").password(passwordEncoder().encode("123")).roles("USER").build(),
				
				
				User.withUsername("AD01").password(passwordEncoder().encode("123")).roles("USER", "ADMIN")
						.build());
	}
//	@Bean
//	public DaoAuthenticationProvider daoAuthenticationProvider() {
//		DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
//		daoAuthenticationProvider.setUserDetailsService(userDetailsService);
//		daoAuthenticationProvider.setPasswordEncoder(passwordEncoder());
//		return daoAuthenticationProvider;
//	}
//
//
//	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
//	}

	
	

	
	
	
	
}
