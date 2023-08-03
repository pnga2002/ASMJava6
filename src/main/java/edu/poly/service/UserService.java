//package edu.poly.service;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Primary;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
//import org.springframework.stereotype.Service;
//
//import edu.poly.dao.AccountDAO;
//import edu.poly.entity.Account;
//
//@Service
//@Primary
//public class UserService implements UserDetailsService{
//	@Autowired
//	AccountDAO dao;
//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{
//		Account user = dao.findByMaND(username);
//		List<Account> users = dao.findAll();
////		for(Account x:users) {
////			System.out.println(x.getMand());
////			System.out.println(x.getMatkhau());
////		}
//		
//		System.err.println(user);
//		if(user==null) {
//			throw new UsernameNotFoundException("User not found");
//		}
//		System.out.println(user.getMand());
//		return new CustomUserDetals(user);
//	}
//	public void loginFormOAuth(OAuth2AuthenticationToken oauth2) {
//		String username=oauth2.getPrincipal().getName();
//		String email=oauth2.getPrincipal().getAttribute("username");
//		String pass=oauth2.getPrincipal().getAttribute("password");
//		System.out.println("");
//		UserDetails user =User.withUsername(email).password(pass).roles("USER").build();
//		Authentication auth=new UsernamePasswordAuthenticationToken(user,null, user.getAuthorities());
//		SecurityContextHolder.getContext().setAuthentication(auth);
//
//		
//	}
//}
