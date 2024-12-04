package edu.cqie.controller;


import edu.cqie.entity.User;
import edu.cqie.service.UserService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.NoSuchElementException;


@Controller
@RequestMapping("/api/user")
public class UserController {

    private final static Log log = LogFactory.getLog(UserController.class);

    @Autowired
    private UserService userService;

    // 展示添加用户页面
    @GetMapping("/add")
    public String toAddPage() {
        return "user/add"; // 确保这指向正确的JSP
    }

    // 展示用户列表页面
    @GetMapping("/list")
    public String toAddListPage(Model model) {
        model.addAttribute("list", userService.list()); // 将用户列表添加到模型中
        return "user/list"; // 确保这指向正确的JSP
    }

    // 处理添加新用户
    @PostMapping("/add")
    public String add(User user) {
        log.info("请求参数内容为：" + user);
        userService.addUser(user);
        return "redirect:/api/user/list";
    }

    @RequestMapping("/delete")
    public String deleteUser(@RequestParam("name") String username){
        userService.deleteUser(username);
        return "redirect:/api/user/list";
    }
    //用户详情
    @RequestMapping("/detail")
    public String detail(@RequestParam("name") String username, Model model){
        User user = userService.getDetail(username);
        model.addAttribute("user",user );
        return "/user/detail";
    }

    //批量删除
    @PostMapping("/delete")
    public String deleteUsers(@RequestParam("userIds") List<Long> userIds) {
        userService.deleteUsers(userIds); // 调用批量删除方法
        return "redirect:/api/user/list";  // Redirect to user list
    }

    //修改
    @RequestMapping("/update")
    public String update(@RequestParam("username") String username, Model model){
        User user = userService.getDetail(username);
        model.addAttribute("user",user);
        return "user/update";
    }
    @RequestMapping("/toUpdate")
    public String toUpdate(User user){
        userService.update(user);
        return "redirect:/api/user/list";
    }
}