package net.lucidman.templates.springboot.springbootwebmybatis.model;

import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.io.Serializable;

@Data
@Alias("User")
public class User implements Serializable {

    private String USER_ID;
    private String USER_NAME;

}
