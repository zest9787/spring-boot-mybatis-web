package net.lucidman.templates.springboot.springbootwebmybatis.mapper;

import net.lucidman.templates.springboot.springbootwebmybatis.model.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {

    public List<User> getUsers();

    public List<String> getAuthority(String name);

    public User getUser(String s);

}
