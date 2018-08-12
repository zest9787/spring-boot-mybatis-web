package net.lucidman.templates.springboot.springbootwebmybatis.configuration;

import lombok.extern.slf4j.Slf4j;
import net.lucidman.templates.springboot.springbootwebmybatis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
@Slf4j
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserService userService;

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/css/**", "/script/**", "image/**", "/fonts/**", "lib/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        log.info("security configure");
        http
            .authorizeRequests()
                .antMatchers("/", "/main", "/login").permitAll()
                .anyRequest().authenticated()
                .and()
            .authorizeRequests()
                .antMatchers("/guest/**").permitAll()
                .and()
            .authorizeRequests()
                .antMatchers("/manager/**").hasRole("MANAGER")
                .and()
            .formLogin()
                .loginPage("/login")
                .and()
            .logout()
                .permitAll();
//        http
//            .authorizeRequests()
//                .antMatchers("/admin/**").hasRole("ADMIN")
//
//            .antMatchers("/**").permitAll()
//            ;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService);
    }
}
