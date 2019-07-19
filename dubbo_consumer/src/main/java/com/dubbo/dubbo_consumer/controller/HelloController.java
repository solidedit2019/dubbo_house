package com.dubbo.dubbo_consumer.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.dubbo.dubbo_interface.service.HelloService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class HelloController {
    @Reference(interfaceClass = HelloService.class,check = false)
    private HelloService helloService;

    @RequestMapping("getHello")
    @ResponseBody
    public String getHello(){
        return  helloService.getHello();
    }
}
