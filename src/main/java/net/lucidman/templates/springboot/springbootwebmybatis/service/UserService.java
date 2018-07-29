package net.lucidman.templates.springboot.springbootwebmybatis.service;

import lombok.extern.slf4j.Slf4j;
import net.lucidman.templates.springboot.springbootwebmybatis.mapper.UserMapper;
import net.lucidman.templates.springboot.springbootwebmybatis.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class UserService {

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    private UserMapper userMapper;

    public List<User> getUsers() {
        log.info("users : ", userMapper.getUsers().toString());
        return userMapper.getUsers();
    }
}
