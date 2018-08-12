package net.lucidman.templates.springboot.springbootwebmybatis.service;

import lombok.extern.slf4j.Slf4j;
import net.lucidman.templates.springboot.springbootwebmybatis.mapper.UserMapper;
import net.lucidman.templates.springboot.springbootwebmybatis.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Service
@Slf4j
public class UserService implements UserDetailsService {

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    private UserMapper userMapper;

    public List<User> getUsers() {
        log.info("users : ", userMapper.getUsers().toString());
        return userMapper.getUsers();
    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {

        User user = userMapper.getUser(s);
        user.setAuthorities(getAuthorities(s));
        return user;
    }

    private Collection<? extends GrantedAuthority> getAuthorities(String s) {

        List<String> list = userMapper.getAuthority(s);
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        for(String autority_name : list) {
            authorities.add(new SimpleGrantedAuthority(autority_name));
        }
        return authorities;
    }
}
