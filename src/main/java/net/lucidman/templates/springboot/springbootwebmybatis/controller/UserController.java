package net.lucidman.templates.springboot.springbootwebmybatis.controller;

import lombok.extern.slf4j.Slf4j;
import net.lucidman.templates.springboot.springbootwebmybatis.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class UserController {

    public static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    UserService service;

    @RequestMapping("/users")
    public String users(Model model) {
        model.addAttribute("users", service.getUsers());
        logger.info("UserController => user");
        return "user/list";
    }

    @RequestMapping("/login")
    public void loginForm() {

    }

//    public String login(@ModelAttribute AuthenticationRequest authenticationRequest, HttpSession httpSession, Model model) {
//
//    }

    @RequestMapping("/")
    public void index() {
        log.info("index");
    }

    @RequestMapping("/guest")
    public void forGuest() {
        log.info("guest");
    }

    @RequestMapping("/manager")
    public void forManager() {
        log.info("manager");
    }

    @RequestMapping("/admin")
    public void forAdmin() {
        log.info("admin");
    }

}
