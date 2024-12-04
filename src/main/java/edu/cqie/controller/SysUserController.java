package edu.cqie.controller;

import edu.cqie.entity.Result;
import edu.cqie.entity.User;
import edu.cqie.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("user")
public class SysUserController {

    @Autowired
    UserService userService;
    @RequestMapping("/list")
    @ResponseBody
    public Result list(){
        return  Result.ok("获取成功！",userService.list());
    }

    @RequestMapping("/add")
    @ResponseBody
    public Result add(@RequestBody User user){
        userService.add(user);
//        System.out.println(user.getUserId());
//        model.addAttribute("list",userService.list());
        return  Result.ok();
    }


    @RequestMapping("/edit")
    @ResponseBody
    public Result edit(User user){
        userService.edit(user);
        return  Result.ok();
    }

    //删除
    @GetMapping("/remove/{id}")
    @ResponseBody
    public Result remove(@PathVariable Long id){
        userService.remove(id);
        return  Result.ok();
    }

    @GetMapping("/delete")
    @ResponseBody
    public Result deleteUser(@RequestParam("name") String username){
        userService.deleteUser(username);
        return  Result.ok();
    }

    //批量删除
    @PostMapping("/remove")
    @ResponseBody
    public Result remove(@RequestParam List<Long> ids){
        userService.remove(ids);
        return  Result.ok();
    }

    //获取详情
    @PostMapping("/get/{id}")
    @ResponseBody
    public Result get(@RequestParam("id") Long id){
        userService.get(id);
        return  Result.ok();
    }

    @GetMapping("/toAddPage")
    public String toAddPage(){
        return "sysuser/add";
    }

    @GetMapping("/toUserPage")
    public String toUserPage(){
        return "sysuser/list";
    }

    @GetMapping("/toEditPage/{id}")
    public String toEditPage(@PathVariable Long id,Model model){
        model.addAttribute("id",id);
        return "sysuser/edit";
    }
}
