//package edu.poly.service;
//
//import java.util.ArrayList;
//import java.util.Collection;
//import java.util.List;
//
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//
//import edu.poly.entity.Account;
//
//public class CustomUserDetals implements UserDetails{
//
//	private static final long serialVersionUID = 1L;
//	private Account user;
//	public CustomUserDetals(Account user) {
//		this.user=user;
//	}
//	@Override
//	public Collection<? extends GrantedAuthority> getAuthorities() {
//		List<GrantedAuthority> role=new ArrayList<>();
//		if(user.getIsadmin()==true) {
//			role.add(new SimpleGrantedAuthority("ADMIN"));
//		}else {
//			role.add(new SimpleGrantedAuthority("USER"));
//		}
//		return role;
//		
//	}
//	@Override
//	public String getPassword() {
//		return user.getMatkhau();
//	}
//
//	@Override
//	public String getUsername() {
//		return user.getMand();
//	}
//
//	@Override
//	public boolean isAccountNonExpired() {
//		// TODO Auto-generated method stub
//		return true;
//	}
//
//	@Override
//	public boolean isAccountNonLocked() {
//		// TODO Auto-generated method stub
//		return true;
//	}
//
//	@Override
//	public boolean isCredentialsNonExpired() {
//		// TODO Auto-generated method stub
//		return true;
//	}
//
//	@Override
//	public boolean isEnabled() {
//		// TODO Auto-generated method stub
//		return true;
//	}
//}
