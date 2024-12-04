package edu.cqie.controller;


import edu.cqie.service.HelloService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {

    @Autowired
    HelloService helloService;

    @RequestMapping("/hello")
//    @ResponseBody
    public ModelAndView hello(){
        //接受请求参数
//        helloService.getByID(1);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("hello");
        modelAndView.addObject("user","刘星");
        return modelAndView;
    }
}
