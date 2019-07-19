package com.dubbo.dubbo_consumer.pageController;


import com.alibaba.dubbo.config.annotation.Reference;
import com.dubbo.dubbo_entity.entity.Type;
import com.dubbo.dubbo_interface.service.TypeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller("pageController")
@RequestMapping("/page/")
public class TypeController {
    @Reference(interfaceClass = TypeService.class)
    private TypeService typeService;

    @RequestMapping("getAllType")
    @ResponseBody
    public  List<Type> getAllType(){
        List<Type> types = typeService.allType();
        return types;
    }

}
